import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class AttendanceItemText extends StatelessWidget {
  final String date;
  final Color? color;
  const AttendanceItemText({
    super.key,
    required this.date,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s110,
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p2,
      ),
      decoration: BoxDecoration(
        color: color ?? ColorsManager.lightPrimary,
        borderRadius: BorderRadius.circular(
          AppSize.s12,
        ),
      ),
      child: Center(
        child: Text(
          date,
          style: getBoldStyle(
            color: ColorsManager.white,
            fontSize: FontSize.s14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
