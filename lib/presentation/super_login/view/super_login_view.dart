import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
import 'package:menofia_military/presentation/super_login/view_model/super_login_view_model.dart';

class SuperLoginView extends StatefulWidget {
  const SuperLoginView({super.key});

  @override
  State<SuperLoginView> createState() => _SuperLoginViewState();
}

class _SuperLoginViewState extends State<SuperLoginView> {
  final SuperLoginViewModel _superLoginViewModel =
      instance<SuperLoginViewModel>();
  final TextEditingController _superEmailController = TextEditingController();
  final TextEditingController _superPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _bind() {
    _superLoginViewModel.start();

    _superEmailController.addListener(
      () => _superLoginViewModel.setSuperEmail(
        superEmail: _superEmailController.text.trim(),
      ),
    );
    _superPasswordController.addListener(
      () => _superLoginViewModel.setSuperPassword(
        superPassword: _superPasswordController.text.trim(),
      ),
    );

    _superLoginViewModel.outIsSuperLoggedInSuccessfully.listen((isLoggedIn) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (isLoggedIn) {
          Navigator.of(context).pushReplacementNamed(
            Routes.superMainRoute,
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
      backgroundColor: ColorsManager.white,
      body: StreamBuilder<FlowState>(
          stream: _superLoginViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                    context: context,
                    contentScreenWidget: _getContentWidget(),
                    retryFunction: () {
                      _superLoginViewModel.addContentState();
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
                  stream: _superLoginViewModel.outIsSuperEmailValid,
                  builder: (context, snapshot) {
                    return AuthField(
                      controller: _superEmailController,
                      hintText: AppStrings.superEmailField,
                      labelText: AppStrings.superEmailField,
                      errorText: AppStrings.superEmailFieldError,
                      snapshotData: snapshot.data,
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
                  stream: _superLoginViewModel.outIsSuperPasswordlValid,
                  builder: (context, snapshot) {
                    return AuthField(
                      controller: _superPasswordController,
                      hintText: AppStrings.superPasswordField,
                      labelText: AppStrings.superPasswordField,
                      errorText: AppStrings.superPasswordFieldError,
                      snapshotData: snapshot.data,
                      isObsecure: true,
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
                  stream: _superLoginViewModel.outAreAllInputsValid,
                  builder: (context, snapshot) {
                    return PrimaryButton(
                      onTap: () {
                        _superLoginViewModel.login();
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
                          Routes.studentLoginRoute,
                        );
                      },
                      text: AppStrings.areYouStudent,
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
    _superLoginViewModel.dispose();
    _superEmailController.dispose();
    _superPasswordController.dispose();
    super.dispose();
  }
}
