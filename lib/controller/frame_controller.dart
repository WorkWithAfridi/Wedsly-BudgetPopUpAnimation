import 'package:get/get.dart';

class FrameController extends GetxController {
  var isBudgetFloatingActionButtonModuleOpen = false.obs;
  var selectedFrameIndex = 0.obs;
  var currentFrameIndex = 0.obs;
  var startBudgetFloatingActionButtonAnimation = false.obs;

  changeBudgetFloatingActionButtonStatus(bool status) async {
    if (status) {
      isBudgetFloatingActionButtonModuleOpen.value = status;
      await Future.delayed(const Duration(milliseconds: 100)).then((_) {
        startBudgetFloatingActionButtonAnimation.value = true;
      });
    } else {
      startBudgetFloatingActionButtonAnimation.value = status;
      await Future.delayed(const Duration(milliseconds: 100)).then((_) {
        isBudgetFloatingActionButtonModuleOpen.value = status;
        selectedFrameIndex.value = currentFrameIndex.value;
      });
    }
  }
}
