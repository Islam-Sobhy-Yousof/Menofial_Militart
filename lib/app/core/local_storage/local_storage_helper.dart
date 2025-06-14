import 'package:get_storage/get_storage.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/presentation/resources/constants_manager.dart';

const String studentIdKey = "STUDENTID";
const String studentNameKey = "STUDENTNAMEKEY";

abstract class LocalStorageHelper {
  Future<void> saveData<T>({required String key, required T data});

  T? readData<T>({required String key});
  Future<void> removeData<T>({required String key});
  Future<void> clearAll();

  Future<void> setStudentId({required String studentId});
  String getStudentId();
    Future<void> setStudentName({required String studentName});
  String getStudentName();

  Future<void> clearStudentData();
}

class LocalStorageHelperImpl implements LocalStorageHelper {
  final GetStorage _getStorage;

  LocalStorageHelperImpl({required GetStorage getStorage})
      : _getStorage = getStorage;

  @override
  Future<void> clearAll() async {
    await _getStorage.erase();
  }

  @override
  T? readData<T>({required String key}) {
    return _getStorage.read(key) ;
  }

  @override
  Future<void> removeData<T>({required String key}) async {
    await _getStorage.remove(key);
  }

  @override
  Future<void> saveData<T>({required String key, required T data}) async {
    await _getStorage.write(key, data);
  }

  @override
  String getStudentId() {
    return readData<String>(key: studentIdKey) ?? AppConstants.empty;
  }

  @override
  Future<void> setStudentId({required String studentId}) async {
    await saveData<String>(key: studentIdKey, data: studentId);
  }
  
  @override
  String getStudentName() {
    return readData<String>(key: studentNameKey) ?? AppConstants.empty;
  }
  
  @override
  Future<void> setStudentName({required String studentName}) async{
    return saveData(key: studentNameKey, data: studentName);
  }
  
  @override
  Future<void> clearStudentData()async {
    await removeData(key: studentIdKey);
    await removeData(key: studentNameKey);
  }
}
