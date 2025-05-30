import 'package:menofia_military/app/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_DID_LOG_IN_KEY = "PREFS_DID_LOG_IN_KEY";
const String PREFS_DID_SUPER_LOG_IN_KEY = "PREFS_DID_SUPER_LOG_IN_KEY";

class AppPrefs {
  final SharedPreferences _sharedPreferences;

  AppPrefs({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;



  void setUserLoggedIn() {
    _sharedPreferences.setBool(PREFS_DID_LOG_IN_KEY, true);
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(PREFS_DID_LOG_IN_KEY) ?? false;
  }



  void setSuperLoggedIn() {
    _sharedPreferences.setBool(PREFS_DID_SUPER_LOG_IN_KEY, true);
  }

  bool isSuperLoggedIn() {
    return _sharedPreferences.getBool(PREFS_DID_SUPER_LOG_IN_KEY) ?? false;
  }


  Future<bool> setString({required String key,required String value}) async{
   return await _sharedPreferences.setString(key, value);
  }

 String getString({required String key}) {
    return  _sharedPreferences.getString(key) ?? AppConstants.empty;
  }

  void clearStudentData() {
    _sharedPreferences.remove(AppConstants.studentCollegePref,);
    _sharedPreferences.remove(AppConstants.studentIdPref,);
    _sharedPreferences.remove(AppConstants.studentNamePref,);

  }

  void signoutStudent() {
        _sharedPreferences.setBool(PREFS_DID_LOG_IN_KEY, false);
  }

   void clearSuperData()  {
     _sharedPreferences.remove(
      AppConstants.superEmailPref,
    );
     _sharedPreferences.remove(
      AppConstants.superNamePref,
    );
     _sharedPreferences.remove(
      AppConstants.superTokenPref,
    );
  }

  void signoutSuper()  {
   _sharedPreferences.setBool(PREFS_DID_SUPER_LOG_IN_KEY, false);
  }

  Future<void> clearPrefs() async{
    await _sharedPreferences.clear();
  }
}
