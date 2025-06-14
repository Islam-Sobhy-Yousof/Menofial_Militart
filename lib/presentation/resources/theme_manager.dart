import 'package:flutter/material.dart';
import 'package:menofia_military/presentation/resources/color_manager.dart';
import 'package:menofia_military/presentation/resources/fonts_manager.dart';
import 'package:menofia_military/presentation/resources/values_manager.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    brightness: Brightness.light,
    primaryColor: ColorsManager.primary,
    scaffoldBackgroundColor: ColorsManager.white,
    textTheme: AppTextThemes.lightTextTheme,
    elevatedButtonTheme: AppButtonThemes.lightElevatedButtonTheme,
    appBarTheme: AppBarThemes.lightAppBarTheme,
    bottomSheetTheme: AppBottomSheetThemes.lightBottomSheetTheme,
    checkboxTheme: AppCheckboxThemes.lightCheckboxTheme,
    chipTheme: AppChipThemes.lightChipTheme,
    inputDecorationTheme: AppTextFormFieldThemes.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    brightness: Brightness.dark,
    primaryColor: ColorsManager.darkPrimary,
    scaffoldBackgroundColor: ColorsManager.darkPrimary,
    textTheme: AppTextThemes.darkTextTheme,
    elevatedButtonTheme: AppButtonThemes.darkElevatedButtonTheme,
    appBarTheme: AppBarThemes.darkAppBarTheme,
    bottomSheetTheme: AppBottomSheetThemes.darkBottomSheetTheme,
    checkboxTheme: AppCheckboxThemes.darkCheckboxTheme,
    chipTheme: AppChipThemes.darkChipTheme,
    inputDecorationTheme: AppTextFormFieldThemes.darkInputDecorationTheme,
  );
}

abstract class AppButtonThemes {
  /// -- Light Elevated Button Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: AppSize.s0,
      foregroundColor: ColorsManager.buttonText,
      backgroundColor: ColorsManager.button,
      disabledForegroundColor: ColorsManager.grey,
      disabledBackgroundColor: ColorsManager.lightGrey,

      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p16), // Use p12 instead of 10
      textStyle: TextStyle(
        fontSize: FontSize.s16,
        color: ColorsManager.white,
        fontWeight: FontWeightManager.semiBold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    ),
  );

  /// -- Dark Elevated Button Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: AppSize.s0,
      foregroundColor: ColorsManager.buttonText,
      backgroundColor: ColorsManager.button,
      disabledForegroundColor: ColorsManager.grey,
      disabledBackgroundColor: ColorsManager.darkGrey,
      side: const BorderSide(color: ColorsManager.button),
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p16), // Use p12 instead of 10
      textStyle: TextStyle(
        fontSize: FontSize.s16,
        color: ColorsManager.buttonText,
        fontWeight: FontWeightManager.semiBold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    ),
  );
}

abstract class AppTextThemes {
  /// Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: FontSize.s32,
      fontWeight: FontWeightManager.bold,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: FontSize.s24,
      fontWeight: FontWeightManager.semiBold,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.medium,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: FontSize.s20,
      fontWeight: FontWeightManager.semiBold,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.medium,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.regular,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.regular,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.regular,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.light,
      color: ColorsManager.grey2,
      fontFamily: FontConstants.fontFamily,
    ),
  );

  /// Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: FontSize.s32,
      fontWeight: FontWeightManager.bold,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: FontSize.s24,
      fontWeight: FontWeightManager.semiBold,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.medium,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: FontSize.s20,
      fontWeight: FontWeightManager.semiBold,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.medium,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.regular,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.regular,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeightManager.regular,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.light,
      color: ColorsManager.grey,
      fontFamily: FontConstants.fontFamily,
    ),
  );
}

abstract class AppBarThemes {
  /// Light AppBar Theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: AppSize.s0,
    centerTitle: false,
    scrolledUnderElevation: AppSize.s0,
    backgroundColor: ColorsManager.primary,
    surfaceTintColor: ColorsManager.primary,
    iconTheme: IconThemeData(
      color: ColorsManager.darkPrimary,
      size: AppSize.s24,
    ),
    actionsIconTheme: IconThemeData(
      color: ColorsManager.darkPrimary,
      size: AppSize.s24,
    ),
    titleTextStyle: TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.semiBold,
      color: ColorsManager.darkPrimary,
      fontFamily: FontConstants.fontFamily,
    ),
  );

  /// Dark AppBar Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: AppSize.s0,
    centerTitle: false,
    scrolledUnderElevation: AppSize.s0,
    backgroundColor: ColorsManager.transparent,
    surfaceTintColor: ColorsManager.transparent,
    iconTheme: IconThemeData(
      color: ColorsManager.white,
      size: AppSize.s24,
    ),
    actionsIconTheme: IconThemeData(
      color: ColorsManager.white,
      size: AppSize.s24,
    ),
    titleTextStyle: TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.semiBold,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
  );
}

abstract class AppBottomSheetThemes {
  /// Light BottomSheet Theme
  static const BottomSheetThemeData lightBottomSheetTheme =
      BottomSheetThemeData(
          showDragHandle: true,
          backgroundColor: ColorsManager.white,
          modalBackgroundColor: ColorsManager.white,
          constraints: BoxConstraints(minHeight: double.infinity),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSize.s16),
            ),
          ));

  /// Dark BottomSheet Theme
  static const BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: ColorsManager.darkPrimary,
      modalBackgroundColor: ColorsManager.darkPrimary,
      constraints: BoxConstraints(minHeight: double.infinity),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.s16),
        ),
      ));
}

abstract class AppCheckboxThemes {
  AppCheckboxThemes(); // Public constructor

  /// Light Checkbox Theme
  static final CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s4),
    ),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorsManager.white;
      }
      return ColorsManager.transparent;
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorsManager.button;
      }
      return ColorsManager.transparent;
    }),
  );

  /// Dark Checkbox Theme
  static final CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s4),
    ),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorsManager.white;
      }
      return ColorsManager.transparent;
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorsManager.button;
      }
      return ColorsManager.transparent;
    }),
  );
}

abstract class AppChipThemes {
  /// Light Chip Theme
  static final ChipThemeData lightChipTheme = ChipThemeData(
    // ignore: deprecated_member_use
    disabledColor: ColorsManager.grey.withOpacity(
      AppFractions.f4,
    ),
    selectedColor: ColorsManager.button,
    secondarySelectedColor: ColorsManager.button,
    padding: const EdgeInsets.symmetric(
      horizontal: AppPadding.p12,
      vertical: AppPadding.p12,
    ),
    labelStyle: TextStyle(
      color: ColorsManager.buttonText,
      fontSize: FontSize.s14,
      fontFamily: FontConstants.fontFamily,
    ),
    secondaryLabelStyle: TextStyle(
      color: ColorsManager.white,
      fontSize: FontSize.s14,
      fontFamily: FontConstants.fontFamily,
    ),
    brightness: Brightness.light,
    checkmarkColor: ColorsManager.white,
  );

  /// Dark Chip Theme
  static final ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: ColorsManager.darkGrey,
    selectedColor: ColorsManager.button,
    secondarySelectedColor: ColorsManager.button,
    padding: const EdgeInsets.symmetric(
      horizontal: AppPadding.p12,
      vertical: AppPadding.p12,
    ),
    labelStyle: TextStyle(
      color: ColorsManager.white,
      fontSize: FontSize.s14,
      fontFamily: FontConstants.fontFamily,
    ),
    secondaryLabelStyle: TextStyle(
      color: ColorsManager.white,
      fontSize: FontSize.s14,
      fontFamily: FontConstants.fontFamily,
    ),
    brightness: Brightness.dark,
    checkmarkColor: ColorsManager.white,
  );
}

abstract class AppTextFormFieldThemes {
  /// Light Input Decoration Theme
  static final InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorsManager.grey,
    suffixIconColor: ColorsManager.grey,
    labelStyle: TextStyle(
      fontSize: FontSize.s14,
      color: ColorsManager.darkPrimary,
      fontFamily: FontConstants.fontFamily,
    ),
    hintStyle: TextStyle(
      fontSize: FontSize.s14,
      color: ColorsManager.grey,
      fontFamily: FontConstants.fontFamily,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      color: ColorsManager.error,
    ),
    floatingLabelStyle: TextStyle(
      // ignore: deprecated_member_use
      color: ColorsManager.darkPrimary.withOpacity(0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 1, color: ColorsManager.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 1, color: ColorsManager.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 1, color: ColorsManager.button),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 1, color: ColorsManager.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 2, color: ColorsManager.button),
    ),
  );

  /// Dark Input Decoration Theme
  static final InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorsManager.grey,
    suffixIconColor: ColorsManager.grey,
    labelStyle: TextStyle(
      fontSize: FontSize.s16,
      color: ColorsManager.white,
      fontFamily: FontConstants.fontFamily,
    ),
    hintStyle: TextStyle(
      fontSize: FontSize.s16,
      color: ColorsManager.grey,
      fontFamily: FontConstants.fontFamily,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      color: ColorsManager.error,
    ),
    floatingLabelStyle: TextStyle(
      // ignore: deprecated_member_use
      color: ColorsManager.white.withOpacity(0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 1, color: ColorsManager.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 1, color: ColorsManager.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 1, color: ColorsManager.button),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 1, color: ColorsManager.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(width: 2, color: ColorsManager.button),
    ),
  );
}
