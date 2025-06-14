import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/student/student_main/pages/student_qr/controller/student_qr_generator_controller.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class StudentQrGenratorView extends StatefulWidget {
  StudentQrGenratorView({super.key});

  @override
  State<StudentQrGenratorView> createState() => _StudentQrGenratorViewState();
}

class _StudentQrGenratorViewState extends State<StudentQrGenratorView> {
  final controller = StudentQrGeneratorController.instance;

@override
  void initState() {
    controller.fetchStudentId();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.white,
      width: AppSize.sinf,
      height: AppSize.sinf,
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p30,
        horizontal: AppPadding.p30,
      ),
      child: Center(
        child: Obx(() => controller.studnetId.value == null
            ? Center(
                child: Text(
                  StringsManager.noQRCodeData,
                  style: Theme.of(context).textTheme.bodyLarge?.apply(
                        color: ColorsManager.grey,
                      ),
                ),
              )
            : PrettyQrView.data(
                data: controller.studnetId.value!,
                decoration: const PrettyQrDecoration(
                  quietZone: PrettyQrQuietZone.standart,
                ),
              )),
      ),
    );
  }
}


/*
PrettyQrView.data(
                    data: snapshot.data!,
                    decoration: const PrettyQrDecoration(
                      quietZone: PrettyQrQuietZone.standart,
                    ),
                  )



*/