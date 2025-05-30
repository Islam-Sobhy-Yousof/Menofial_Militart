import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  VoidCallback? onTap;
  final double widht;
  final double height;
  bool? snapshotData;
  final String buttonText;
  TextStyle? buttonTextStyle;
  PrimaryButton({
    super.key,
    this.widht = double.infinity,
    this.height = AppSize.s40,
    required this.buttonText,
    this.snapshotData,
    this.buttonTextStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s40,
      child: ElevatedButton(
        onPressed: (snapshotData ?? false)
            ? onTap
            : null,
        child: Text(
          buttonText,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
