import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_project/application/configs/app_color.dart';
import 'package:management_project/presentation/modules/projects/controllers/project_controller.dart';
import 'package:management_project/presentation/shared/card_project.dart';

class ProjectPage extends GetView<ProjectController> {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 2.0,
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: Text(
              "Proyek",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 70,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.buttonList.length,
                    itemBuilder: (context, index) {
                      return Obx(() => Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  controller.selectedBtnIndex.value = index;
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: controller.selectedBtnIndex.value == index
                                            ? AppColor.colorTitle
                                            : AppColor.colorBorder),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                ),
                                child: Text(
                                  controller.buttonList[index],
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: controller.selectedBtnIndex.value == index
                                            ? AppColor.colorTitle
                                            : Colors.black,
                                        fontWeight: controller.selectedBtnIndex.value == index
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              )
                            ],
                          ));
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.projects.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CardProject(projectModel: controller.projects[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
