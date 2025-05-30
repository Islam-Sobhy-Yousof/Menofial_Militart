import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/data/network/network_constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) return AppConstants.empty;

    return this!;
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) return AppConstants.zero;

    return this!;
  }
}

extension ArabicDigitsFormatter on String {
  String toArabicNumbers() {
    const western = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const eastern = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    String result = AppConstants.empty;
    for (int i = 0; i < length; i++) {
      String char = this[i];
      int index = western.indexOf(char);
      result += index != -1 ? eastern[index] : char;
    }
    return result;
  }
}

extension TimeStampFormating on Timestamp? {
  String toFormatedDateString() {
    if (this == null) return AppConstants.empty;
    DateTime dateTime = this!.toDate();
    String formattedDate = '${DateFormat.EEEE(
      AppConstants.defaultLocalLanguage,
    ).format(dateTime)} ${DateFormat(
      AppConstants.dateTimeFormat,
      AppConstants.defaultLocalLanguage,
    ).format(dateTime)}'
        .toArabicNumbers();
    return formattedDate;
  }
}

extension QueryDocumentSnapshotExtension on QueryDocumentSnapshot {
  Map<String, dynamic> attendanceToMap() {
    final Timestamp timestamp =
        ((data() as Map<String, dynamic>)[NetworkConstants.date]);
    final Map<String, dynamic> studentsPresent =
        (data() as Map<String, dynamic>)[NetworkConstants.studentsPresent];
    final result = {
      NetworkConstants.date: timestamp.toFormatedDateString(),
      NetworkConstants.studentsPresent: studentsPresent,
    };
    return result;
  }
}

extension FirebaseUserJsonnify on User {
  Map<String, dynamic> jsonnify() {
    return {
      NetworkConstants.superEmail: email,
      NetworkConstants.superName: displayName,
      NetworkConstants.superToken: AppConstants.empty,
    };
  }
}
