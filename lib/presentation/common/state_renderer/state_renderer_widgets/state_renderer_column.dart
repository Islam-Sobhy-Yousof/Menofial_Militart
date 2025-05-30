import 'package:flutter/material.dart';

class StateRendererColumn extends StatelessWidget {
  final List<Widget> children;
  const StateRendererColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}