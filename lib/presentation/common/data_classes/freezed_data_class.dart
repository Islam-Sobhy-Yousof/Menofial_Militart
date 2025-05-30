import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_class.freezed.dart';

@freezed
abstract class StudentObject with _$StudentObject {
  const factory StudentObject({
    required String studentID,
  }) = _StudentObject;
}

@freezed
abstract class SuperLoginObject with _$SuperLoginObject {
  const factory SuperLoginObject({
    required String superEmail,
    required String superPassword,
  }) = _SuperLoginObject;
}

@freezed
abstract class StudentQrCodeObject with _$StudentQrCodeObject {
  const factory StudentQrCodeObject({
    required String studentID,
  }) = _StudentQrCodeObject;
}
