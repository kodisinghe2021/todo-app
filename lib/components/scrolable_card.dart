import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:student_app/components/task_card.dart';
import 'package:student_app/controllers/home_controller.dart';
import 'package:student_app/model/task_model.dart';

class ScrollableCard extends StatelessWidget {
  ScrollableCard({
    required this.currentModel,
    required this.currentIndex,
    super.key,
  });

  final HomePageController _getController =
      Get.put<HomePageController>(HomePageController());

  final TaskModel currentModel;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          // ---------------------Slidable Update button
          SlidableAction(
            padding: const EdgeInsets.only(top: 40),
            onPressed: (context) {
              Logger().i("Click Update");
              // -----make visible the update window
              _getController.isUSVisible.value = true;

              // ----- set current task id to update
              _getController.currentTaskID = currentModel.id;
            },
            backgroundColor: const Color(0xFF793FDF),
            foregroundColor: Colors.white,
            icon: Icons.update_rounded,
            label: 'Update',
          ),

          //----------------------Slidable Delete button
          SlidableAction(
            padding: const EdgeInsets.only(top: 40),
            onPressed: (context) async {
              Logger().i("Delete -- $currentIndex");
              await _getController.deleteTask(currentModel.id);
            },
            backgroundColor: const Color(0xFFEC53B0),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      //----------------------------Slding End Widjet
      child: TaskCard(
        currentIndex: currentIndex,
        currentModel: currentModel,
      ),
    );
  }
}
