import 'package:firebase_auth/firebase_auth.dart';
import 'package:menofia_military/data/network/failure.dart';
import 'package:menofia_military/presentation/resources/app_strings.dart';

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
    message: AppStrings.firebaseGenericError,
  );
}

Failure _handleFirebaseAuthError(FirebaseAuthException error) {
  switch (error.code) {
    case AppStrings.firebaseInvalidEmailCode:
      return DataSource.firebaseInvalidEmail.getFailure();
    case AppStrings.firebaseUserDisabledCode:
      return DataSource.firebaseUserDisabled.getFailure();
    case AppStrings.firebaseUserNotFoundCode:
      return DataSource.firebaseUserNotFound.getFailure();
    case AppStrings.firebaseWrongPasswordCode:
      return DataSource.firebaseWrongPassword.getFailure();
    case AppStrings.firebaseEmailAlreadyInUseCode:
      return DataSource.firebaseEmailAlreadyInUse.getFailure();
    case AppStrings.firebaseWeakPasswordCode:
      return DataSource.firebaseWeakPassword.getFailure();
    case AppStrings.firebaseOperationNotAllowedCode:
      return DataSource.firebaseOperationNotAllowed.getFailure();
    case AppStrings.firebaseTooManyRequestsCode:
      return DataSource.firebaseTooManyRequests.getFailure();
    case AppStrings.firebaseNetworkErrorCode:
      return DataSource.firebaseNetworkError.getFailure();
    case AppStrings.firebaseInvalidcredentialsCode:
      return DataSource.firebaseInvalidcredentialsCode.getFailure();
    default:
      return Failure(
        code: ResponseCode.firebaseUnknownError,
        message: error.message ?? AppStrings.firebaseUnknownError,
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
            message: AppStrings.firebaseUserNotFound);
      case DataSource.firebaseWrongPassword:
        return Failure(
            code: ResponseCode.firebaseWrongPassword,
            message: AppStrings.firebaseWrongPassword);
      case DataSource.firebaseEmailAlreadyInUse:
        return Failure(
            code: ResponseCode.firebaseEmailAlreadyInUse,
            message: AppStrings.firebaseEmailAlreadyInUse);
      case DataSource.firebaseInvalidEmail:
        return Failure(
            code: ResponseCode.firebaseInvalidEmail,
            message: AppStrings.firebaseInvalidEmail);
      case DataSource.firebaseWeakPassword:
        return Failure(
            code: ResponseCode.firebaseWeakPassword,
            message: AppStrings.firebaseWeakPassword);
      case DataSource.firebaseNetworkError:
        return Failure(
            code: ResponseCode.firebaseNetworkError,
            message: AppStrings.firebaseNetworkError);
      case DataSource.firebaseTooManyRequests:
        return Failure(
            code: ResponseCode.firebaseTooManyRequests,
            message: AppStrings.firebaseTooManyRequests);
      case DataSource.firebaseUserDisabled:
        return Failure(
            code: ResponseCode.firebaseUserDisabled,
            message: AppStrings.firebaseUserDisabled);
      case DataSource.firebaseOperationNotAllowed:
        return Failure(
            code: ResponseCode.firebaseOperationNotAllowed,
            message: AppStrings.firebaseOperationNotAllowed);
      case DataSource.noInternetConnection:
        return Failure(
            code: ResponseCode.noInternetConnection,
            message: AppStrings.noInternetConnection);
      case DataSource.notFoundError:
        return Failure(
            code: ResponseCode.notFoundCode, message: AppStrings.notFoundError);
      case DataSource.firebaseInvalidcredentialsCode:
        return Failure(
            code: ResponseCode.firebaseInvalidcredentialsCode,
            message: AppStrings.invalidCredsError);
      default:
        return Failure(
            code: ResponseCode.defaultError, message: AppStrings.defaultError);
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
