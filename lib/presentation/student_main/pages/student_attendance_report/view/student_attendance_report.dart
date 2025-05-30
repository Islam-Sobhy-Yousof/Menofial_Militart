import 'package:flutter/material.dart';

class StudentAttendanceReport extends StatefulWidget {
  const StudentAttendanceReport({super.key});

  @override
  State<StudentAttendanceReport> createState() =>
      _StudentAttendanceReportState();
}

class _StudentAttendanceReportState extends State<StudentAttendanceReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Student Attendance'),
      ),
    );
  }
}
