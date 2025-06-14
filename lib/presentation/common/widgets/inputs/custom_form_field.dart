import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';

class CustomFormField extends StatelessWidget {
   CustomFormField({
    super.key,
    this.prefixIcon = Iconsax.user,
    this.suffixIcon,
    this.obscureText = false,
    this.labelText = StringsManager.studentIDField,
    this.onChanged,
    this.keyboardType = TextInputType.emailAddress,
    this.errorText,
    this.onPressed,
    this.validator,
    required this.controller,
  });
  VoidCallback? onPressed;
  final IconData prefixIcon;
  final IconData? suffixIcon;
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
        suffixIcon: IconButton(onPressed: onPressed, icon:  Icon(
              suffixIcon,
            )),
        errorText: errorText,
        prefixIcon: Icon(
          prefixIcon,
        ),
        labelText: labelText,
      ),
    );
  }
}
