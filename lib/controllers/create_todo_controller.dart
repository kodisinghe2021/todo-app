import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:student_app/components/message_boxes.dart';
import 'package:student_app/constant.dart';
import 'package:student_app/model/task_model.dart';
import 'package:student_app/routes/paths.dart';

class CreateToDoController extends GetxController {
  // initilaize TextEditing controllers
  TextEditingController title = TextEditingController();
  TextEditingController task = TextEditingController();

  Future<void> createToDo() async {
    //data validation
    if (title.text.isEmpty || task.text.isEmpty) {
      alertBoxWarning("Fields cannot be empty");
      return;
    }

    // create map for create task
    Map<String, dynamic> request = TaskModel(
      userId: 'userABC',
      id: '1',
      title: title.text,
      body: task.text,
    ).toJson();

    final uri = apiUri;

    try {
      // send create data request
      final response = await http.post(uri, body: request);

      Logger().i("Status code ${response.statusCode}");

      if (response.statusCode == 201) {
        Logger().i(response.body);
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
