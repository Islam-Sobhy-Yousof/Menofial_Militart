import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/extensions.dart';
import 'package:menofia_military/data/mappers/mappers.dart';
import 'package:menofia_military/data/network/network_constants.dart';
import 'package:menofia_military/data/network/request.dart';
import 'package:menofia_military/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<StudentAuthenticationResponse?> studentLogin(
      {required StudentLoginRequest loginRequest});

  Future<SuperAuthenticationResponse?> superLogin(
      {required SuperLoginRequest superLoginRequest});

  Future<void> superRegisterStudentAttendance({required String studentID});

  Future<List<AttendanceResponse>> getAttendanceHistory();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  RemoteDataSourceImpl(
      {required FirebaseFirestore firebaseFirestore,
      required FirebaseAuth firebaseAuth})
      : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  @override
  Future<StudentAuthenticationResponse?> studentLogin(
      {required StudentLoginRequest loginRequest}) async {
    final response = await _firebaseFirestore
        .collection(NetworkConstants.studentsCollection)
        .where(
          NetworkConstants.sutdentID,
          isEqualTo: loginRequest.sutdentID,
        )
        .limit(AppConstants.studentsLimit)
        .get();
    if (response.docs.isEmpty) return null;
    final studentUUID = response.docs.first.id;

    return StudentAuthenticationResponse.fromJson(response.docs.first.data())
        .copyWith(
      sutdentID: studentUUID,
    );
  }

  @override
  Future<SuperAuthenticationResponse?> superLogin(
      {required SuperLoginRequest superLoginRequest}) async {
    final response = await _firebaseAuth.signInWithEmailAndPassword(
      email: superLoginRequest.email,
      password: superLoginRequest.password,
    );

    if (response.user == null) return null;
    final user = response.user!;
    final userToken = await user.getIdToken();

    return SuperAuthenticationResponse.fromJson(user.jsonnify()).copyWith(
      superToken: userToken,
    );
  }

  @override
  Future<void> superRegisterStudentAttendance(
      {required String studentID}) async {
    final collection =
        _firebaseFirestore.collection(NetworkConstants.attendanceCollection);
    final now = DateTime.now().toUtc();
    final startOfDay = DateTime.utc(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(Duration(days: 1));

    final querySnapshot = await collection
        .where(
          NetworkConstants.date,
          isGreaterThanOrEqualTo: startOfDay,
        )
        .where(
          NetworkConstants.date,
          isLessThan: endOfDay,
        )
        .limit(NetworkConstants.collectionEnteryLimit)
        .get();

    if (querySnapshot.docs.isEmpty) {
    await collection.add({
        NetworkConstants.date: FieldValue.serverTimestamp(),
        NetworkConstants.studentsPresent: {
          studentID: true,
        },
      });
      return;
    }

    final docRef = querySnapshot.docs.first.reference;
    await docRef.update({
      '${NetworkConstants.studentsPresent}.$studentID': true,
    });
  }

  @override
  Future<List<AttendanceResponse>> getAttendanceHistory() async {
    final response = await _firebaseFirestore
        .collection(NetworkConstants.attendanceCollection)
        .get();
    final documents = response.docs;
    final List<AttendanceResponse> attendanceReport = [];
    for (var doc in documents) {
      attendanceReport.add(AttendanceResponse.fromJson(doc.attendanceToMap()));
    }
    return attendanceReport;
  }
}

/*

final List<QueryDocumentSnapshot> documents = response.docs;

    for (var doc in documents) {
      print('islam full data is : ${doc.data()}');
      print(
          'islam the doc is : ${(doc.data() as Map<String, dynamic>)['date']}');
      final Timestamp timestamp = (doc.data() as Map<String, dynamic>)['date'];
      DateTime dateTime = timestamp.toDate();
      String formattedDate =
          '${DateFormat.EEEE('ar').format(dateTime)} ${DateFormat('d/M/y', 'ar').format(dateTime)}';

      print('islam formated datae is : ${formattedDate}');
      print(
          'islam the doc is : ${(doc.data() as Map<String, dynamic>)['studentsPresent']}');
    }

*/
