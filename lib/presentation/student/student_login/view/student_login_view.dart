import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:menofia_military/presentation/common/utils/helpers/helper_functions.dart';
import 'package:menofia_military/presentation/common/utils/helpers/show_dialog.dart';
import 'package:menofia_military/presentation/common/widgets/custom_rounded_container.dart';
import 'package:menofia_military/presentation/common/widgets/make_space.dart';
import 'package:menofia_military/presentation/common/widgets/states/custom_popup.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:menofia_military/presentation/resources/assets_manager.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/routes_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';
import 'package:menofia_military/presentation/student/student_login/controller/student_login_controller.dart';

class StudentLoginView extends StatelessWidget {
  StudentLoginView({super.key});
  final controller = StudentLoginController.instance;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: AppSize.sinf,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MakeSpace(
                    height: AppSize.s100,
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
                        controller: controller.controller,
                        onChanged: controller.onChanged,
                        errorText: controller.errorText.value,
                        keyboardType: TextInputType.number,
                      )),
                  const MakeSpace(
                    height: AppSize.s24,
                  ),
                  Obx(
                    () => SizedBox(
                      width: AppSize.sinf,
                      child: ElevatedButton(
                        onPressed: controller.areAllInputsValid.value
                            ? () => controller.login(context: context)
                            : null,
                        child: Text(
                          StringsManager.login,
                          style: Theme.of(context).textTheme.bodyLarge?.apply(
                                color: ColorsManager.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const MakeSpace(
                    height: AppSize.s30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.superLoginRoute,);
                        },
                        child: Text(
                          StringsManager.areYouASuper,
                          style:
                              Theme.of(context).textTheme.headlineMedium?.apply(
                                    color: ColorsManager.primary,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  //TODO : implement admin login route
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.prefixIcon = Iconsax.user,
    this.obscureText = false,
    this.labelText = StringsManager.studentIDField,
    this.onChanged,
    this.keyboardType = TextInputType.emailAddress,
    this.errorText,
    this.validator,
    required this.controller,
  });
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String labelText;
  final void Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorText: errorText,
        prefixIcon: Icon(
          prefixIcon,
        ),
        labelText: labelText,
      ),
    );
  }
}
