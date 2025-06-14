import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:menofia_military/presentation/common/widgets/custom_app_bar.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/super/super_main/controller/super_main_view_controller.dart';

class SuperMainView extends StatelessWidget {
  SuperMainView({super.key});

  final controller = SuperMainViewController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Obx(
          () => Text(
            controller.pagesTitles[controller.currentIndex.value],
            style: Theme.of(context).textTheme.bodyLarge?.apply(
                  color: ColorsManager.white,
                ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.logStudentOut,
            icon: Icon(
              Iconsax.logout,
              color: ColorsManager.white,
              size: AppSize.s30,
            ),
          ),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(() => NavigationBar(
            height: AppSize.s60,
            selectedIndex: controller.currentIndex.value,
            onDestinationSelected: controller.changeSelectedIndex,
            elevation: AppSize.s0,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Iconsax.chart,
                ),
                label: StringsManager.superAttendanceReportPage,
              ),
              NavigationDestination(
                icon: Icon(
                  Iconsax.book,
                ),
                label: StringsManager.exams,
              ),
              NavigationDestination(
                icon: Icon(
                  Iconsax.scan,
                ),
                label: StringsManager.superScanAttendacneQRPage,
              ),
            ],
          )),
    );
  }
}
