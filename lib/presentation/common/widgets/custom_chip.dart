import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    this.width = AppSize.s70,
    this.height = AppSize.s50,
    this.color = ColorsManager.chipColor,
    this.radius = AppSize.s10,
    this.textColor = ColorsManager.primary,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppPadding.p8,
      vertical: AppPadding.p8,
    ),
    required this.child,
  });

  final double? width;
  final double? height;
  final Color? color;
  final double radius;
  final Widget child;
  final Color? textColor;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
