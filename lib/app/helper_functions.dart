import 'package:flutter/material.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/extensions.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

bool validateEmail({
  required String email,
}) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
bool validateStudentID({required String studentID}){
  final regex = RegExp(r'^[A-Za-z0-9]{20}$');

  return regex.hasMatch(studentID);
}




void showSweetSnackBar({required BuildContext context,required String message,bool  isFailure  = false,}){
  showTopSnackBar(
    Overlay.of(context),
   _getCustomSnackBar(isFailure: isFailure,message: message),
    
    displayDuration: Duration(seconds: AppConstants.snackbarDisplayDuration,),
  );
}

CustomSnackBar _getCustomSnackBar({required bool isFailure,required String message}){
  if(isFailure) {
    return CustomSnackBar.error(
      message: message,
    );
  }

  return CustomSnackBar.info(
      message: message,
    );
}

String convertToCountableNumber({required int number}){
  if(number == 0){
   return  AppStrings.noStudentsData;
  }
  if (number == 1) {
    return AppStrings.singleStudentData;
  }
   if (number == 2) {
    return AppStrings.pairOfStudnetsData;
  }

  return "${number.toString().toArabicNumbers()} ${AppStrings.multipleStudnetsData}";
}