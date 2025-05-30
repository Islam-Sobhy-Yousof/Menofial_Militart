import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String errorText;
  final bool isObsecure;
  final TextInputType? inputType;
  bool? snapshotData;

  AuthField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.errorText,
    this.isObsecure = false,
    this.snapshotData,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      keyboardType: inputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        errorText: (snapshotData ?? true) ? null : errorText,
      ),
    );
  }
}
