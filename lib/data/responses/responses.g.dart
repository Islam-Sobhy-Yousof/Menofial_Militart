// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAuthenticationResponse _$StudentAuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    StudentAuthenticationResponse(
      sutdentID: json['studentID'] as String?,
      studentName: json['studentName'] as String?,
      studentCollege: json['studentCollege'] as String?,
    );

Map<String, dynamic> _$StudentAuthenticationResponseToJson(
        StudentAuthenticationResponse instance) =>
    <String, dynamic>{
      'studentID': instance.sutdentID,
      'studentName': instance.studentName,
      'studentCollege': instance.studentCollege,
    };

SuperAuthenticationResponse _$SuperAuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    SuperAuthenticationResponse(
      superEmail: json['email'] as String?,
      superName: json['displayName'] as String?,
      superToken: json['token'] as String?,
    );

Map<String, dynamic> _$SuperAuthenticationResponseToJson(
        SuperAuthenticationResponse instance) =>
    <String, dynamic>{
      'email': instance.superEmail,
      'displayName': instance.superName,
      'token': instance.superToken,
    };

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) =>
    AttendanceResponse(
      date: json['date'] as String?,
      studentsPresent: json['studentsPresent'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AttendanceResponseToJson(AttendanceResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'studentsPresent': instance.studentsPresent,
    };
