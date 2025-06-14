abstract class StringsManager {
  // ───── Authentication ─────
  static const String login = "تسجيل الدخول";
  static const String hiMessage = "أهلاً";
  static const String areYouASuper = 'هل أنت مٌشرف؟';
  static const String areYouStudent = 'هل انت طالب؟';

  // ───── Attendance & Exams ─────
  static const String studentsAttendance = "تسجيل حضور الطلاب";
  static const String studentsAttendanceReport = "تقرير حضور الطلاب";
  static const String studentAttendanceReport = 'تقرير الحضور';
  static const String exams = "الإمتحانات";
  static const String scanSuccessMessage = 'تم تسجيل الحضور بنجاح';
  static const String scanFailureMessage =
      'فشل التسجيل، تحقق من الاتصال أو الرمز';
  static const String noQRCodeData = 'لا توجد بيانات لإنشاء كود الحضور';

  // ───── Pages Titles ─────
  static const String studentAttendanceReportPage = 'تقرير حضور الطالب';
  static const String superScanAttendacneQRPage = 'مسح كود الحضور';
  static const String superAttendanceReportPage = 'تقرير حضور الطلاب';
  static const String studentQrGeneratorPage = 'كود حضور الطالب';
  static const String studentQrGenerator = 'كود الحضور';
  static const String superMainPageLabel = 'الرئيسية';

  // ───── Form Labels ─────
  static const String studentIDField = 'مسلسل الطالب';
  static const String superEmailField = 'البريد الإلكتروني';
  static const String superPasswordField = 'كلمة المرور';

  // ───── Validation Errors ─────
  static const String emailError = "البريد الإلكتروني غير صحيح";
  static const String passwordError = "لا يمكنك ترك كلمة المرور فارغة";
  static const String superEmailFieldError = 'البريد الإلكتروني غير صحيح';
  static const String superPasswordFieldError =
      'كلمة السر يجب أن تكون حرفًا على الأقل';
  static const String studentIDError = 'مسلسل الطالب غير صحيح';
  static const String invalidCredsError = 'البيانات غير صحيحة';

  // ───── Student Data Info ─────
  static const String noStudentsData = "لا يوجد طلاب مسجلون";
  static const String singleStudentData = "طالب واحد";
  static const String pairOfStudnetsData = "طالبان";
  static const String multipleStudnetsData = "طلاب";

  // ───── Firebase Errors ─────
  static const String firebaseInvalidEmail = 'البريد الإلكتروني غير صالح.';
  static const String firebaseUserDisabled = 'تم تعطيل هذا المستخدم.';
  static const String firebaseUserNotFound = 'المستخدم غير موجود.';
  static const String firebaseWrongPassword = 'كلمة المرور غير صحيحة.';
  static const String firebaseEmailAlreadyInUse = 'البريد الإلكتروني مستخدم.';
  static const String firebaseWeakPassword = 'كلمة المرور ضعيفة.';
  static const String firebaseOperationNotAllowed = 'العملية غير مسموحة.';
  static const String firebaseTooManyRequests = 'محاولات كثيرة، جرب لاحقًا.';
  static const String firebaseNetworkError = 'فشل الاتصال بالشبكة.';
  static const String firebaseUnknownError = 'خطأ غير معروف.';
  static const String firebaseGenericError = 'حدث خطأ، راجع الدعم الفني.';

  // ───── Server & Network Responses ─────
  static const String success = "تم التحقق بنجاح";
  static const String noContent = "لا توجد بيانات";
  static const String defaultError = "حدث خطأ، حاول لاحقاً";
  static const String cacheError = "خطأ في التخزين المؤقت";
  static const String notFoundError = "لا توجد نتائج";
  static const String noInternetConnection = 'لا يوجد اتصال بالشبكة';

  // ───── General UI ─────
  static const String loading = "يتم التحميل";
  static const String wrongQrCodeValue = "برجاء التحقق من صحة الرمز ";
  static const String retryAgain = "حاول مجددًا";
  static const String ok = "حسناً";
  static const String fullscreenErrorMessage = "حدث خطأ، حاول مجددًا";
  static const String fullscreenEmptyMessage = "لا توجد بيانات متوفرة";

  // ───── Unknown Failures ─────
  static const String unKnownFailure = 'حدث خطأ، راجع الدعم الفني';
}
