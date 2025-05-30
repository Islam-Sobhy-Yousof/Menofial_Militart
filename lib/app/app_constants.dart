abstract class AppConstants {
  static const String empty = "";
  static const defaultLocalLanguage = 'ar';
  static const dateTimeFormat = 'd/M/y';
  static const String initialCountryCode = "EG";
  static const List<String> favouriteCountryCode = ['+967', '+970','+20'];
  static const String studentIdPref = "studentIdPref";
  static const String studentNamePref = "studentNamePref";
  static const String studentCollegePref = "studentCollegePref";
  static const String superNamePref = "superNamePref";
  static const String superEmailPref = "superEmailPref";
  static const String superTokenPref = "superTokenPref";
  static const String emailRegexPattern = r'^[^\s@]+@[^\s@]+\.[^\s@]+$';
  static const int zero = 0;
  static const int studentsLimit = 1;
  static const int loginPasswordMinLen = 1;
  static const int snackbarDisplayDuration = 1;
  static const Duration apiTimeOut = Duration(minutes: 1);
}
