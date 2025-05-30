import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color? color;
  const CustomProgressIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: color ?? ColorsManager.primary,
    ),);
  }
}