import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:menofia_military/app/extensions.dart';
import 'package:menofia_military/domain/models/models.dart';
import 'package:menofia_military/presentation/common/utils/helpers/show_dialog.dart';
import 'package:menofia_military/presentation/common/widgets/custom_chip.dart';
import 'package:menofia_military/presentation/common/widgets/custom_progress_indicator.dart';
import 'package:menofia_military/presentation/common/widgets/custom_rounded_container.dart';
import 'package:menofia_military/presentation/common/widgets/make_space.dart';
import 'package:menofia_military/presentation/common/widgets/states/custom_full_state.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_attendance/controller/super_attendance_view_controller.dart';

class SuperAttendance extends StatefulWidget {
  SuperAttendance({super.key});

  @override
  State<SuperAttendance> createState() => _SuperAttendanceState();
}

class _SuperAttendanceState extends State<SuperAttendance> {
  final controller = SuperAttendanceViewController.instance;
  void fetchStudentsAttendanceReport() async {
    await controller.fetchStudentsAttendanceReport();
  }

  @override
  void initState() {
    fetchStudentsAttendanceReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchStudentsAttendanceReport();
        },
        child: Obx(
          () => controller.isLoading.value
              ? CustomFullState(
                  child: Lottie.asset(
                    JsonAssets.loading,
                  ),
                )
              : controller.isErrorState.value
                  ? SingleChildScrollView(
                      child: CustomFullState(
                        child: Lottie.asset(
                          JsonAssets.error,
                        ),
                      ),
                    )
                  : CustomAttendanceListView(
                      attendanceReportList: controller.attendanceReportList,
                    ),
        ),
      ),
    );
  }
}

class CustomAttendanceListView extends StatelessWidget {
  const CustomAttendanceListView({
    super.key,
    required this.attendanceReportList,
  });
  final List<Attendance> attendanceReportList;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
            vertical: AppPadding.p20,
          ),
          sliver: SliverList.builder(
            itemCount: attendanceReportList.length,
            itemBuilder: (_, index) {
              final attendanceReport = attendanceReportList[index];
              return GestureDetector(
                onTap: () {
                  Get.to(DummyPage());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p2,
                    vertical: AppPadding.p20,
                  ),
                  child: CustomRoundedContainer(
                    height: AppSize.s80,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16,
                        vertical: AppPadding.p4,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.grey,
                        borderRadius: BorderRadius.circular(
                          AppSize.s16,
                        ),
                      ),
                      child: Row(
                        children: [
                          CustomChip(
                            width: AppSize.s150,
                            child: Text(
                              attendanceReport.dates,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const MakeSpace(
                            width: AppSize.s20,
                          ),
                          CustomChip(
                            width: AppSize.s100,
                            child: Text(
                              attendanceReport.studentsPresent.length
                                  .convertToCountableNumber(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Dummy'),
      ),
    );
  }
}
