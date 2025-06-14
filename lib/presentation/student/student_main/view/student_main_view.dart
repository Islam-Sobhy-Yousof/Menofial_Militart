import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/presentation/common/widgets/custom_app_bar.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/student/student_main/controller/student_main_view_controller.dart';

class StudentMainView extends StatelessWidget {
  StudentMainView({super.key});

  final controller = Get.find<StudentMainViewController>();
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
                  Iconsax.home,
                ),
                label: 'الرئيسية',
              ),
              NavigationDestination(
                icon: Icon(
                  Iconsax.book,
                ),
                label: 'الإمتحانات',
              ),
              NavigationDestination(
                icon: Icon(
                  Iconsax.scan_barcode,
                ),
                label: 'رمز الحضور',
              ),
            ],
          )),
    );
  }
}
