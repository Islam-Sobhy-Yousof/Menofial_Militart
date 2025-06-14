import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    this.width = AppSize.s200,
    this.height = AppSize.s200,
    this.raduis = AppSize.s16,
    required this.child,
  });

  final double? width;
  final double? height;
  final double raduis;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        raduis,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
       
          borderRadius: BorderRadius.circular(
            raduis,
          ),
        ),
        child: child,
      ),
    );
  }
}
