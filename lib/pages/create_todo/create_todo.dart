import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:student_app/components/custom_tf.dart';
import 'package:student_app/constant.dart';
import 'package:student_app/controllers/create_todo_controller.dart';

class CreateToDo extends StatelessWidget {
  CreateToDo({super.key});

  final CreateToDoController _getController = Get.put<CreateToDoController>(
    CreateToDoController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: getScreenSize(context).width,
          height: getScreenSize(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: 'Title here',
                textEditingController: _getController.title,
                maxLine: 1,
                width: getScreenSize(context).width * .7,
              ),
              SizedBox(
                height: getScreenSize(context).height * .05,
              ),
              CustomTextField(
                hintText: 'Create Your Task here',
                textEditingController: _getController.task,
              ),
              InkWell(
                onTap: () async {
                  Logger().i("clicked");
                  await _getController.createToDo();
                },
                child: Container(
                  width: getScreenSize(context).width * .7,
                  height: getScreenSize(context).height * .08,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: Colors.black12,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, 2),
                        blurRadius: 10,
                        spreadRadius: -5,
                        color: Colors.black.withOpacity(.4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Add ToDo",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
