import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:student_app/components/message_boxes.dart';
import 'package:student_app/constant.dart';
import 'package:student_app/model/task_model.dart';

class HomePageController extends GetxController {
  // update scree visibility
  RxBool isUSVisible = RxBool(false);
  RxBool isUpdate = RxBool(false);
  RxBool isExpand = RxBool(false);

  // current index
  String currentTaskID = "";
  // TrxtEditing controllers for updating data
  TextEditingController titleToUp = TextEditingController();
  TextEditingController taskToUp = TextEditingController();

//&--------------------------------------------------------------------

//--------------------------------------------------------------------

//&--------------------------------------------------------------------
// fetch data from the api
  Future<List<TaskModel>> fetchData() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body) as List<dynamic>;

        return list
            .map((dynamic item) => TaskModel.fromJson(item))
            .toList(growable: false);
      } else {
        alertBoxError('Failed to load data');
        return [];
      }
    } catch (e) {
      alertBoxError('Somthing went wrong');
      return [];
    }
  }
//--------------------------------------------------------------------

//&-------------------------------------------------------------------
// delete data

  Future<TaskModel?> deleteTask(String taskID) async {
    // isUpdate.value = true;
    Logger().i("Inside the delete ${isUpdate.value}");
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/$taskID');
    Logger().i("uri Executed");
    try {
      final response = await http.delete(uri);
      Logger().i("responses is gotted ${response.statusCode}");
      Logger().i("responses is gotted ${response.body}");
      if (response.statusCode == 200) {
        alertBoxSuccess("Your Task id- $taskID is deleted");
        //  isUpdate.value = false;
        return null;
      } else {
        alertBoxError("couldn't delete the task");
        //  isUpdate.value = false;
        return null;
      }
    } catch (e) {
      alertBoxError("Somthing went Wrong");
      //  isUpdate.value = false;
      return null;
    }
  }
//--------------------------------------------------------------------

//&-------------------------------------------------------------------
// Update data

  Future<void> updateTask(String title, String body, String indexID) async {
    Map<String, dynamic> request = TaskModel(
      userId: userID,
      id: indexID,
      title: title,
      body: body,
    ).toJson();
    // validation
    if (taskToUp.text.isEmpty || titleToUp.text.isEmpty) {
      alertBoxWarning("Field cannot be empty");
      return;
    }
    try {
      final uri =
          Uri.parse('https://jsonplaceholder.typicode.com/todos/$indexID');
      Logger().i("Inside the update --$indexID");

      final response = await http.put(uri, body: request);
      Logger().i("request sent --${response.statusCode}");
      Logger().i("request sent --${response.body}");

      if (response.statusCode == 200) {
        alertBoxSuccess("Successfully updated with ID $indexID");
        // reset the TextEditing controller
        titleToUp.clear();
        taskToUp.clear();

        // return the body from the response
        TaskModel.fromJson(json.decode(response.body));

        //if update success then closeup this
        isUSVisible.value = false;
        
      } else {
        alertBoxError("couldn't update the task");
        return;
      }
    } catch (e) {
      alertBoxError("Somthing went Wrong");
      return;
    }
  }
}
