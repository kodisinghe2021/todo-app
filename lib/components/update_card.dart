import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:student_app/components/custom_tf.dart';
import 'package:student_app/constant.dart';
import 'package:student_app/controllers/home_controller.dart';

class UpdateCard extends StatelessWidget {
  UpdateCard({
    super.key,
  });

  final HomePageController _getController =
      Get.put<HomePageController>(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenSize(context).width * .9,
      height: getScreenSize(context).height * .6,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text("Title"),
          CustomTextField(
            hintText: "Enter Title here",
            textEditingController: _getController.titleToUp,
            maxLine: 1,
          ),
          const SizedBox(height: 30),
          const Text("Task"),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: "Enter Task here",
            textEditingController: _getController.taskToUp,
          ),
          const Spacer(),
          SizedBox(
            height: getScreenSize(context).height * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //-----------------------Go To Back
                CircleIcon(
                  onTap: () async {
                    Logger().i("Back");
                    // close this window
                    _getController.isUSVisible.value = false;
                  },
                  icon: Icons.arrow_back,
                ),
                const SizedBox(width: 20),

                //-------------------------------Update
                CircleIcon(
                  onTap: () async {
                    Logger().i("Update");
                    await _getController.updateTask(
                      _getController.titleToUp.text,
                      _getController.taskToUp.text,
                      _getController.currentTaskID,
                    );
                  },
                  icon: Icons.update,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    required this.onTap,
    required this.icon,
    super.key,
  });

  final Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: Center(
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
