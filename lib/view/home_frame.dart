import 'package:budget_animation/controller/frame_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeFrame extends StatelessWidget {
  HomeFrame({super.key});

  FrameController controller = Get.put(FrameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BudgetAnimation'),
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Obx(() => Stack(
                children: [
                  const Center(child: Text("Some other screen")),
                  controller.isBudgetFloatingActionButtonModuleOpen.value
                      ? GestureDetector(
                          onTap: () {
                            controller.changeBudgetFloatingActionButtonStatus(false);
                          },
                          child: Container(
                            height: Get.height,
                            width: Get.width,
                            color: Colors.black45,
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  bottom: controller.startBudgetFloatingActionButtonAnimation.value ? 20 : -80,
                                  left: Get.width / 5,
                                  duration: const Duration(
                                    milliseconds: 200,
                                  ),
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.browse_gallery,
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  bottom: controller.startBudgetFloatingActionButtonAnimation.value ? 90 : -80,
                                  left: Get.width / 5,
                                  duration: const Duration(
                                    milliseconds: 200,
                                  ),
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.keyboard_double_arrow_down,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              )),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: ((value) {
              controller.selectedFrameIndex.value = value;
              if (value == 1) {
                if (controller.isBudgetFloatingActionButtonModuleOpen.value) {
                  controller.changeBudgetFloatingActionButtonStatus(false);
                } else {
                  controller.changeBudgetFloatingActionButtonStatus(true);
                }
              } else {
                controller.changeBudgetFloatingActionButtonStatus(false);
                controller.currentFrameIndex.value = value;
              }
            }),
            currentIndex: controller.selectedFrameIndex.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.money,
                ),
                label: "Budget",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.checklist,
                ),
                label: "Checklist",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                ),
                label: "Guest",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Settings",
              ),
            ],
          ),
        ));
  }
}
