// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'records_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecordsState {
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(List<String>? records, int page) loading,
    required TResult Function(List<String> records, int page) success,
    required TResult Function(List<String>? records, int page) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordsInitial value) initial,
    required TResult Function(RecordsLoading value) loading,
    required TResult Function(RecordsSuccess value) success,
    required TResult Function(RecordsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordsStateCopyWith<RecordsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsStateCopyWith<$Res> {
  factory $RecordsStateCopyWith(
          RecordsState value, $Res Function(RecordsState) then) =
      _$RecordsStateCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$RecordsStateCopyWithImpl<$Res> implements $RecordsStateCopyWith<$Res> {
  _$RecordsStateCopyWithImpl(this._value, this._then);

  final RecordsState _value;
  // ignore: unused_field
  final $Res Function(RecordsState) _then;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$RecordsInitialCopyWith<$Res>
    implements $RecordsStateCopyWith<$Res> {
  factory _$$RecordsInitialCopyWith(
          _$RecordsInitial value, $Res Function(_$RecordsInitial) then) =
      __$$RecordsInitialCopyWithImpl<$Res>;
  @override
  $Res call({int page});
}

/// @nodoc
class __$$RecordsInitialCopyWithImpl<$Res>
    extends _$RecordsStateCopyWithImpl<$Res>
    implements _$$RecordsInitialCopyWith<$Res> {
  __$$RecordsInitialCopyWithImpl(
      _$RecordsInitial _value, $Res Function(_$RecordsInitial) _then)
      : super(_value, (v) => _then(v as _$RecordsInitial));

  @override
  _$RecordsInitial get _value => super._value as _$RecordsInitial;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_$RecordsInitial(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecordsInitial extends RecordsInitial {
  const _$RecordsInitial({required this.page}) : super._();

  @override
  final int page;

  @override
  String toString() {
    return 'RecordsState.initial(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordsInitial &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$$RecordsInitialCopyWith<_$RecordsInitial> get copyWith =>
      __$$RecordsInitialCopyWithImpl<_$RecordsInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(List<String>? records, int page) loading,
    required TResult Function(List<String> records, int page) success,
    required TResult Function(List<String>? records, int page) error,
  }) {
    return initial(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
  }) {
    return initial?.resolve(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordsInitial value) initial,
    required TResult Function(RecordsLoading value) loading,
    required TResult Function(RecordsSuccess value) success,
    required TResult Function(RecordsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
  }) {
    return initial?.resolve(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RecordsInitial extends RecordsState {
  const factory RecordsInitial({required final int page}) = _$RecordsInitial;
  const RecordsInitial._() : super._();

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$RecordsInitialCopyWith<_$RecordsInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordsLoadingCopyWith<$Res>
    implements $RecordsStateCopyWith<$Res> {
  factory _$$RecordsLoadingCopyWith(
          _$RecordsLoading value, $Res Function(_$RecordsLoading) then) =
      __$$RecordsLoadingCopyWithImpl<$Res>;
  @override
  $Res call({List<String>? records, int page});
}

/// @nodoc
class __$$RecordsLoadingCopyWithImpl<$Res>
    extends _$RecordsStateCopyWithImpl<$Res>
    implements _$$RecordsLoadingCopyWith<$Res> {
  __$$RecordsLoadingCopyWithImpl(
      _$RecordsLoading _value, $Res Function(_$RecordsLoading) _then)
      : super(_value, (v) => _then(v as _$RecordsLoading));

  @override
  _$RecordsLoading get _value => super._value as _$RecordsLoading;

  @override
  $Res call({
    Object? records = freezed,
    Object? page = freezed,
  }) {
    return _then(_$RecordsLoading(
      records: records == freezed
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecordsLoading extends RecordsLoading {
  const _$RecordsLoading({final List<String>? records, required this.page})
      : _records = records,
        super._();

  final List<String>? _records;
  @override
  List<String>? get records {
    final value = _records;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int page;

  @override
  String toString() {
    return 'RecordsState.loading(records: $records, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordsLoading &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_records),
      const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$$RecordsLoadingCopyWith<_$RecordsLoading> get copyWith =>
      __$$RecordsLoadingCopyWithImpl<_$RecordsLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(List<String>? records, int page) loading,
    required TResult Function(List<String> records, int page) success,
    required TResult Function(List<String>? records, int page) error,
  }) {
    return loading(records, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
  }) {
    return loading?.resolve(records, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(records, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordsInitial value) initial,
    required TResult Function(RecordsLoading value) loading,
    required TResult Function(RecordsSuccess value) success,
    required TResult Function(RecordsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
  }) {
    return loading?.resolve(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RecordsLoading extends RecordsState {
  const factory RecordsLoading(
      {final List<String>? records,
      required final int page}) = _$RecordsLoading;
  const RecordsLoading._() : super._();

  List<String>? get records;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$RecordsLoadingCopyWith<_$RecordsLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordsSuccessCopyWith<$Res>
    implements $RecordsStateCopyWith<$Res> {
  factory _$$RecordsSuccessCopyWith(
          _$RecordsSuccess value, $Res Function(_$RecordsSuccess) then) =
      __$$RecordsSuccessCopyWithImpl<$Res>;
  @override
  $Res call({List<String> records, int page});
}

/// @nodoc
class __$$RecordsSuccessCopyWithImpl<$Res>
    extends _$RecordsStateCopyWithImpl<$Res>
    implements _$$RecordsSuccessCopyWith<$Res> {
  __$$RecordsSuccessCopyWithImpl(
      _$RecordsSuccess _value, $Res Function(_$RecordsSuccess) _then)
      : super(_value, (v) => _then(v as _$RecordsSuccess));

  @override
  _$RecordsSuccess get _value => super._value as _$RecordsSuccess;

  @override
  $Res call({
    Object? records = freezed,
    Object? page = freezed,
  }) {
    return _then(_$RecordsSuccess(
      records: records == freezed
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<String>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecordsSuccess extends RecordsSuccess {
  const _$RecordsSuccess(
      {required final List<String> records, required this.page})
      : _records = records,
        super._();

  final List<String> _records;
  @override
  List<String> get records {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  final int page;

  @override
  String toString() {
    return 'RecordsState.success(records: $records, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordsSuccess &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_records),
      const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$$RecordsSuccessCopyWith<_$RecordsSuccess> get copyWith =>
      __$$RecordsSuccessCopyWithImpl<_$RecordsSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(List<String>? records, int page) loading,
    required TResult Function(List<String> records, int page) success,
    required TResult Function(List<String>? records, int page) error,
  }) {
    return success(records, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
  }) {
    return success?.resolve(records, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(records, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordsInitial value) initial,
    required TResult Function(RecordsLoading value) loading,
    required TResult Function(RecordsSuccess value) success,
    required TResult Function(RecordsError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
  }) {
    return success?.resolve(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RecordsSuccess extends RecordsState {
  const factory RecordsSuccess(
      {required final List<String> records,
      required final int page}) = _$RecordsSuccess;
  const RecordsSuccess._() : super._();

  List<String> get records;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$RecordsSuccessCopyWith<_$RecordsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordsErrorCopyWith<$Res>
    implements $RecordsStateCopyWith<$Res> {
  factory _$$RecordsErrorCopyWith(
          _$RecordsError value, $Res Function(_$RecordsError) then) =
      __$$RecordsErrorCopyWithImpl<$Res>;
  @override
  $Res call({List<String>? records, int page});
}

/// @nodoc
class __$$RecordsErrorCopyWithImpl<$Res>
    extends _$RecordsStateCopyWithImpl<$Res>
    implements _$$RecordsErrorCopyWith<$Res> {
  __$$RecordsErrorCopyWithImpl(
      _$RecordsError _value, $Res Function(_$RecordsError) _then)
      : super(_value, (v) => _then(v as _$RecordsError));

  @override
  _$RecordsError get _value => super._value as _$RecordsError;

  @override
  $Res call({
    Object? records = freezed,
    Object? page = freezed,
  }) {
    return _then(_$RecordsError(
      records: records == freezed
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecordsError extends RecordsError {
  const _$RecordsError({final List<String>? records, required this.page})
      : _records = records,
        super._();

  final List<String>? _records;
  @override
  List<String>? get records {
    final value = _records;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int page;

  @override
  String toString() {
    return 'RecordsState.error(records: $records, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordsError &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_records),
      const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$$RecordsErrorCopyWith<_$RecordsError> get copyWith =>
      __$$RecordsErrorCopyWithImpl<_$RecordsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(List<String>? records, int page) loading,
    required TResult Function(List<String> records, int page) success,
    required TResult Function(List<String>? records, int page) error,
  }) {
    return error(records, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
  }) {
    return error?.resolve(records, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(List<String>? records, int page)? loading,
    TResult Function(List<String> records, int page)? success,
    TResult Function(List<String>? records, int page)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(records, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordsInitial value) initial,
    required TResult Function(RecordsLoading value) loading,
    required TResult Function(RecordsSuccess value) success,
    required TResult Function(RecordsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
  }) {
    return error?.resolve(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordsInitial value)? initial,
    TResult Function(RecordsLoading value)? loading,
    TResult Function(RecordsSuccess value)? success,
    TResult Function(RecordsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RecordsError extends RecordsState {
  const factory RecordsError(
      {final List<String>? records, required final int page}) = _$RecordsError;
  const RecordsError._() : super._();

  List<String>? get records;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$RecordsErrorCopyWith<_$RecordsError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecordsEvent {
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
    required TResult Function(RecordsFetchRequested value) fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordsFetchRequested value)? fetchRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordsFetchRequested value)? fetchRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsEventCopyWith<$Res> {
  factory $RecordsEventCopyWith(
          RecordsEvent value, $Res Function(RecordsEvent) then) =
      _$RecordsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RecordsEventCopyWithImpl<$Res> implements $RecordsEventCopyWith<$Res> {
  _$RecordsEventCopyWithImpl(this._value, this._then);

  final RecordsEvent _value;
  // ignore: unused_field
  final $Res Function(RecordsEvent) _then;
}

/// @nodoc
abstract class _$$RecordsFetchRequestedCopyWith<$Res> {
  factory _$$RecordsFetchRequestedCopyWith(_$RecordsFetchRequested value,
          $Res Function(_$RecordsFetchRequested) then) =
      __$$RecordsFetchRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecordsFetchRequestedCopyWithImpl<$Res>
    extends _$RecordsEventCopyWithImpl<$Res>
    implements _$$RecordsFetchRequestedCopyWith<$Res> {
  __$$RecordsFetchRequestedCopyWithImpl(_$RecordsFetchRequested _value,
      $Res Function(_$RecordsFetchRequested) _then)
      : super(_value, (v) => _then(v as _$RecordsFetchRequested));

  @override
  _$RecordsFetchRequested get _value => super._value as _$RecordsFetchRequested;
}

/// @nodoc

class _$RecordsFetchRequested extends RecordsFetchRequested {
  const _$RecordsFetchRequested() : super._();

  @override
  String toString() {
    return 'RecordsEvent.fetchRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecordsFetchRequested);
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
    return fetchRequested?.resolve();
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
    required TResult Function(RecordsFetchRequested value) fetchRequested,
  }) {
    return fetchRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RecordsFetchRequested value)? fetchRequested,
  }) {
    return fetchRequested?.resolve(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordsFetchRequested value)? fetchRequested,
    required TResult orElse(),
  }) {
    if (fetchRequested != null) {
      return fetchRequested(this);
    }
    return orElse();
  }
}

abstract class RecordsFetchRequested extends RecordsEvent {
  const factory RecordsFetchRequested() = _$RecordsFetchRequested;
  const RecordsFetchRequested._() : super._();
}
