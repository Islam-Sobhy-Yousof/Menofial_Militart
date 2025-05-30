import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class StateRendererMessage extends StatelessWidget {
  final String message;
  const StateRendererMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(
          AppPadding.p8,
        ),
        child: Text(
          textAlign: TextAlign.center,
          message,
          style: getRegularStyle(
            color: ColorsManager.black,
            fontSize: FontSize.s18,
          ),
        ),
      ),
    );
  }
}
