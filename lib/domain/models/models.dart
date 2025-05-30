class StudentAuthentication {
  final String studentId;
  final String studentName;
  final String studentCollege;

  StudentAuthentication(
      {required this.studentId,
      required this.studentName,
      required this.studentCollege});
}

class SuperAuthentication {
  final String superName;
  final String superEmail;
  final String superToken;

  SuperAuthentication(
      {required this.superName,
      required this.superEmail,
      required this.superToken});
}

class Attendance {
  final String dates;
  final Map<String, dynamic> studentsPresent;

  Attendance({
    required this.dates,
    required this.studentsPresent,
  });
}
