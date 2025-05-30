import 'package:flutter/material.dart';

class SuperAttendanceDetailsView extends StatefulWidget {
  const SuperAttendanceDetailsView({super.key});

  @override
  State<SuperAttendanceDetailsView> createState() =>
      _SuperAttendanceDetailsViewState();
}

class _SuperAttendanceDetailsViewState
    extends State<SuperAttendanceDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تقرير حضور الطلاب ليوم معين'),
      ),
      body: Center(
        child: Text('Details Page'),
      ),
    );
  }
}
