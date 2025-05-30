
import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';


// ignore: must_be_immutable
class RetryButton extends StatelessWidget {
  final String title;
  final StateRendererType stateRendererType;

  VoidCallback onPressed;
  RetryButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.stateRendererType,
  
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: ElevatedButton(
          onPressed: (){
            onPressed();
          },
          child: Text(
            title,
            style: getRegularStyle(
              color: ColorsManager.white,
            ),
          ),
        ),
      ),
    );
  }
}
