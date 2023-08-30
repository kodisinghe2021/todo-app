import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/components/scrolable_card.dart';
import 'package:student_app/components/update_card.dart';
import 'package:student_app/controllers/home_controller.dart';
import 'package:student_app/model/task_model.dart';
import 'package:student_app/routes/paths.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomePageController _getController =
      Get.put<HomePageController>(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("ToDo List"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            FutureBuilder<List<TaskModel>>(
              future: _getController.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text("No Data"),
                  );
                }

                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ScrollableCard(
                        currentIndex: index,
                        currentModel: snapshot.data![index],
                      );
                    },
                  );
                }

                return const Center(
                  child: Text("Somthing went wrong"),
                );
              },
            ),
            Visibility(
              visible: _getController.isUSVisible.value,
              child: Center(
                child: UpdateCard(),
              ),
            ),
          ],
        ),
        floatingActionButton: _getController.isUSVisible.value
            ? null
            : FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.createtodo);
                },
                child: const Icon(Icons.add),
              ),
      ),
    );
  }
}
