// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PatientListEvent {
  String get filter => throw _privateConstructorUsedError;
  bool get force => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter, bool force) fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String filter, bool force)? fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter, bool force)? fetchRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientListFetchRequested value) fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientListFetchRequested value)? fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientListFetchRequested value)? fetchRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientListEventCopyWith<PatientListEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientListEventCopyWith<$Res> {
  factory $PatientListEventCopyWith(
          PatientListEvent value, $Res Function(PatientListEvent) then) =
      _$PatientListEventCopyWithImpl<$Res>;
  $Res call({String filter, bool force});
}

/// @nodoc
class _$PatientListEventCopyWithImpl<$Res>
    implements $PatientListEventCopyWith<$Res> {
  _$PatientListEventCopyWithImpl(this._value, this._then);

  final PatientListEvent _value;
  // ignore: unused_field
  final $Res Function(PatientListEvent) _then;

  @override
  $Res call({
    Object? filter = freezed,
    Object? force = freezed,
  }) {
    return _then(_value.copyWith(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      force: force == freezed
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$PatientListFetchRequestedCopyWith<$Res>
    implements $PatientListEventCopyWith<$Res> {
  factory _$$PatientListFetchRequestedCopyWith(
          _$PatientListFetchRequested value,
          $Res Function(_$PatientListFetchRequested) then) =
      __$$PatientListFetchRequestedCopyWithImpl<$Res>;
  @override
  $Res call({String filter, bool force});
}

/// @nodoc
class __$$PatientListFetchRequestedCopyWithImpl<$Res>
    extends _$PatientListEventCopyWithImpl<$Res>
    implements _$$PatientListFetchRequestedCopyWith<$Res> {
  __$$PatientListFetchRequestedCopyWithImpl(_$PatientListFetchRequested _value,
      $Res Function(_$PatientListFetchRequested) _then)
      : super(_value, (v) => _then(v as _$PatientListFetchRequested));

  @override
  _$PatientListFetchRequested get _value =>
      super._value as _$PatientListFetchRequested;

  @override
  $Res call({
    Object? filter = freezed,
    Object? force = freezed,
  }) {
    return _then(_$PatientListFetchRequested(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      force: force == freezed
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PatientListFetchRequested extends PatientListFetchRequested {
  const _$PatientListFetchRequested({required this.filter, this.force = false})
      : super._();

  @override
  final String filter;
  @override
  @JsonKey()
  final bool force;

  @override
  String toString() {
    return 'PatientListEvent.fetchRequested(filter: $filter, force: $force)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListFetchRequested &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            const DeepCollectionEquality().equals(other.force, force));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(filter),
      const DeepCollectionEquality().hash(force));

  @JsonKey(ignore: true)
  @override
  _$$PatientListFetchRequestedCopyWith<_$PatientListFetchRequested>
      get copyWith => __$$PatientListFetchRequestedCopyWithImpl<
          _$PatientListFetchRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter, bool force) fetchRequested,
  }) {
    return fetchRequested(filter, force);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String filter, bool force)? fetchRequested,
  }) {
    return fetchRequested?.call(filter, force);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter, bool force)? fetchRequested,
    required TResult orElse(),
  }) {
    if (fetchRequested != null) {
      return fetchRequested(filter, force);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientListFetchRequested value) fetchRequested,
  }) {
    return fetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientListFetchRequested value)? fetchRequested,
  }) {
    return fetchRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientListFetchRequested value)? fetchRequested,
    required TResult orElse(),
  }) {
    if (fetchRequested != null) {
      return fetchRequested(this);
    }
    return orElse();
  }
}

abstract class PatientListFetchRequested extends PatientListEvent {
  const factory PatientListFetchRequested(
      {required final String filter,
      final bool force}) = _$PatientListFetchRequested;
  const PatientListFetchRequested._() : super._();

  @override
  String get filter => throw _privateConstructorUsedError;
  @override
  bool get force => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$PatientListFetchRequestedCopyWith<_$PatientListFetchRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PatientListState {
  String get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter) initial,
    required TResult Function(String filter) fetching,
    required TResult Function(String filter, List<Patient> patients) ready,
    required TResult Function(String filter) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientListInitial value) initial,
    required TResult Function(PatientListFetching value) fetching,
    required TResult Function(PatientListReady value) ready,
    required TResult Function(PatientListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientListStateCopyWith<PatientListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientListStateCopyWith<$Res> {
  factory $PatientListStateCopyWith(
          PatientListState value, $Res Function(PatientListState) then) =
      _$PatientListStateCopyWithImpl<$Res>;
  $Res call({String filter});
}

/// @nodoc
class _$PatientListStateCopyWithImpl<$Res>
    implements $PatientListStateCopyWith<$Res> {
  _$PatientListStateCopyWithImpl(this._value, this._then);

  final PatientListState _value;
  // ignore: unused_field
  final $Res Function(PatientListState) _then;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$PatientListInitialCopyWith<$Res>
    implements $PatientListStateCopyWith<$Res> {
  factory _$$PatientListInitialCopyWith(_$PatientListInitial value,
          $Res Function(_$PatientListInitial) then) =
      __$$PatientListInitialCopyWithImpl<$Res>;
  @override
  $Res call({String filter});
}

/// @nodoc
class __$$PatientListInitialCopyWithImpl<$Res>
    extends _$PatientListStateCopyWithImpl<$Res>
    implements _$$PatientListInitialCopyWith<$Res> {
  __$$PatientListInitialCopyWithImpl(
      _$PatientListInitial _value, $Res Function(_$PatientListInitial) _then)
      : super(_value, (v) => _then(v as _$PatientListInitial));

  @override
  _$PatientListInitial get _value => super._value as _$PatientListInitial;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$PatientListInitial(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PatientListInitial extends PatientListInitial {
  const _$PatientListInitial({required this.filter}) : super._();

  @override
  final String filter;

  @override
  String toString() {
    return 'PatientListState.initial(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListInitial &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(filter));

  @JsonKey(ignore: true)
  @override
  _$$PatientListInitialCopyWith<_$PatientListInitial> get copyWith =>
      __$$PatientListInitialCopyWithImpl<_$PatientListInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter) initial,
    required TResult Function(String filter) fetching,
    required TResult Function(String filter, List<Patient> patients) ready,
    required TResult Function(String filter) error,
  }) {
    return initial(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
  }) {
    return initial?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientListInitial value) initial,
    required TResult Function(PatientListFetching value) fetching,
    required TResult Function(PatientListReady value) ready,
    required TResult Function(PatientListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PatientListInitial extends PatientListState {
  const factory PatientListInitial({required final String filter}) =
      _$PatientListInitial;
  const PatientListInitial._() : super._();

  @override
  String get filter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$PatientListInitialCopyWith<_$PatientListInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PatientListFetchingCopyWith<$Res>
    implements $PatientListStateCopyWith<$Res> {
  factory _$$PatientListFetchingCopyWith(_$PatientListFetching value,
          $Res Function(_$PatientListFetching) then) =
      __$$PatientListFetchingCopyWithImpl<$Res>;
  @override
  $Res call({String filter});
}

/// @nodoc
class __$$PatientListFetchingCopyWithImpl<$Res>
    extends _$PatientListStateCopyWithImpl<$Res>
    implements _$$PatientListFetchingCopyWith<$Res> {
  __$$PatientListFetchingCopyWithImpl(
      _$PatientListFetching _value, $Res Function(_$PatientListFetching) _then)
      : super(_value, (v) => _then(v as _$PatientListFetching));

  @override
  _$PatientListFetching get _value => super._value as _$PatientListFetching;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$PatientListFetching(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PatientListFetching extends PatientListFetching {
  const _$PatientListFetching({required this.filter}) : super._();

  @override
  final String filter;

  @override
  String toString() {
    return 'PatientListState.fetching(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListFetching &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(filter));

  @JsonKey(ignore: true)
  @override
  _$$PatientListFetchingCopyWith<_$PatientListFetching> get copyWith =>
      __$$PatientListFetchingCopyWithImpl<_$PatientListFetching>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter) initial,
    required TResult Function(String filter) fetching,
    required TResult Function(String filter, List<Patient> patients) ready,
    required TResult Function(String filter) error,
  }) {
    return fetching(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
  }) {
    return fetching?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientListInitial value) initial,
    required TResult Function(PatientListFetching value) fetching,
    required TResult Function(PatientListReady value) ready,
    required TResult Function(PatientListError value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class PatientListFetching extends PatientListState {
  const factory PatientListFetching({required final String filter}) =
      _$PatientListFetching;
  const PatientListFetching._() : super._();

  @override
  String get filter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$PatientListFetchingCopyWith<_$PatientListFetching> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PatientListReadyCopyWith<$Res>
    implements $PatientListStateCopyWith<$Res> {
  factory _$$PatientListReadyCopyWith(
          _$PatientListReady value, $Res Function(_$PatientListReady) then) =
      __$$PatientListReadyCopyWithImpl<$Res>;
  @override
  $Res call({String filter, List<Patient> patients});
}

/// @nodoc
class __$$PatientListReadyCopyWithImpl<$Res>
    extends _$PatientListStateCopyWithImpl<$Res>
    implements _$$PatientListReadyCopyWith<$Res> {
  __$$PatientListReadyCopyWithImpl(
      _$PatientListReady _value, $Res Function(_$PatientListReady) _then)
      : super(_value, (v) => _then(v as _$PatientListReady));

  @override
  _$PatientListReady get _value => super._value as _$PatientListReady;

  @override
  $Res call({
    Object? filter = freezed,
    Object? patients = freezed,
  }) {
    return _then(_$PatientListReady(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      patients: patients == freezed
          ? _value._patients
          : patients // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ));
  }
}

/// @nodoc

class _$PatientListReady extends PatientListReady {
  const _$PatientListReady(
      {required this.filter, required final List<Patient> patients})
      : _patients = patients,
        super._();

  @override
  final String filter;
  final List<Patient> _patients;
  @override
  List<Patient> get patients {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patients);
  }

  @override
  String toString() {
    return 'PatientListState.ready(filter: $filter, patients: $patients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListReady &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            const DeepCollectionEquality().equals(other._patients, _patients));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(filter),
      const DeepCollectionEquality().hash(_patients));

  @JsonKey(ignore: true)
  @override
  _$$PatientListReadyCopyWith<_$PatientListReady> get copyWith =>
      __$$PatientListReadyCopyWithImpl<_$PatientListReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter) initial,
    required TResult Function(String filter) fetching,
    required TResult Function(String filter, List<Patient> patients) ready,
    required TResult Function(String filter) error,
  }) {
    return ready(filter, patients);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
  }) {
    return ready?.call(filter, patients);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(filter, patients);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientListInitial value) initial,
    required TResult Function(PatientListFetching value) fetching,
    required TResult Function(PatientListReady value) ready,
    required TResult Function(PatientListError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class PatientListReady extends PatientListState {
  const factory PatientListReady(
      {required final String filter,
      required final List<Patient> patients}) = _$PatientListReady;
  const PatientListReady._() : super._();

  @override
  String get filter => throw _privateConstructorUsedError;
  List<Patient> get patients => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$PatientListReadyCopyWith<_$PatientListReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PatientListErrorCopyWith<$Res>
    implements $PatientListStateCopyWith<$Res> {
  factory _$$PatientListErrorCopyWith(
          _$PatientListError value, $Res Function(_$PatientListError) then) =
      __$$PatientListErrorCopyWithImpl<$Res>;
  @override
  $Res call({String filter});
}

/// @nodoc
class __$$PatientListErrorCopyWithImpl<$Res>
    extends _$PatientListStateCopyWithImpl<$Res>
    implements _$$PatientListErrorCopyWith<$Res> {
  __$$PatientListErrorCopyWithImpl(
      _$PatientListError _value, $Res Function(_$PatientListError) _then)
      : super(_value, (v) => _then(v as _$PatientListError));

  @override
  _$PatientListError get _value => super._value as _$PatientListError;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$PatientListError(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PatientListError extends PatientListError {
  const _$PatientListError({required this.filter}) : super._();

  @override
  final String filter;

  @override
  String toString() {
    return 'PatientListState.error(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListError &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(filter));

  @JsonKey(ignore: true)
  @override
  _$$PatientListErrorCopyWith<_$PatientListError> get copyWith =>
      __$$PatientListErrorCopyWithImpl<_$PatientListError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String filter) initial,
    required TResult Function(String filter) fetching,
    required TResult Function(String filter, List<Patient> patients) ready,
    required TResult Function(String filter) error,
  }) {
    return error(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
  }) {
    return error?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String filter)? initial,
    TResult Function(String filter)? fetching,
    TResult Function(String filter, List<Patient> patients)? ready,
    TResult Function(String filter)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PatientListInitial value) initial,
    required TResult Function(PatientListFetching value) fetching,
    required TResult Function(PatientListReady value) ready,
    required TResult Function(PatientListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PatientListInitial value)? initial,
    TResult Function(PatientListFetching value)? fetching,
    TResult Function(PatientListReady value)? ready,
    TResult Function(PatientListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PatientListError extends PatientListState {
  const factory PatientListError({required final String filter}) =
      _$PatientListError;
  const PatientListError._() : super._();

  @override
  String get filter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$PatientListErrorCopyWith<_$PatientListError> get copyWith =>
      throw _privateConstructorUsedError;
}
