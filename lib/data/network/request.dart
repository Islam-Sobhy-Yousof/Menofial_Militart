class StudentLoginRequest {
  final String sutdentID;

  StudentLoginRequest({required this.sutdentID});
}

class SuperLoginRequest {
  final String email;
  final String password;

  SuperLoginRequest({
    required this.email,
    required this.password,
  });
}
