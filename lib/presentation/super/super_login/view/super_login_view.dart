import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:menofia_military/presentation/common/widgets/custom_rounded_container.dart';
import 'package:menofia_military/presentation/common/widgets/inputs/custom_form_field.dart';
import 'package:menofia_military/presentation/common/widgets/make_space.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/student/student_login/view/student_login_view.dart';
import 'package:menofia_military/presentation/super/super_login/controller/super_login_controller.dart';

class SuperLoginView extends StatelessWidget {
  SuperLoginView({super.key});
  final controller = SuperLoginController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
          ),
          child: Column(
            children: [
              const MakeSpace(
                height: AppSize.s50,
              ),
              CustomRoundedContainer(
                child: Image.asset(
                  ImageAssets.militaryLogo,
                  fit: BoxFit.contain,
                ),
              ),
              const MakeSpace(
                height: AppSize.s24,
              ),
              Obx(() => CustomFormField(
                    onChanged: controller.onChangeEmail,
                    errorText: controller.emailErrorText.value,
                    labelText: StringsManager.superEmailField,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Iconsax.direct_right,
                  )),
              const MakeSpace(
                height: AppSize.s24,
              ),
              Obx(
                () => CustomFormField(
                  onPressed: controller.onShowPasswordIconPressed,
                  onChanged: controller.onChangePassword,
                  errorText: controller.passwordErrorText.value,
                  obscureText: controller.toggelPassword.value,
                  labelText: StringsManager.superPasswordField,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.text,
                  prefixIcon: Iconsax.password_check,
                  suffixIcon: controller.toggelPassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye,
                ),
              ),
              const MakeSpace(
                height: AppSize.s24,
              ),
              Obx(() => SizedBox(
                    width: AppSize.sinf,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(
                          Routes.superMainRoute,
                        );
                      },
                      child: Text(
                        '${StringsManager.login} ${controller.areAllInputsValid.value}',
                        style: Theme.of(context).textTheme.bodyLarge?.apply(
                              color: ColorsManager.white,
                            ),
                      ),
                    ),
                  )),
              const MakeSpace(
                height: AppSize.s30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      StringsManager.areYouStudent,
                      style: Theme.of(context).textTheme.headlineMedium?.apply(
                            color: ColorsManager.primary,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/**
 * 
 * controller.areAllInputsValid.value
                          ? () => controller.login(context: context)
                          : null
 */