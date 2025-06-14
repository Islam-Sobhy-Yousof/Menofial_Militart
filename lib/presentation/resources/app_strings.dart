abstract class StringsManager {
  // ───── Navigation & Routing ─────
  static const String noRouteFound = "Page not found.";

  // ───── Authentication ─────
  static const String registeredSuccessfully = "Account created.";
  static const String login = "تسجيل الدخول";
  static const String studentsExams = "الإمتحانات";
  static const String hiMessage = " أهلاً ";
  static const String noStudentsData = "لا يوجد طلاب مسجلون";
  static const String singleStudentData = "طالب واحد";
  static const String pairOfStudnetsData = "طالبان";
  static const String multipleStudnetsData = "طلاب";
  static const String unKnownFailure =
      'حدث خطأ غير معروف برجاء الرجوع للدعم الفني';
  static const String scanSuccessMessage = 'تم تسجيل الحضور بنجاح';
  static const String scanFailureMessage =
      ' حدث خطأ ما في عملية التسجيل تحقق من إتصالك أو من صحة الرمز';
  static const String register = "Register";
  static const String forgetPassword = "Forgot password?";
  static const String alreadyHaveAnAccount = "Already have an account?";
  static const String resetPassword = "Reset Password";
  static const String donNotHaveAnAccount = "Don't have an account?";

  // ───── Form Labels ─────
  static const String userName = "Username";
  static const String email = "Email";
  static const String password = "Password";
  static const String mobileNumber = "Mobile Number";
  static const String countryCode = "Country Code";

  // ───── Validation Errors ─────
  static const String userNameError = "Username must be at least 4 characters.";
  static const String emailError = "البريد الإلكتروني غير صحيح";
  static const String passwordError = "لا يمكنك ترك حقل كلمة المرور فارغاً";
  static const String mobileNumberError = "Mobile number must be 10-15 digits.";
  static const String countryCodeError = "Invalid country code format.";

  // ───── Onboarding ─────
  static const String onBoardingTitle1 = "Discover Courses";
  static const String onBoardingSubTitle1 =
      "Find courses that match your goals.";
  static const String onBoardingTitle2 = "Track Progress";
  static const String onBoardingSubTitle2 =
      "Monitor milestones and achievements.";
  static const String onBoardingTitle3 = "Learn Anytime";
  static const String onBoardingSubTitle3 = "Study when and where you want.";
  static const String onBoardingTitle4 = "Earn Certificates";
  static const String onBoardingSubTitle4 =
      "Showcase your skills with certificates.";
  static const String skip = "Skip";

  // ───── Server & Network Responses ─────
  static const String success = "تم التحقق بنجاح";
  static const String noContent = "لا توجد بيانات لعرضها";
  static const String badRequestError = "Invalid request.";
  static const String unauthorizedError = "Please login to continue.";
  static const String forbiddenError = "Access denied.";
  static const String internalServerError = "Server error. Try again later.";

  static const String timeoutError = "Request timed out.";
  static const String defaultError =
      "حدث خطأ ما برجاء الماحاولة مرة أخرى لاحقا";
  static const String cacheError = "Cache error.";
  static const String noInternetError = "No internet connection.";

  // ───── General UI ─────
  static const String loading = "يتم التحميل";
  static const String retryAgain = "حاول مجدداً";
  static const String fullscreenErrorMessage = "حدث خطأ ما, حاول  مجدداً";
  static const String fullscreenEmptyMessage = "لا توجد بيانات متوفرة";
  static const String ok = "حسناً";
  static const String profilePicture = "Profile picture";
  static const String photoGallery = "From gallery";
  static const String photoCamera = "From camera";
  static const String home = "Home";
  static const String search = "Search";
  static const String notifications = "Notifications";
  static const String settings = "Settings";

// Firebase Auth Error Codes
  static const String firebaseInvalidEmailCode = 'invalid-email';
  static const String firebaseUserDisabledCode = 'user-disabled';
  static const String firebaseUserNotFoundCode = 'user-not-found';
  static const String firebaseWrongPasswordCode = 'wrong-password';
  static const String firebaseEmailAlreadyInUseCode = 'email-already-in-use';
  static const String firebaseWeakPasswordCode = 'weak-password';
  static const String firebaseOperationNotAllowedCode = 'operation-not-allowed';
  static const String firebaseTooManyRequestsCode = 'too-many-requests';
  static const String firebaseNetworkErrorCode = 'network-request-failed';
  static const String firebaseInvalidcredentialsCode = 'invalid-credential';

// Firebase Auth Error Messages (Arabic)
  static const String firebaseInvalidEmail = 'البريد الإلكتروني غير صالح.';
  static const String noQRCodeData = 'لا توجد بيانات لإنشاء كود الحضور ';
  static const String studentAttendanceReport = 'تقرير الحضور';
  static const String studentQrGenerator = 'كود الحضور';
  static const String studentAttendanceReportPage = 'تقرير حضور الطالب';
  static const String superScanAttendacneQRPage = 'مسح كود الحضور';
  static const String superAttendanceReportPage = 'تقرير حضور الطلاب';
  static const String studentQrGeneratorPage = 'كود حضور الطالب';
  static const String firebaseUserDisabled = 'تم تعطيل هذا المستخدم.';
  static const String studentIDField = 'مسلسل الطالب';
  static const String superEmailField = 'البريد الإلكتروني';
  static const String superEmailFieldError = 'البريد الإلكتروني غير صحيح';
  static const String superPasswordField = 'كلمة المرور';
  static const String superPasswordFieldError =
      'كلمة السر يجب أن تكون حرف على الأقل';
  static const String studentIDError = 'مسلسل الطالب غير صحيح';
  static const String firebaseUserNotFound =
      'لم يتم العثور على مستخدم بهذا البريد الإلكتروني.';
  static const String firebaseWrongPassword = 'كلمة المرور غير صحيحة.';
  static const String firebaseEmailAlreadyInUse =
      'البريد الإلكتروني مستخدم بالفعل.';
  static const String firebaseWeakPassword = 'كلمة المرور ضعيفة جداً.';
  static const String firebaseOperationNotAllowed =
      'هذا النوع من العمليات غير مسموح.';
  static const String firebaseTooManyRequests =
      'عدد كبير من المحاولات، الرجاء المحاولة لاحقًا.';
  static const String firebaseNetworkError = 'فشل الاتصال بالشبكة.';
  static const String notFoundError = "لم يتم العثور على نتائج";
  static const String invalidCredsError = 'البيانات التي أدخلتها غير صحيحه';
  static const String firebaseUnknownError = 'حدث خطأ غير معروف.';
  static const String noInternetConnection = 'لا يوجد اتصال بالشبكة ';
  static const String firebaseGenericError =
      'حدث خطأ في غير معروف برجاء الرجوع للدعم الفني.';

  static const String areYouASuper = 'هل أنت مٌشرف؟ ';
  static const String areYouStudent = 'هل انت طالب؟ ';
}
