import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/data/data_sources/remote_data_source.dart';
import 'package:menofia_military/data/network/network_info.dart';
import 'package:menofia_military/data/repository/repository_impl.dart';
import 'package:menofia_military/domain/repository/repository.dart';

class InjectionContainer {
  static Future<void> init() async {
    final getStorage = GetStorage();
    await getStorage.initStorage;

    Get.put<LocalStorageHelper>(
      LocalStorageHelperImpl(
        getStorage: getStorage,
      ),
      permanent: true,
    );
    Get.put<NetworkInfo>(
      NetworkInfoImpl(
        internetConnectionChecker: InternetConnectionChecker.instance,
      ),
    );
    Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);
    Get.put<FirebaseFirestore>(
      FirebaseFirestore.instance,
      permanent: true,
    );
    Get.put<RemoteDataSource>(
      RemoteDataSourceImpl(
        firebaseFirestore: Get.find(),
        firebaseAuth: Get.find(),
      ),
    );

    Get.put<Repository>(
      RepositoryImpl(
        remoteDataSource: Get.find(),
        networkInfo: Get.find(),
      ),
    );
  }
}


