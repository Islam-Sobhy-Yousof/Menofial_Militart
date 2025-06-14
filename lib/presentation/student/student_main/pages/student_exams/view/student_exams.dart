import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';

class StudentExams extends StatefulWidget {
  const StudentExams({super.key});

  @override
  State<StudentExams> createState() => _StudentExamsState();
}

class _StudentExamsState extends State<StudentExams> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.white,
      child: Center(
        child: Text(
          'قريباً',
          style: Theme.of(context).textTheme.bodyLarge?.apply(
                color: ColorsManager.grey,
              ),
        ),
      ),
    );
  }
}
