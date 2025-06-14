import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';

class SuperExamsView extends StatelessWidget {
  const SuperExamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'قريباً',
        style: Theme.of(context).textTheme.headlineLarge?.apply(
              color: ColorsManager.darkGrey,
            ),
      ),
    );
  }
}
