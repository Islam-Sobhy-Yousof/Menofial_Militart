import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class AnimatedImage extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  const AnimatedImage({
    super.key,
    required this.name,
    this.width = AppSize.s100,
    this.height = AppSize.s100,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Lottie.asset(name),
    );
  }
}
