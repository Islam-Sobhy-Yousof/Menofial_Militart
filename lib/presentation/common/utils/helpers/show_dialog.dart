

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/common/utils/helpers/helper_functions.dart';

abstract class AppDialogs {

  static AwesomeDialog? _currentDialog;
  static void showCustomDialog({
    required BuildContext context,
    DialogType dialogType = DialogType.noHeader,
    bool dismissOnTouchOutside = false,
    bool dismissOnBackKeyPress = false,
    required Widget child,
  }) {
   dismiss();
   _currentDialog =  AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.scale,
      dismissOnTouchOutside: dismissOnTouchOutside,
      dismissOnBackKeyPress: dismissOnBackKeyPress,
      body: child,
    )..show();

  }
  static void dismiss(){
    _currentDialog?.dismiss();
    _currentDialog = null;
  }
}

