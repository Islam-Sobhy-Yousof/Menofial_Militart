import 'package:flutter/material.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/data/data_sources/remote_data_source.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:menofia_military/presentation/common/widgets/custom_progress_indicator.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/super_main/pages/super_attendance/view/widget/attendance_item.dart';
import 'package:menofia_military/presentation/super_main/pages/super_attendance/view/widget/no_report_to_view.dart';
import 'package:menofia_military/presentation/super_main/pages/super_attendance/view_modle/super_attendance_view_model.dart';
import 'package:menofia_military/presentation/super_main/pages/super_scan/view_model/super_scan_attendance_view_model.dart';

class SuperAttendanceView extends StatefulWidget {
  const SuperAttendanceView({super.key});

  @override
  State<SuperAttendanceView> createState() => _SuperAttendanceViewState();
}

class _SuperAttendanceViewState extends State<SuperAttendanceView> {
  final SuperAttendanceViewModel _superAttendanceViewModel =
      instance<SuperAttendanceViewModel>();
  void _bind() {
    _superAttendanceViewModel.start();
  }

  void _onTap() {
    Navigator.pushNamed(
      context,
      Routes.superAttendanceDetails,
    );
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Center(
      child: StreamBuilder<AttendanceReportObject>(
        stream: _superAttendanceViewModel.attendanceReportOutput,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return CustomProgressIndicator();
          }
          final data = snapshot.data!.attendanceList;
          if(data.isEmpty){
            return NoReportToView();
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: _onTap,
                child: AttendanceItem(
                  item: data[index],
                  onTap: _onTap,
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _superAttendanceViewModel.dispose();
    super.dispose();
  }
}
