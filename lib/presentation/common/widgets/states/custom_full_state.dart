import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/common/utils/device/device_utility.dart';
import 'package:menofia_military/presentation/common/utils/helpers/helper_functions.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class CustomFullState extends StatelessWidget {
  const CustomFullState({
    super.key,
    this.width,
    this.height = AppSize.s80,
    required this.child,
  });

  final double? width;
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HelperFunctions.screenHeight() -
          DeviceUtility.getBottomNavigationBarHeight(),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
