import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/presentation/common/widgets/make_space.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/student_main/pages/student_attendance_report/view/student_attendance_report.dart';
import 'package:menofia_military/presentation/student_main/pages/student_qr/view/student_qr_genrator_view.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class StudentMainView extends StatefulWidget {
  const StudentMainView({super.key});

  @override
  State<StudentMainView> createState() => _StudentMainViewState();
}

class _StudentMainViewState extends State<StudentMainView> {
  final AppPrefs _appPrefs = instance<AppPrefs>();

  final List<Widget> _pages = [
    StudentAttendanceReport(),
    StudentQrGenratorView(),
  ];

  final List<String> _pagesTitle = [
    AppStrings.studentAttendanceReportPage,
    AppStrings.studentQrGeneratorPage,
  ];

  int _currentIndex = 0;
  String _currentTitle = AppStrings.studentAttendanceReportPage;

  void _onPressed() {
    _appPrefs.clearStudentData();
    _appPrefs.signoutStudent();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed(Routes.studentLoginRoute);
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentTitle,
          style: getBoldStyle(
            color: ColorsManager.white,
            fontSize: FontSize.s20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _onPressed(),
            icon: Icon(
              Icons.logout,
              size: AppSize.s30,
              color: ColorsManager.white,
            ),
          ),
          MakeSpace(
            width: AppSize.s12,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorsManager.grey,
              spreadRadius: AppSize.s1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorsManager.primary,
          unselectedItemColor: ColorsManager.grey,
          currentIndex: _currentIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
              ),
              label: AppStrings.studentAttendanceReport,
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code,
              ),
              label: AppStrings.studentQrGenerator,
            ),
          ],
          onTap: onTap,
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      _currentTitle = _pagesTitle[_currentIndex];
    });
  }
}
