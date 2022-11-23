import 'package:budget_animation/view/home_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main(List<String> args) {
  runApp(const BudgetAnimationApp());
}

class BudgetAnimationApp extends StatelessWidget {
  const BudgetAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeFrame(),
    );
  }
}
