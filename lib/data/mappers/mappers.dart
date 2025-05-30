import 'package:menofia_military/app/app_constants.dart';
import 'package:menofia_military/app/extensions.dart';
import 'package:menofia_military/data/responses/responses.dart';
import 'package:menofia_military/domain/models/models.dart';

extension StudentAuthenticationResponseMapper
    on StudentAuthenticationResponse? {
  StudentAuthentication toDomain() {
    return StudentAuthentication(
        studentId: this?.sutdentID.orEmpty() ?? AppConstants.empty,
        studentName: this?.studentName.orEmpty() ?? AppConstants.empty,
        studentCollege: this?.studentCollege.orEmpty() ?? AppConstants.empty);
  }
}

extension SuperAuthenticationResponseMapper on SuperAuthenticationResponse? {
  SuperAuthentication toDomain() {
    return SuperAuthentication(
        superName: this?.superName.orEmpty() ?? AppConstants.empty,
        superEmail: this?.superEmail.orEmpty() ?? AppConstants.empty,
        superToken: this?.superToken.orEmpty() ?? AppConstants.empty);
  }
}

extension Sss on AttendanceResponse? {
  Attendance toDomain() {
  
    return Attendance(
      dates: this?.date ?? AppConstants.empty,
      studentsPresent: this?.studentsPresent ?? {},
    );
  }
}
