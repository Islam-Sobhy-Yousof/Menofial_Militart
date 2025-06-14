import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:menofia_military/app/app.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/app/core/local_storage/local_storage_helper.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting(AppConstants.defaultLocalLanguage, null);

  await initAppModules();

  await InjectionContainer.init();

/*
islamsobhi2019@gmail.com

islamsobhy

*/

//TODO: figureout why was the issue arising :)
//TODO: see how to fix it without using this solution

// await instance<AppPrefs>().clearPrefs();

// await Get.find<LocalStorageHelper>().clearAll();
  runApp(MenofiaMilitary());
}
