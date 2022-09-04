// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'initial_observation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitialObservationEvent {
  Record get record => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  MedicalInformationGeneral get medicalInformationGeneral =>
      throw _privateConstructorUsedError;
  MedicalContext get medicalContext => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Record record,
            String title,
            MedicalInformationGeneral medicalInformationGeneral,
            MedicalContext medicalContext)
        submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Record record,
            String title,
            MedicalInformationGeneral medicalInformationGeneral,
            MedicalContext medicalContext)?
        submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Record record,
            String title,
            MedicalInformationGeneral medicalInformationGeneral,
            MedicalContext medicalContext)?
        submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialObservationSubmitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialObservationSubmitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialObservationSubmitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitialObservationEventCopyWith<InitialObservationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialObservationEventCopyWith<$Res> {
  factory $InitialObservationEventCopyWith(InitialObservationEvent value,
          $Res Function(InitialObservationEvent) then) =
      _$InitialObservationEventCopyWithImpl<$Res>;
  $Res call(
      {Record record,
      String title,
      MedicalInformationGeneral medicalInformationGeneral,
      MedicalContext medicalContext});

  $RecordCopyWith<$Res> get record;
}

/// @nodoc
class _$InitialObservationEventCopyWithImpl<$Res>
    implements $InitialObservationEventCopyWith<$Res> {
  _$InitialObservationEventCopyWithImpl(this._value, this._then);

  final InitialObservationEvent _value;
  // ignore: unused_field
  final $Res Function(InitialObservationEvent) _then;

  @override
  $Res call({
    Object? record = freezed,
    Object? title = freezed,
    Object? medicalInformationGeneral = freezed,
    Object? medicalContext = freezed,
  }) {
    return _then(_value.copyWith(
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as Record,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      medicalInformationGeneral: medicalInformationGeneral == freezed
          ? _value.medicalInformationGeneral
          : medicalInformationGeneral // ignore: cast_nullable_to_non_nullable
              as MedicalInformationGeneral,
      medicalContext: medicalContext == freezed
          ? _value.medicalContext
          : medicalContext // ignore: cast_nullable_to_non_nullable
              as MedicalContext,
    ));
  }

  @override
  $RecordCopyWith<$Res> get record {
    return $RecordCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value));
    });
  }
}

/// @nodoc
abstract class _$$InitialObservationSubmittedCopyWith<$Res>
    implements $InitialObservationEventCopyWith<$Res> {
  factory _$$InitialObservationSubmittedCopyWith(
          _$InitialObservationSubmitted value,
          $Res Function(_$InitialObservationSubmitted) then) =
      __$$InitialObservationSubmittedCopyWithImpl<$Res>;
  @override
  $Res call(
      {Record record,
      String title,
      MedicalInformationGeneral medicalInformationGeneral,
      MedicalContext medicalContext});

  @override
  $RecordCopyWith<$Res> get record;
}

/// @nodoc
class __$$InitialObservationSubmittedCopyWithImpl<$Res>
    extends _$InitialObservationEventCopyWithImpl<$Res>
    implements _$$InitialObservationSubmittedCopyWith<$Res> {
  __$$InitialObservationSubmittedCopyWithImpl(
      _$InitialObservationSubmitted _value,
      $Res Function(_$InitialObservationSubmitted) _then)
      : super(_value, (v) => _then(v as _$InitialObservationSubmitted));

  @override
  _$InitialObservationSubmitted get _value =>
      super._value as _$InitialObservationSubmitted;

  @override
  $Res call({
    Object? record = freezed,
    Object? title = freezed,
    Object? medicalInformationGeneral = freezed,
    Object? medicalContext = freezed,
  }) {
    return _then(_$InitialObservationSubmitted(
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as Record,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      medicalInformationGeneral: medicalInformationGeneral == freezed
          ? _value.medicalInformationGeneral
          : medicalInformationGeneral // ignore: cast_nullable_to_non_nullable
              as MedicalInformationGeneral,
      medicalContext: medicalContext == freezed
          ? _value.medicalContext
          : medicalContext // ignore: cast_nullable_to_non_nullable
              as MedicalContext,
    ));
  }
}

/// @nodoc

class _$InitialObservationSubmitted extends InitialObservationSubmitted {
  const _$InitialObservationSubmitted(
      {required this.record,
      required this.title,
      required this.medicalInformationGeneral,
      required this.medicalContext})
      : super._();

  @override
  final Record record;
  @override
  final String title;
  @override
  final MedicalInformationGeneral medicalInformationGeneral;
  @override
  final MedicalContext medicalContext;

  @override
  String toString() {
    return 'InitialObservationEvent.submitted(record: $record, title: $title, medicalInformationGeneral: $medicalInformationGeneral, medicalContext: $medicalContext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialObservationSubmitted &&
            const DeepCollectionEquality().equals(other.record, record) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(
                other.medicalInformationGeneral, medicalInformationGeneral) &&
            const DeepCollectionEquality()
                .equals(other.medicalContext, medicalContext));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(record),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(medicalInformationGeneral),
      const DeepCollectionEquality().hash(medicalContext));

  @JsonKey(ignore: true)
  @override
  _$$InitialObservationSubmittedCopyWith<_$InitialObservationSubmitted>
      get copyWith => __$$InitialObservationSubmittedCopyWithImpl<
          _$InitialObservationSubmitted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Record record,
            String title,
            MedicalInformationGeneral medicalInformationGeneral,
            MedicalContext medicalContext)
        submitted,
  }) {
    return submitted(record, title, medicalInformationGeneral, medicalContext);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Record record,
            String title,
            MedicalInformationGeneral medicalInformationGeneral,
            MedicalContext medicalContext)?
        submitted,
  }) {
    return submitted?.call(
        record, title, medicalInformationGeneral, medicalContext);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Record record,
            String title,
            MedicalInformationGeneral medicalInformationGeneral,
            MedicalContext medicalContext)?
        submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(
          record, title, medicalInformationGeneral, medicalContext);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialObservationSubmitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialObservationSubmitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialObservationSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class InitialObservationSubmitted extends InitialObservationEvent {
  const factory InitialObservationSubmitted(
          {required final Record record,
          required final String title,
          required final String reason,
          required final MedicalInformationGeneral medicalInformationGeneral,
          required final MedicalContext medicalContext}) =
      _$InitialObservationSubmitted;
  const InitialObservationSubmitted._() : super._();

  @override
  Record get record => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  MedicalInformationGeneral get medicalInformationGeneral =>
      throw _privateConstructorUsedError;
  @override
  MedicalContext get medicalContext => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$InitialObservationSubmittedCopyWith<_$InitialObservationSubmitted>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InitialObservationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() post,
    required TResult Function() success,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialObservationInitial value) initial,
    required TResult Function(InitialObservationPost value) post,
    required TResult Function(InitialObservationSuccess value) success,
    required TResult Function(InitialObservationError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitialObservationStateCopyWith<$Res> {
  factory $InitialObservationStateCopyWith(InitialObservationState value,
          $Res Function(InitialObservationState) then) =
      _$InitialObservationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialObservationStateCopyWithImpl<$Res>
    implements $InitialObservationStateCopyWith<$Res> {
  _$InitialObservationStateCopyWithImpl(this._value, this._then);

  final InitialObservationState _value;
  // ignore: unused_field
  final $Res Function(InitialObservationState) _then;
}

/// @nodoc
abstract class _$$InitialObservationInitialCopyWith<$Res> {
  factory _$$InitialObservationInitialCopyWith(
          _$InitialObservationInitial value,
          $Res Function(_$InitialObservationInitial) then) =
      __$$InitialObservationInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialObservationInitialCopyWithImpl<$Res>
    extends _$InitialObservationStateCopyWithImpl<$Res>
    implements _$$InitialObservationInitialCopyWith<$Res> {
  __$$InitialObservationInitialCopyWithImpl(_$InitialObservationInitial _value,
      $Res Function(_$InitialObservationInitial) _then)
      : super(_value, (v) => _then(v as _$InitialObservationInitial));

  @override
  _$InitialObservationInitial get _value =>
      super._value as _$InitialObservationInitial;
}

/// @nodoc

class _$InitialObservationInitial extends InitialObservationInitial {
  const _$InitialObservationInitial() : super._();

  @override
  String toString() {
    return 'InitialObservationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialObservationInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() post,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialObservationInitial value) initial,
    required TResult Function(InitialObservationPost value) post,
    required TResult Function(InitialObservationSuccess value) success,
    required TResult Function(InitialObservationError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialObservationInitial extends InitialObservationState {
  const factory InitialObservationInitial() = _$InitialObservationInitial;
  const InitialObservationInitial._() : super._();
}

/// @nodoc
abstract class _$$InitialObservationPostCopyWith<$Res> {
  factory _$$InitialObservationPostCopyWith(_$InitialObservationPost value,
          $Res Function(_$InitialObservationPost) then) =
      __$$InitialObservationPostCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialObservationPostCopyWithImpl<$Res>
    extends _$InitialObservationStateCopyWithImpl<$Res>
    implements _$$InitialObservationPostCopyWith<$Res> {
  __$$InitialObservationPostCopyWithImpl(_$InitialObservationPost _value,
      $Res Function(_$InitialObservationPost) _then)
      : super(_value, (v) => _then(v as _$InitialObservationPost));

  @override
  _$InitialObservationPost get _value =>
      super._value as _$InitialObservationPost;
}

/// @nodoc

class _$InitialObservationPost extends InitialObservationPost {
  const _$InitialObservationPost() : super._();

  @override
  String toString() {
    return 'InitialObservationState.post()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialObservationPost);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() post,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return post();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return post?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (post != null) {
      return post();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialObservationInitial value) initial,
    required TResult Function(InitialObservationPost value) post,
    required TResult Function(InitialObservationSuccess value) success,
    required TResult Function(InitialObservationError value) error,
  }) {
    return post(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
  }) {
    return post?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
    required TResult orElse(),
  }) {
    if (post != null) {
      return post(this);
    }
    return orElse();
  }
}

abstract class InitialObservationPost extends InitialObservationState {
  const factory InitialObservationPost() = _$InitialObservationPost;
  const InitialObservationPost._() : super._();
}

/// @nodoc
abstract class _$$InitialObservationSuccessCopyWith<$Res> {
  factory _$$InitialObservationSuccessCopyWith(
          _$InitialObservationSuccess value,
          $Res Function(_$InitialObservationSuccess) then) =
      __$$InitialObservationSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialObservationSuccessCopyWithImpl<$Res>
    extends _$InitialObservationStateCopyWithImpl<$Res>
    implements _$$InitialObservationSuccessCopyWith<$Res> {
  __$$InitialObservationSuccessCopyWithImpl(_$InitialObservationSuccess _value,
      $Res Function(_$InitialObservationSuccess) _then)
      : super(_value, (v) => _then(v as _$InitialObservationSuccess));

  @override
  _$InitialObservationSuccess get _value =>
      super._value as _$InitialObservationSuccess;
}

/// @nodoc

class _$InitialObservationSuccess extends InitialObservationSuccess {
  const _$InitialObservationSuccess() : super._();

  @override
  String toString() {
    return 'InitialObservationState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialObservationSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() post,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialObservationInitial value) initial,
    required TResult Function(InitialObservationPost value) post,
    required TResult Function(InitialObservationSuccess value) success,
    required TResult Function(InitialObservationError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class InitialObservationSuccess extends InitialObservationState {
  const factory InitialObservationSuccess() = _$InitialObservationSuccess;
  const InitialObservationSuccess._() : super._();
}

/// @nodoc
abstract class _$$InitialObservationErrorCopyWith<$Res> {
  factory _$$InitialObservationErrorCopyWith(_$InitialObservationError value,
          $Res Function(_$InitialObservationError) then) =
      __$$InitialObservationErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialObservationErrorCopyWithImpl<$Res>
    extends _$InitialObservationStateCopyWithImpl<$Res>
    implements _$$InitialObservationErrorCopyWith<$Res> {
  __$$InitialObservationErrorCopyWithImpl(_$InitialObservationError _value,
      $Res Function(_$InitialObservationError) _then)
      : super(_value, (v) => _then(v as _$InitialObservationError));

  @override
  _$InitialObservationError get _value =>
      super._value as _$InitialObservationError;
}

/// @nodoc

class _$InitialObservationError extends InitialObservationError {
  const _$InitialObservationError() : super._();

  @override
  String toString() {
    return 'InitialObservationState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialObservationError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() post,
    required TResult Function() success,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? post,
    TResult Function()? success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialObservationInitial value) initial,
    required TResult Function(InitialObservationPost value) post,
    required TResult Function(InitialObservationSuccess value) success,
    required TResult Function(InitialObservationError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialObservationInitial value)? initial,
    TResult Function(InitialObservationPost value)? post,
    TResult Function(InitialObservationSuccess value)? success,
    TResult Function(InitialObservationError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class InitialObservationError extends InitialObservationState {
  const factory InitialObservationError() = _$InitialObservationError;
  const InitialObservationError._() : super._();
}
