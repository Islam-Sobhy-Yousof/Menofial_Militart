import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class PopupDialog extends StatelessWidget {
  final Widget child;

  const PopupDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s14,
        ),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: ColorsManager.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppSize.s14,
          ),
          color: ColorsManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorsManager.shadow1,
            ),
          ],
          shape: BoxShape.rectangle,
        ),
        child: child,
      ),
    );
  }
}
