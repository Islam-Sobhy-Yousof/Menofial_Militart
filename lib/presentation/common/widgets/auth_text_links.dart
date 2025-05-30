import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';

class AuthTextLinks extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const AuthTextLinks({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: getBoldStyle(
          color: ColorsManager.primary,
          fontSize: FontSize.s20,
        ),
      ),
    );
  }
}
