import 'package:firebase_auth/firebase_auth.dart';
import 'package:menofia_military/data/network/failure.dart';
import 'package:menofia_military/presentation/resources/strings_manager.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is FirebaseAuthException) {
      failure = _handleFirebaseAuthError(error);
    } else if (error is FirebaseException) {
      failure = _handleGenericFirebaseError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleGenericFirebaseError(FirebaseException error) {
  return Failure(
    code: ResponseCode.firebaseGenericError,
    message: StringsManager.firebaseGenericError,
  );
}

Failure _handleFirebaseAuthError(FirebaseAuthException error) {
  switch (error.code) {
    case FirebaseErrorMessages.firebaseInvalidEmailCode:
      return DataSource.firebaseInvalidEmail.getFailure();
    case FirebaseErrorMessages.firebaseUserDisabledCode:
      return DataSource.firebaseUserDisabled.getFailure();
    case FirebaseErrorMessages.firebaseUserNotFoundCode:
      return DataSource.firebaseUserNotFound.getFailure();
    case FirebaseErrorMessages.firebaseWrongPasswordCode:
      return DataSource.firebaseWrongPassword.getFailure();
    case FirebaseErrorMessages.firebaseEmailAlreadyInUseCode:
      return DataSource.firebaseEmailAlreadyInUse.getFailure();
    case FirebaseErrorMessages.firebaseWeakPasswordCode:
      return DataSource.firebaseWeakPassword.getFailure();
    case FirebaseErrorMessages.firebaseOperationNotAllowedCode:
      return DataSource.firebaseOperationNotAllowed.getFailure();
    case FirebaseErrorMessages.firebaseTooManyRequestsCode:
      return DataSource.firebaseTooManyRequests.getFailure();
    case FirebaseErrorMessages.firebaseNetworkErrorCode:
      return DataSource.firebaseNetworkError.getFailure();
    case FirebaseErrorMessages.firebaseInvalidcredentialsCode:
      return DataSource.firebaseInvalidcredentialsCode.getFailure();
    default:
      return Failure(
        code: ResponseCode.firebaseUnknownError,
        message: error.message ?? StringsManager.firebaseUnknownError,
      );
  }
}

enum DataSource {
  defaultError,

  // Firebase-specific
  firebaseUserNotFound,
  firebaseWrongPassword,
  firebaseEmailAlreadyInUse,
  firebaseInvalidEmail,
  firebaseWeakPassword,
  firebaseNetworkError,
  firebaseTooManyRequests,
  firebaseUserDisabled,
  firebaseOperationNotAllowed,
  firebaseInvalidcredentialsCode,
  noInternetConnection,
  notFoundError,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.firebaseUserNotFound:
        return Failure(
            code: ResponseCode.firebaseUserNotFound,
            message: StringsManager.firebaseUserNotFound);
      case DataSource.firebaseWrongPassword:
        return Failure(
            code: ResponseCode.firebaseWrongPassword,
            message: StringsManager.firebaseWrongPassword);
      case DataSource.firebaseEmailAlreadyInUse:
        return Failure(
            code: ResponseCode.firebaseEmailAlreadyInUse,
            message: StringsManager.firebaseEmailAlreadyInUse);
      case DataSource.firebaseInvalidEmail:
        return Failure(
            code: ResponseCode.firebaseInvalidEmail,
            message: StringsManager.firebaseInvalidEmail);
      case DataSource.firebaseWeakPassword:
        return Failure(
            code: ResponseCode.firebaseWeakPassword,
            message: StringsManager.firebaseWeakPassword);
      case DataSource.firebaseNetworkError:
        return Failure(
            code: ResponseCode.firebaseNetworkError,
            message: StringsManager.firebaseNetworkError);
      case DataSource.firebaseTooManyRequests:
        return Failure(
            code: ResponseCode.firebaseTooManyRequests,
            message: StringsManager.firebaseTooManyRequests);
      case DataSource.firebaseUserDisabled:
        return Failure(
            code: ResponseCode.firebaseUserDisabled,
            message: StringsManager.firebaseUserDisabled);
      case DataSource.firebaseOperationNotAllowed:
        return Failure(
            code: ResponseCode.firebaseOperationNotAllowed,
            message: StringsManager.firebaseOperationNotAllowed);
      case DataSource.noInternetConnection:
        return Failure(
            code: ResponseCode.noInternetConnection,
            message: StringsManager.noInternetConnection);
      case DataSource.notFoundError:
        return Failure(
            code: ResponseCode.notFoundCode,
            message: StringsManager.notFoundError);
      case DataSource.firebaseInvalidcredentialsCode:
        return Failure(
            code: ResponseCode.firebaseInvalidcredentialsCode,
            message: StringsManager.invalidCredsError);
      default:
        return Failure(
            code: ResponseCode.defaultError,
            message: StringsManager.defaultError);
    }
  }
}

class ResponseCode {
  static const int noInternetConnection = -1;
  static const int notFoundCode = -2;
  static const int defaultError = -7;
  static const int firebaseInvalidcredentialsCode = -3;
  static const int firebaseUserNotFound = -10;
  static const int firebaseWrongPassword = -11;
  static const int firebaseEmailAlreadyInUse = -12;
  static const int firebaseInvalidEmail = -13;
  static const int firebaseWeakPassword = -14;
  static const int firebaseNetworkError = -15;
  static const int firebaseTooManyRequests = -16;
  static const int firebaseUserDisabled = -17;
  static const int firebaseOperationNotAllowed = -18;
  static const int firebaseUnknownError = -19;
  static const int firebaseGenericError = -20;
}



abstract class FirebaseErrorMessages {
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

}