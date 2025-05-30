// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentObject {
  String get studentID;

  /// Create a copy of StudentObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StudentObjectCopyWith<StudentObject> get copyWith =>
      _$StudentObjectCopyWithImpl<StudentObject>(
          this as StudentObject, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StudentObject &&
            (identical(other.studentID, studentID) ||
                other.studentID == studentID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, studentID);

  @override
  String toString() {
    return 'StudentObject(studentID: $studentID)';
  }
}

/// @nodoc
abstract mixin class $StudentObjectCopyWith<$Res> {
  factory $StudentObjectCopyWith(
          StudentObject value, $Res Function(StudentObject) _then) =
      _$StudentObjectCopyWithImpl;
  @useResult
  $Res call({String studentID});
}

/// @nodoc
class _$StudentObjectCopyWithImpl<$Res>
    implements $StudentObjectCopyWith<$Res> {
  _$StudentObjectCopyWithImpl(this._self, this._then);

  final StudentObject _self;
  final $Res Function(StudentObject) _then;

  /// Create a copy of StudentObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentID = null,
  }) {
    return _then(_self.copyWith(
      studentID: null == studentID
          ? _self.studentID
          : studentID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _StudentObject implements StudentObject {
  const _StudentObject({required this.studentID});

  @override
  final String studentID;

  /// Create a copy of StudentObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StudentObjectCopyWith<_StudentObject> get copyWith =>
      __$StudentObjectCopyWithImpl<_StudentObject>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StudentObject &&
            (identical(other.studentID, studentID) ||
                other.studentID == studentID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, studentID);

  @override
  String toString() {
    return 'StudentObject(studentID: $studentID)';
  }
}

/// @nodoc
abstract mixin class _$StudentObjectCopyWith<$Res>
    implements $StudentObjectCopyWith<$Res> {
  factory _$StudentObjectCopyWith(
          _StudentObject value, $Res Function(_StudentObject) _then) =
      __$StudentObjectCopyWithImpl;
  @override
  @useResult
  $Res call({String studentID});
}

/// @nodoc
class __$StudentObjectCopyWithImpl<$Res>
    implements _$StudentObjectCopyWith<$Res> {
  __$StudentObjectCopyWithImpl(this._self, this._then);

  final _StudentObject _self;
  final $Res Function(_StudentObject) _then;

  /// Create a copy of StudentObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? studentID = null,
  }) {
    return _then(_StudentObject(
      studentID: null == studentID
          ? _self.studentID
          : studentID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SuperLoginObject {
  String get superEmail;
  String get superPassword;

  /// Create a copy of SuperLoginObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuperLoginObjectCopyWith<SuperLoginObject> get copyWith =>
      _$SuperLoginObjectCopyWithImpl<SuperLoginObject>(
          this as SuperLoginObject, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuperLoginObject &&
            (identical(other.superEmail, superEmail) ||
                other.superEmail == superEmail) &&
            (identical(other.superPassword, superPassword) ||
                other.superPassword == superPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, superEmail, superPassword);

  @override
  String toString() {
    return 'SuperLoginObject(superEmail: $superEmail, superPassword: $superPassword)';
  }
}

/// @nodoc
abstract mixin class $SuperLoginObjectCopyWith<$Res> {
  factory $SuperLoginObjectCopyWith(
          SuperLoginObject value, $Res Function(SuperLoginObject) _then) =
      _$SuperLoginObjectCopyWithImpl;
  @useResult
  $Res call({String superEmail, String superPassword});
}

/// @nodoc
class _$SuperLoginObjectCopyWithImpl<$Res>
    implements $SuperLoginObjectCopyWith<$Res> {
  _$SuperLoginObjectCopyWithImpl(this._self, this._then);

  final SuperLoginObject _self;
  final $Res Function(SuperLoginObject) _then;

  /// Create a copy of SuperLoginObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? superEmail = null,
    Object? superPassword = null,
  }) {
    return _then(_self.copyWith(
      superEmail: null == superEmail
          ? _self.superEmail
          : superEmail // ignore: cast_nullable_to_non_nullable
              as String,
      superPassword: null == superPassword
          ? _self.superPassword
          : superPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SuperLoginObject implements SuperLoginObject {
  const _SuperLoginObject(
      {required this.superEmail, required this.superPassword});

  @override
  final String superEmail;
  @override
  final String superPassword;

  /// Create a copy of SuperLoginObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuperLoginObjectCopyWith<_SuperLoginObject> get copyWith =>
      __$SuperLoginObjectCopyWithImpl<_SuperLoginObject>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuperLoginObject &&
            (identical(other.superEmail, superEmail) ||
                other.superEmail == superEmail) &&
            (identical(other.superPassword, superPassword) ||
                other.superPassword == superPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, superEmail, superPassword);

  @override
  String toString() {
    return 'SuperLoginObject(superEmail: $superEmail, superPassword: $superPassword)';
  }
}

/// @nodoc
abstract mixin class _$SuperLoginObjectCopyWith<$Res>
    implements $SuperLoginObjectCopyWith<$Res> {
  factory _$SuperLoginObjectCopyWith(
          _SuperLoginObject value, $Res Function(_SuperLoginObject) _then) =
      __$SuperLoginObjectCopyWithImpl;
  @override
  @useResult
  $Res call({String superEmail, String superPassword});
}

/// @nodoc
class __$SuperLoginObjectCopyWithImpl<$Res>
    implements _$SuperLoginObjectCopyWith<$Res> {
  __$SuperLoginObjectCopyWithImpl(this._self, this._then);

  final _SuperLoginObject _self;
  final $Res Function(_SuperLoginObject) _then;

  /// Create a copy of SuperLoginObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? superEmail = null,
    Object? superPassword = null,
  }) {
    return _then(_SuperLoginObject(
      superEmail: null == superEmail
          ? _self.superEmail
          : superEmail // ignore: cast_nullable_to_non_nullable
              as String,
      superPassword: null == superPassword
          ? _self.superPassword
          : superPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$StudentQrCodeObject {
  String get studentID;

  /// Create a copy of StudentQrCodeObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StudentQrCodeObjectCopyWith<StudentQrCodeObject> get copyWith =>
      _$StudentQrCodeObjectCopyWithImpl<StudentQrCodeObject>(
          this as StudentQrCodeObject, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StudentQrCodeObject &&
            (identical(other.studentID, studentID) ||
                other.studentID == studentID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, studentID);

  @override
  String toString() {
    return 'StudentQrCodeObject(studentID: $studentID)';
  }
}

/// @nodoc
abstract mixin class $StudentQrCodeObjectCopyWith<$Res> {
  factory $StudentQrCodeObjectCopyWith(
          StudentQrCodeObject value, $Res Function(StudentQrCodeObject) _then) =
      _$StudentQrCodeObjectCopyWithImpl;
  @useResult
  $Res call({String studentID});
}

/// @nodoc
class _$StudentQrCodeObjectCopyWithImpl<$Res>
    implements $StudentQrCodeObjectCopyWith<$Res> {
  _$StudentQrCodeObjectCopyWithImpl(this._self, this._then);

  final StudentQrCodeObject _self;
  final $Res Function(StudentQrCodeObject) _then;

  /// Create a copy of StudentQrCodeObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentID = null,
  }) {
    return _then(_self.copyWith(
      studentID: null == studentID
          ? _self.studentID
          : studentID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _StudentQrCodeObject implements StudentQrCodeObject {
  const _StudentQrCodeObject({required this.studentID});

  @override
  final String studentID;

  /// Create a copy of StudentQrCodeObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StudentQrCodeObjectCopyWith<_StudentQrCodeObject> get copyWith =>
      __$StudentQrCodeObjectCopyWithImpl<_StudentQrCodeObject>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StudentQrCodeObject &&
            (identical(other.studentID, studentID) ||
                other.studentID == studentID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, studentID);

  @override
  String toString() {
    return 'StudentQrCodeObject(studentID: $studentID)';
  }
}

/// @nodoc
abstract mixin class _$StudentQrCodeObjectCopyWith<$Res>
    implements $StudentQrCodeObjectCopyWith<$Res> {
  factory _$StudentQrCodeObjectCopyWith(_StudentQrCodeObject value,
          $Res Function(_StudentQrCodeObject) _then) =
      __$StudentQrCodeObjectCopyWithImpl;
  @override
  @useResult
  $Res call({String studentID});
}

/// @nodoc
class __$StudentQrCodeObjectCopyWithImpl<$Res>
    implements _$StudentQrCodeObjectCopyWith<$Res> {
  __$StudentQrCodeObjectCopyWithImpl(this._self, this._then);

  final _StudentQrCodeObject _self;
  final $Res Function(_StudentQrCodeObject) _then;

  /// Create a copy of StudentQrCodeObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? studentID = null,
  }) {
    return _then(_StudentQrCodeObject(
      studentID: null == studentID
          ? _self.studentID
          : studentID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
