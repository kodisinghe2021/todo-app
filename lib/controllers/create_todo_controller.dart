import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:student_app/api/user_status.dart';
import 'package:student_app/components/message_boxes.dart';
import 'package:student_app/constant.dart';
import 'package:student_app/model/task_model.dart';
import 'package:student_app/routes/paths.dart';

class CreateToDoController extends GetxController {
  // initilaize TextEditing controllers
  TextEditingController title = TextEditingController();
  TextEditingController task = TextEditingController();

  // inizilizing local storage
  final LocalUserStatus _userStatus = LocalUserStatus();

  Future<void> createToDo() async {
    //data validation
    if (title.text.isEmpty || task.text.isEmpty) {
      alertBoxWarning("Fields cannot be empty");
      return;
    }
    // get userID
    String uID = await _userStatus.getUserID();
    // create map for create task
    Map<String, dynamic> request = TaskModel(
      userId: uID,
      id: '1',
      title: title.text,
      body: task.text,
    ).toJson();

    try {
      final uri = Uri.parse(apiUri);

      // send create data request
      final response = await http.post(uri, body: request);

      if (response.statusCode == 201) {
        alertBoxSuccess("Successfully created the task");

        //clear the text editing controllers
        task.clear();
        title.clear();

        // back to home
        Get.offAllNamed(Routes.home);

        return;
      }

      alertBoxError("couldn't delete the task");
    } catch (e) {
      alertBoxError("Somthing wrong");
    }
  }
}
