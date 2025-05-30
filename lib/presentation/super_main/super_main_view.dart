import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/presentation/common/widgets/make_space.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/super_main/pages/super_attendance/view/super_attendance.dart';
import 'package:menofia_military/presentation/super_main/pages/super_scan/view/super_scan_view.dart';

class SuperMainView extends StatefulWidget {
  const SuperMainView({super.key});

  @override
  State<SuperMainView> createState() => _SuperMainViewState();
}

class _SuperMainViewState extends State<SuperMainView> {
  final AppPrefs _appPrefs = instance<AppPrefs>();

  final List<Widget> _pages = [
    SuperAttendanceView(),
    SuperScanView(),
  ];

  final List<String> _pagesTitle = [
    AppStrings.superAttendanceReportPage,
    AppStrings.superScanAttendacneQRPage,
  ];
  int _currentIndex = 0;
  String _currentTitle = AppStrings.superAttendanceReportPage;

  void _onPressed() {
    _appPrefs.clearSuperData();
    _appPrefs.signoutSuper();
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
                Icons.assessment,
              ),
              label: AppStrings.superAttendanceReportPage,
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner,
              ),
              label: AppStrings.superScanAttendacneQRPage,
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
