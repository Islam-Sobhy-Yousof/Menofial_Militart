

// import 'package:hive/hive.dart';

// abstract class LocalStorage {
//   List<String> addToBox({required String key,required String valueToAdd});
//   List<String> getFromBox({required String key});
// }

// class HiveLocalStorage implements LocalStorage {
//   final Box _hiveBox;

//   HiveLocalStorage({required Box hiveBox}) : _hiveBox = hiveBox;
//   @override
//   List<String> addToBox({required String key, required String valueToAdd}) {
//     final List<String> currentList =
//         List<String>.from(_hiveBox.get(key, defaultValue: []));
//         currentList.add(valueToAdd);
//         _hiveBox.put(key, currentList);

//         return currentList;
        
//   }

//   @override
//   List<String> getFromBox({required String key}) {
//     final List<String> currentList = List<String>.from(_hiveBox.get(key, defaultValue: []));

//    return currentList;
//   }

// }