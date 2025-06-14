import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/common/widgets/custom_progress_indicator.dart';
import 'package:menofia_military/presentation/common/widgets/make_space.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({
    super.key,
    this.horizontalPadding = AppPadding.p16,
    this.verticalPadding = AppPadding.p16,
    required this.popupMainState,
    this.popupText = StringsManager.loading,
  });

  final double horizontalPadding;
  final double verticalPadding;
  final Widget popupMainState;
  final String popupText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: SizedBox(
        width: AppSize.sinf,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: AppSize.s150,
              height: AppSize.s100,
              child: popupMainState,
            ),
            Text(
              popupText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const MakeSpace(
              height: AppSize.s16,
            ),
          ],
        ),
      ),
    );
  }
}
