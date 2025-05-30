import 'package:flutter/material.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:menofia_military/presentation/student_main/pages/student_qr/view_model/student_qr_generator_view_model.dart';
import 'package:menofia_military/presentation/student_main/pages/student_qr/widgets/qr_no_data_view.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class StudentQrGenratorView extends StatefulWidget {
  const StudentQrGenratorView({super.key});

  @override
  State<StudentQrGenratorView> createState() => _StudentQrGenratorViewState();
}

class _StudentQrGenratorViewState extends State<StudentQrGenratorView> {
  final StudentQrGeneratorViewModel _studentQrGeneratorViewModel =
      instance<StudentQrGeneratorViewModel>();

  void _bind() {
    _studentQrGeneratorViewModel.start();
    Future.delayed(Duration.zero, () {
      _studentQrGeneratorViewModel.generateQR();
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _getContentWidget(),
    );
//TODO: make sure to figureout what is hapening because of staterenderer
    /*

StreamBuilder<FlowState>(
          stream: _studentQrGeneratorViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                    context: context,
                    contentScreenWidget: _getContentWidget(),
                    retryFunction: () {
                      _studentQrGeneratorViewModel.addContentState();
                    }) ??
                _getContentWidget();
          }),

    */
  }

  Widget _getContentWidget() {
    return SizedBox(
      child: StreamBuilder<String>(
          stream: _studentQrGeneratorViewModel.outQrCodeData,
          builder: (context, snapshot) {
            return snapshot.data == null || snapshot.data == AppConstants.empty
                ? QrNoDataView()
                : PrettyQrView.data(
                    data: snapshot.data!,
                    decoration: const PrettyQrDecoration(
                      quietZone: PrettyQrQuietZone.standart,
                    ),
                  );
          }),
    );
  }

  @override
  void dispose() {
    _studentQrGeneratorViewModel.dispose();
    super.dispose();
  }
}
