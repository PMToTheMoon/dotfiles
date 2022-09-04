// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient_records_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PatientRecordsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientRecordsFetchRequested value)
        fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientRecordsFetchRequested value)? fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientRecordsFetchRequested value)? fetchRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientRecordsEventCopyWith<$Res> {
  factory $PatientRecordsEventCopyWith(
          PatientRecordsEvent value, $Res Function(PatientRecordsEvent) then) =
      _$PatientRecordsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PatientRecordsEventCopyWithImpl<$Res>
    implements $PatientRecordsEventCopyWith<$Res> {
  _$PatientRecordsEventCopyWithImpl(this._value, this._then);

  final PatientRecordsEvent _value;
  // ignore: unused_field
  final $Res Function(PatientRecordsEvent) _then;
}

/// @nodoc
abstract class _$$PatientRecordsFetchRequestedCopyWith<$Res> {
  factory _$$PatientRecordsFetchRequestedCopyWith(
          _$PatientRecordsFetchRequested value,
          $Res Function(_$PatientRecordsFetchRequested) then) =
      __$$PatientRecordsFetchRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PatientRecordsFetchRequestedCopyWithImpl<$Res>
    extends _$PatientRecordsEventCopyWithImpl<$Res>
    implements _$$PatientRecordsFetchRequestedCopyWith<$Res> {
  __$$PatientRecordsFetchRequestedCopyWithImpl(
      _$PatientRecordsFetchRequested _value,
      $Res Function(_$PatientRecordsFetchRequested) _then)
      : super(_value, (v) => _then(v as _$PatientRecordsFetchRequested));

  @override
  _$PatientRecordsFetchRequested get _value =>
      super._value as _$PatientRecordsFetchRequested;
}

/// @nodoc

class _$PatientRecordsFetchRequested extends PatientRecordsFetchRequested {
  const _$PatientRecordsFetchRequested() : super._();

  @override
  String toString() {
    return 'PatientRecordsEvent.fetchRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientRecordsFetchRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRequested,
  }) {
    return fetchRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchRequested,
  }) {
    return fetchRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRequested,
    required TResult orElse(),
  }) {
    if (fetchRequested != null) {
      return fetchRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientRecordsFetchRequested value)
        fetchRequested,
  }) {
    return fetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientRecordsFetchRequested value)? fetchRequested,
  }) {
    return fetchRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientRecordsFetchRequested value)? fetchRequested,
    required TResult orElse(),
  }) {
    if (fetchRequested != null) {
      return fetchRequested(this);
    }
    return orElse();
  }
}

abstract class PatientRecordsFetchRequested extends PatientRecordsEvent {
  const factory PatientRecordsFetchRequested() = _$PatientRecordsFetchRequested;
  const PatientRecordsFetchRequested._() : super._();
}

/// @nodoc
mixin _$PatientRecordsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<PatientRecordView> records) ready,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientRecordsInitial value) initial,
    required TResult Function(PatientRecordsFetching value) fetching,
    required TResult Function(PatientRecordsReady value) ready,
    required TResult Function(PatientRecordsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientRecordsStateCopyWith<$Res> {
  factory $PatientRecordsStateCopyWith(
          PatientRecordsState value, $Res Function(PatientRecordsState) then) =
      _$PatientRecordsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PatientRecordsStateCopyWithImpl<$Res>
    implements $PatientRecordsStateCopyWith<$Res> {
  _$PatientRecordsStateCopyWithImpl(this._value, this._then);

  final PatientRecordsState _value;
  // ignore: unused_field
  final $Res Function(PatientRecordsState) _then;
}

/// @nodoc
abstract class _$$PatientRecordsInitialCopyWith<$Res> {
  factory _$$PatientRecordsInitialCopyWith(_$PatientRecordsInitial value,
          $Res Function(_$PatientRecordsInitial) then) =
      __$$PatientRecordsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PatientRecordsInitialCopyWithImpl<$Res>
    extends _$PatientRecordsStateCopyWithImpl<$Res>
    implements _$$PatientRecordsInitialCopyWith<$Res> {
  __$$PatientRecordsInitialCopyWithImpl(_$PatientRecordsInitial _value,
      $Res Function(_$PatientRecordsInitial) _then)
      : super(_value, (v) => _then(v as _$PatientRecordsInitial));

  @override
  _$PatientRecordsInitial get _value => super._value as _$PatientRecordsInitial;
}

/// @nodoc

class _$PatientRecordsInitial extends PatientRecordsInitial {
  const _$PatientRecordsInitial() : super._();

  @override
  String toString() {
    return 'PatientRecordsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PatientRecordsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<PatientRecordView> records) ready,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
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
    required TResult Function(PatientRecordsInitial value) initial,
    required TResult Function(PatientRecordsFetching value) fetching,
    required TResult Function(PatientRecordsReady value) ready,
    required TResult Function(PatientRecordsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PatientRecordsInitial extends PatientRecordsState {
  const factory PatientRecordsInitial() = _$PatientRecordsInitial;
  const PatientRecordsInitial._() : super._();
}

/// @nodoc
abstract class _$$PatientRecordsFetchingCopyWith<$Res> {
  factory _$$PatientRecordsFetchingCopyWith(_$PatientRecordsFetching value,
          $Res Function(_$PatientRecordsFetching) then) =
      __$$PatientRecordsFetchingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PatientRecordsFetchingCopyWithImpl<$Res>
    extends _$PatientRecordsStateCopyWithImpl<$Res>
    implements _$$PatientRecordsFetchingCopyWith<$Res> {
  __$$PatientRecordsFetchingCopyWithImpl(_$PatientRecordsFetching _value,
      $Res Function(_$PatientRecordsFetching) _then)
      : super(_value, (v) => _then(v as _$PatientRecordsFetching));

  @override
  _$PatientRecordsFetching get _value =>
      super._value as _$PatientRecordsFetching;
}

/// @nodoc

class _$PatientRecordsFetching extends PatientRecordsFetching {
  const _$PatientRecordsFetching() : super._();

  @override
  String toString() {
    return 'PatientRecordsState.fetching()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PatientRecordsFetching);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<PatientRecordView> records) ready,
    required TResult Function() error,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
    TResult Function()? error,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientRecordsInitial value) initial,
    required TResult Function(PatientRecordsFetching value) fetching,
    required TResult Function(PatientRecordsReady value) ready,
    required TResult Function(PatientRecordsError value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class PatientRecordsFetching extends PatientRecordsState {
  const factory PatientRecordsFetching() = _$PatientRecordsFetching;
  const PatientRecordsFetching._() : super._();
}

/// @nodoc
abstract class _$$PatientRecordsReadyCopyWith<$Res> {
  factory _$$PatientRecordsReadyCopyWith(_$PatientRecordsReady value,
          $Res Function(_$PatientRecordsReady) then) =
      __$$PatientRecordsReadyCopyWithImpl<$Res>;
  $Res call({List<PatientRecordView> records});
}

/// @nodoc
class __$$PatientRecordsReadyCopyWithImpl<$Res>
    extends _$PatientRecordsStateCopyWithImpl<$Res>
    implements _$$PatientRecordsReadyCopyWith<$Res> {
  __$$PatientRecordsReadyCopyWithImpl(
      _$PatientRecordsReady _value, $Res Function(_$PatientRecordsReady) _then)
      : super(_value, (v) => _then(v as _$PatientRecordsReady));

  @override
  _$PatientRecordsReady get _value => super._value as _$PatientRecordsReady;

  @override
  $Res call({
    Object? records = freezed,
  }) {
    return _then(_$PatientRecordsReady(
      records: records == freezed
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<PatientRecordView>,
    ));
  }
}

/// @nodoc

class _$PatientRecordsReady extends PatientRecordsReady {
  const _$PatientRecordsReady({required final List<PatientRecordView> records})
      : _records = records,
        super._();

  final List<PatientRecordView> _records;
  @override
  List<PatientRecordView> get records {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'PatientRecordsState.ready(records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientRecordsReady &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_records));

  @JsonKey(ignore: true)
  @override
  _$$PatientRecordsReadyCopyWith<_$PatientRecordsReady> get copyWith =>
      __$$PatientRecordsReadyCopyWithImpl<_$PatientRecordsReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<PatientRecordView> records) ready,
    required TResult Function() error,
  }) {
    return ready(records);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
    TResult Function()? error,
  }) {
    return ready?.call(records);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(records);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientRecordsInitial value) initial,
    required TResult Function(PatientRecordsFetching value) fetching,
    required TResult Function(PatientRecordsReady value) ready,
    required TResult Function(PatientRecordsError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class PatientRecordsReady extends PatientRecordsState {
  const factory PatientRecordsReady(
      {required final List<PatientRecordView> records}) = _$PatientRecordsReady;
  const PatientRecordsReady._() : super._();

  List<PatientRecordView> get records => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PatientRecordsReadyCopyWith<_$PatientRecordsReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PatientRecordsErrorCopyWith<$Res> {
  factory _$$PatientRecordsErrorCopyWith(_$PatientRecordsError value,
          $Res Function(_$PatientRecordsError) then) =
      __$$PatientRecordsErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PatientRecordsErrorCopyWithImpl<$Res>
    extends _$PatientRecordsStateCopyWithImpl<$Res>
    implements _$$PatientRecordsErrorCopyWith<$Res> {
  __$$PatientRecordsErrorCopyWithImpl(
      _$PatientRecordsError _value, $Res Function(_$PatientRecordsError) _then)
      : super(_value, (v) => _then(v as _$PatientRecordsError));

  @override
  _$PatientRecordsError get _value => super._value as _$PatientRecordsError;
}

/// @nodoc

class _$PatientRecordsError extends PatientRecordsError {
  const _$PatientRecordsError() : super._();

  @override
  String toString() {
    return 'PatientRecordsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PatientRecordsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetching,
    required TResult Function(List<PatientRecordView> records) ready,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetching,
    TResult Function(List<PatientRecordView> records)? ready,
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
    required TResult Function(PatientRecordsInitial value) initial,
    required TResult Function(PatientRecordsFetching value) fetching,
    required TResult Function(PatientRecordsReady value) ready,
    required TResult Function(PatientRecordsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientRecordsInitial value)? initial,
    TResult Function(PatientRecordsFetching value)? fetching,
    TResult Function(PatientRecordsReady value)? ready,
    TResult Function(PatientRecordsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PatientRecordsError extends PatientRecordsState {
  const factory PatientRecordsError() = _$PatientRecordsError;
  const PatientRecordsError._() : super._();
}
