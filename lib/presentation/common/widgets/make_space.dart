import 'package:flutter/material.dart';

class MakeSpace extends StatelessWidget {
  final double? height;
  final double? width;
  const MakeSpace({super.key,  this.height = 0.0, this.width = 0.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ,
      width: width,
    );
  }
}