import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/app/helper_functions.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/super/super_main/pages/super_scan/view_model/super_scan_attendance_view_model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SuperScanView extends StatefulWidget {
  const SuperScanView({super.key});

  @override
  State<SuperScanView> createState() => _SuperScanViewState();
}

class _SuperScanViewState extends State<SuperScanView> {
  final SuperScanAttendanceViewModel _superAttendanceViewModel =
      instance<SuperScanAttendanceViewModel>();

  final MobileScannerController _mobileScannerController =
      MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );

  void _bind() {
    _superAttendanceViewModel.start();

    _superAttendanceViewModel.studentIDRegisterationOutput.listen((isSuccess) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (isSuccess) {
          showSweetSnackBar(
            context: context,
            message: StringsManager.scanSuccessMessage,
          );
        } else {
          showSweetSnackBar(
            context: context,
            isFailure: true,
            message: StringsManager.scanFailureMessage,
          );
        }
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _superAttendanceViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
                  context: context,
                  contentScreenWidget: _getContentWidget(),
                  retryFunction: () {
                    _superAttendanceViewModel.addContentState();
                  }) ??
              _getContentWidget();
        });
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Center(
        child: MobileScanner(
          controller: _mobileScannerController,
          onDetect: (result) async {
            final scannedID = result.barcodes.first.rawValue;
            _superAttendanceViewModel.registerAttendance(
              studentID: scannedID ?? AppConstants.empty,
            );
            setState(() {});
          },
          onDetectError: (error, _) {
            // ignore: avoid_single_cascade_in_expression_statements
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: StringsManager.unKnownFailure,
            )..show();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _superAttendanceViewModel.dispose();
    _mobileScannerController.dispose();
    super.dispose();
  }
}


/*
 


*/