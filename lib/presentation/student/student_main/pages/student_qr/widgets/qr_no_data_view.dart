import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';

class QrNoDataView extends StatelessWidget {
  const QrNoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        StringsManager.noQRCodeData,
        style: getBoldStyle(
          color: ColorsManager.black,
        ),
      ),
    );
  }
}
