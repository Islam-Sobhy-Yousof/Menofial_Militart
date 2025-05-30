import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {
  final List<Widget> children;
  const DialogContent({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
