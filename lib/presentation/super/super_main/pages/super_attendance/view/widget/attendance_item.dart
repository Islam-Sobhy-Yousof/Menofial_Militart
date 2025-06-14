import 'package:flutter/material.dart';
import 'package:menofia_military/app/helper_functions.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_attendance/view/widget/attendance_item_text.dart';

class AttendanceItem extends StatelessWidget {
  final Attendance item;
  final VoidCallback onTap;
  const AttendanceItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSize.s12,
        ),
        padding: EdgeInsets.symmetric(
          vertical: AppSize.s30,
          horizontal: AppSize.s12,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.shadow1,
              offset: Offset(AppSize.s0, AppSize.s3),
              blurRadius: AppSize.s6,
            ),
          ],
          border: Border.all(
            color: ColorsManager.lightGrey,
            width: AppFractions.f5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AttendanceItemText(
              date: item.dates,
            ),
            AttendanceItemText(
              date: convertToCountableNumber(
                number: item.studentsPresent.length,
              ),
              color: ColorsManager.lightGrey,
            ),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.arrow_forward_ios,
                size: AppSize.s20,
                color: ColorsManager.grey,
              ),
            )
          ],
        ));
  }
}
