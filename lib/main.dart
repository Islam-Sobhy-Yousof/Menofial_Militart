import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:menofia_military/app/app.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/app_prefs.dart';
import 'package:menofia_military/app/di.dart';
import 'package:menofia_military/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting(AppConstants.defaultLocalLanguage, null);

  await initAppModules();

/*
islamsobhi2019@gmail.com

islamsobhy

*/

//TODO: figureout why was the issue arising :)
//TODO: see how to fix it without using this solution

// await instance<AppPrefs>().clearPrefs();
  runApp(MenofiaMilitary());
}
