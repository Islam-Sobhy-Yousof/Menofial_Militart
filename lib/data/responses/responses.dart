import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:menofia_military/data/network/network_constants.dart';

part 'responses.g.dart';

@JsonSerializable()
class StudentAuthenticationResponse {
  @JsonKey(name: NetworkConstants.sutdentID)
  final String? sutdentID;
  @JsonKey(name: NetworkConstants.studentName)
  final String? studentName;
  @JsonKey(name: NetworkConstants.studentCollege)
  final String? studentCollege;
  StudentAuthenticationResponse({
    required this.sutdentID,
    required this.studentName,
    required this.studentCollege,
  });
  // from json
  factory StudentAuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentAuthenticationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$StudentAuthenticationResponseToJson(this);

   StudentAuthenticationResponse copyWith({
    String? sutdentID,
    String? studentName,
    String? studentCollege,
  }) {
    return StudentAuthenticationResponse(
      sutdentID: sutdentID ?? this.sutdentID,
      studentName: studentName ?? this.studentName,
      studentCollege: studentCollege ?? this.studentCollege,
    );
  }
}

@JsonSerializable()
class SuperAuthenticationResponse {
  @JsonKey(
    name: NetworkConstants.superEmail,
  )
  final String? superEmail;

  @JsonKey(
    name: NetworkConstants.superName,
  )
  final String? superName;

  @JsonKey(
    name: NetworkConstants.superToken,
  )
  final String? superToken;

  SuperAuthenticationResponse(
      {required this.superEmail,
      required this.superName,
      required this.superToken});

  factory SuperAuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$SuperAuthenticationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$SuperAuthenticationResponseToJson(this);
  SuperAuthenticationResponse copyWith({
    String? superEmail,
    String? superName,
    String? superToken,
  }) {
    return SuperAuthenticationResponse(
      superEmail: superEmail ?? this.superEmail,
      superName: superName ?? this.superName,
      superToken: superToken ?? this.superToken,
    );
  }
  
}
@JsonSerializable()
class AttendanceResponse {
  @JsonKey(
    name: NetworkConstants.date,
  )
  final String? date;
   @JsonKey(
    name: NetworkConstants.studentsPresent,
  )
  final Map<String,dynamic>? studentsPresent;

  AttendanceResponse({
    required this.date,
    required this.studentsPresent,
  });

 factory AttendanceResponse.fromJson(Map<String,dynamic> json) => _$AttendanceResponseFromJson(json);

  Map<String,dynamic> toJson() => _$AttendanceResponseToJson(this);

    AttendanceResponse copyWith({
    String? date,
    Map<String, dynamic>? studentsPresent,
  }) {
    return AttendanceResponse(
      date: date ?? this.date,
      studentsPresent: studentsPresent ?? this.studentsPresent,
    );
  }


}
