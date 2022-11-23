import 'package:get/get.dart';

class FrameController extends GetxController {
  var isBudgetFloatingActionButtonModuleOpen = false.obs;
  var startBudgetFloatingActionButtonAnimation = false.obs;

  var selectedFrameIndex = 0.obs;
  var currentFrameIndex = 0.obs;

  changeBudgetFloatingActionButtonStatus(bool status) async {
    if (status) {
      await _openBudgetPopupModule(status);
    } else {
      await _closeBudgetPopupModule(status);
    }
  }

  Future<void> _closeBudgetPopupModule(bool status) async {
    startBudgetFloatingActionButtonAnimation.value = status;
    await Future.delayed(const Duration(milliseconds: 100)).then((_) {
      isBudgetFloatingActionButtonModuleOpen.value = status;
      selectedFrameIndex.value = currentFrameIndex.value;
    });
  }

  Future<void> _openBudgetPopupModule(bool status) async {
    isBudgetFloatingActionButtonModuleOpen.value = status;
    await Future.delayed(const Duration(milliseconds: 100)).then((_) {
      startBudgetFloatingActionButtonAnimation.value = true;
    });
  }
}
