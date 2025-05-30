import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:menofia_military/presentation/common/widgets/auth_field.dart';
import 'package:menofia_military/presentation/common/widgets/auth_text_links.dart';
import 'package:menofia_military/presentation/common/widgets/make_space.dart';
import 'package:menofia_military/presentation/common/widgets/primary_button.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/resources/styles_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/student_login/view_model/student_login_view_model.dart';

class StudentLoginView extends StatefulWidget {
  const StudentLoginView({super.key});

  @override
  State<StudentLoginView> createState() => _StudentLoginViewState();
}

class _StudentLoginViewState extends State<StudentLoginView> {
  final StudentLoginViewModel _studentLoginViewModel =
      instance<StudentLoginViewModel>();

  final TextEditingController _studentIDController = TextEditingController();

  final AppPrefs _appPrefs = instance<AppPrefs>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _bind() {
    _studentLoginViewModel.start();
    _studentIDController.addListener(
      () => _studentLoginViewModel.setStudentId(
        studentID: _studentIDController.text.trim(),
      ),
    ); 

    _studentLoginViewModel.outIsStudentLoggedInSuccessfully
        .listen((isLoggedIn) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (isLoggedIn) {
          _appPrefs.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(
            Routes.studentMainRoute,
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
    return Scaffold(
      body: StreamBuilder<FlowState>(
          stream: _studentLoginViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                    context: context,
                    contentScreenWidget: _getContentWidget(),
                    retryFunction: () {
                      _studentLoginViewModel.addContentState();
                    }) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  ImageAssets.militaryLogo,
                ),
              ),
              MakeSpace(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p28,
                ),
                child: StreamBuilder<bool>(
                  stream: _studentLoginViewModel.outIsStudentIDValid,
                  builder: (context, snapshot) {
                    return AuthField(
                      controller: _studentIDController,
                      hintText: AppStrings.studentIDField,
                      labelText: AppStrings.studentIDField,
                      errorText: AppStrings.studentIDError,
                      snapshotData: snapshot.data,
                      inputType: TextInputType.number,
                    );
                  },
                ),
              ),
              MakeSpace(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p28,
                ),
                child: StreamBuilder<bool>(
                  stream: _studentLoginViewModel.outAreAllInputsValid,
                  builder: (context, snapshot) {
                    return PrimaryButton(
                      onTap: () {
                        _studentLoginViewModel.login();
                      },
                      buttonText: AppStrings.login,
                      snapshotData: snapshot.data,
                      buttonTextStyle: getBoldStyle(
                        color: ColorsManager.white,
                        fontSize: FontSize.s18,
                      ),
                    );
                  },
                ),
              ),
              MakeSpace(
                height: AppSize.s28,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTextLinks(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.superLoginRoute,
                        );
                      },
                      text: AppStrings.areYouASuper,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _studentLoginViewModel.dispose();
    _studentIDController.dispose();
    super.dispose();
  }
}
