import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';

class NoReportToView extends StatelessWidget {
  const NoReportToView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        StringsManager.noContent,
        style: getBoldStyle(
          color: ColorsManager.black,
          fontSize: FontSize.s20,
        ),
      ),
    );
  }
}
