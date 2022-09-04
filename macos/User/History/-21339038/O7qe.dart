// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'candidate_educations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CandidateEducationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EducationUpdate update) updated,
    required TResult Function(String id) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EducationUpdate update)? updated,
    TResult Function(String id)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EducationUpdate update)? updated,
    TResult Function(String id)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateEducationsStarted value) started,
    required TResult Function(CandidateEducationsUpdated value) updated,
    required TResult Function(CandidateEducationsDeleted value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEducationsStarted value)? started,
    TResult Function(CandidateEducationsUpdated value)? updated,
    TResult Function(CandidateEducationsDeleted value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEducationsStarted value)? started,
    TResult Function(CandidateEducationsUpdated value)? updated,
    TResult Function(CandidateEducationsDeleted value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateEducationsEventCopyWith<$Res> {
  factory $CandidateEducationsEventCopyWith(CandidateEducationsEvent value,
          $Res Function(CandidateEducationsEvent) then) =
      _$CandidateEducationsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateEducationsEventCopyWithImpl<$Res>
    implements $CandidateEducationsEventCopyWith<$Res> {
  _$CandidateEducationsEventCopyWithImpl(this._value, this._then);

  final CandidateEducationsEvent _value;
  // ignore: unused_field
  final $Res Function(CandidateEducationsEvent) _then;
}

/// @nodoc
abstract class _$$CandidateEducationsStartedCopyWith<$Res> {
  factory _$$CandidateEducationsStartedCopyWith(
          _$CandidateEducationsStarted value,
          $Res Function(_$CandidateEducationsStarted) then) =
      __$$CandidateEducationsStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEducationsStartedCopyWithImpl<$Res>
    extends _$CandidateEducationsEventCopyWithImpl<$Res>
    implements _$$CandidateEducationsStartedCopyWith<$Res> {
  __$$CandidateEducationsStartedCopyWithImpl(
      _$CandidateEducationsStarted _value,
      $Res Function(_$CandidateEducationsStarted) _then)
      : super(_value, (v) => _then(v as _$CandidateEducationsStarted));

  @override
  _$CandidateEducationsStarted get _value =>
      super._value as _$CandidateEducationsStarted;
}

/// @nodoc

class _$CandidateEducationsStarted extends CandidateEducationsStarted {
  const _$CandidateEducationsStarted() : super._();

  @override
  String toString() {
    return 'CandidateEducationsEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEducationsStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EducationUpdate update) updated,
    required TResult Function(String id) deleted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EducationUpdate update)? updated,
    TResult Function(String id)? deleted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EducationUpdate update)? updated,
    TResult Function(String id)? deleted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateEducationsStarted value) started,
    required TResult Function(CandidateEducationsUpdated value) updated,
    required TResult Function(CandidateEducationsDeleted value) deleted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEducationsStarted value)? started,
    TResult Function(CandidateEducationsUpdated value)? updated,
    TResult Function(CandidateEducationsDeleted value)? deleted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEducationsStarted value)? started,
    TResult Function(CandidateEducationsUpdated value)? updated,
    TResult Function(CandidateEducationsDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class CandidateEducationsStarted extends CandidateEducationsEvent {
  const factory CandidateEducationsStarted() = _$CandidateEducationsStarted;
  const CandidateEducationsStarted._() : super._();
}

/// @nodoc
abstract class _$$CandidateEducationsUpdatedCopyWith<$Res> {
  factory _$$CandidateEducationsUpdatedCopyWith(
          _$CandidateEducationsUpdated value,
          $Res Function(_$CandidateEducationsUpdated) then) =
      __$$CandidateEducationsUpdatedCopyWithImpl<$Res>;
  $Res call({EducationUpdate update});
}

/// @nodoc
class __$$CandidateEducationsUpdatedCopyWithImpl<$Res>
    extends _$CandidateEducationsEventCopyWithImpl<$Res>
    implements _$$CandidateEducationsUpdatedCopyWith<$Res> {
  __$$CandidateEducationsUpdatedCopyWithImpl(
      _$CandidateEducationsUpdated _value,
      $Res Function(_$CandidateEducationsUpdated) _then)
      : super(_value, (v) => _then(v as _$CandidateEducationsUpdated));

  @override
  _$CandidateEducationsUpdated get _value =>
      super._value as _$CandidateEducationsUpdated;

  @override
  $Res call({
    Object? update = freezed,
  }) {
    return _then(_$CandidateEducationsUpdated(
      update: update == freezed
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as EducationUpdate,
    ));
  }
}

/// @nodoc

class _$CandidateEducationsUpdated extends CandidateEducationsUpdated {
  const _$CandidateEducationsUpdated({required this.update}) : super._();

  @override
  final EducationUpdate update;

  @override
  String toString() {
    return 'CandidateEducationsEvent.updated(update: $update)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEducationsUpdated &&
            const DeepCollectionEquality().equals(other.update, update));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(update));

  @JsonKey(ignore: true)
  @override
  _$$CandidateEducationsUpdatedCopyWith<_$CandidateEducationsUpdated>
      get copyWith => __$$CandidateEducationsUpdatedCopyWithImpl<
          _$CandidateEducationsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EducationUpdate update) updated,
    required TResult Function(String id) deleted,
  }) {
    return updated(update);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EducationUpdate update)? updated,
    TResult Function(String id)? deleted,
  }) {
    return updated?.call(update);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EducationUpdate update)? updated,
    TResult Function(String id)? deleted,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(update);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateEducationsStarted value) started,
    required TResult Function(CandidateEducationsUpdated value) updated,
    required TResult Function(CandidateEducationsDeleted value) deleted,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEducationsStarted value)? started,
    TResult Function(CandidateEducationsUpdated value)? updated,
    TResult Function(CandidateEducationsDeleted value)? deleted,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEducationsStarted value)? started,
    TResult Function(CandidateEducationsUpdated value)? updated,
    TResult Function(CandidateEducationsDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class CandidateEducationsUpdated extends CandidateEducationsEvent {
  const factory CandidateEducationsUpdated(
      {required final EducationUpdate update}) = _$CandidateEducationsUpdated;
  const CandidateEducationsUpdated._() : super._();

  EducationUpdate get update;
  @JsonKey(ignore: true)
  _$$CandidateEducationsUpdatedCopyWith<_$CandidateEducationsUpdated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CandidateEducationsDeletedCopyWith<$Res> {
  factory _$$CandidateEducationsDeletedCopyWith(
          _$CandidateEducationsDeleted value,
          $Res Function(_$CandidateEducationsDeleted) then) =
      __$$CandidateEducationsDeletedCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$CandidateEducationsDeletedCopyWithImpl<$Res>
    extends _$CandidateEducationsEventCopyWithImpl<$Res>
    implements _$$CandidateEducationsDeletedCopyWith<$Res> {
  __$$CandidateEducationsDeletedCopyWithImpl(
      _$CandidateEducationsDeleted _value,
      $Res Function(_$CandidateEducationsDeleted) _then)
      : super(_value, (v) => _then(v as _$CandidateEducationsDeleted));

  @override
  _$CandidateEducationsDeleted get _value =>
      super._value as _$CandidateEducationsDeleted;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$CandidateEducationsDeleted(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CandidateEducationsDeleted extends CandidateEducationsDeleted {
  const _$CandidateEducationsDeleted({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'CandidateEducationsEvent.deleted(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEducationsDeleted &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$CandidateEducationsDeletedCopyWith<_$CandidateEducationsDeleted>
      get copyWith => __$$CandidateEducationsDeletedCopyWithImpl<
          _$CandidateEducationsDeleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(EducationUpdate update) updated,
    required TResult Function(String id) deleted,
  }) {
    return deleted(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EducationUpdate update)? updated,
    TResult Function(String id)? deleted,
  }) {
    return deleted?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(EducationUpdate update)? updated,
    TResult Function(String id)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateEducationsStarted value) started,
    required TResult Function(CandidateEducationsUpdated value) updated,
    required TResult Function(CandidateEducationsDeleted value) deleted,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEducationsStarted value)? started,
    TResult Function(CandidateEducationsUpdated value)? updated,
    TResult Function(CandidateEducationsDeleted value)? deleted,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEducationsStarted value)? started,
    TResult Function(CandidateEducationsUpdated value)? updated,
    TResult Function(CandidateEducationsDeleted value)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class CandidateEducationsDeleted extends CandidateEducationsEvent {
  const factory CandidateEducationsDeleted({required final String id}) =
      _$CandidateEducationsDeleted;
  const CandidateEducationsDeleted._() : super._();

  String get id;
  @JsonKey(ignore: true)
  _$$CandidateEducationsDeletedCopyWith<_$CandidateEducationsDeleted>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CandidateEducationsState {
  List<Education> get educations => throw _privateConstructorUsedError;
  Set<String> get pendingDeletions => throw _privateConstructorUsedError;
  Set<String> get pendingUpdates => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CandidateEducationsStateCopyWith<CandidateEducationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateEducationsStateCopyWith<$Res> {
  factory $CandidateEducationsStateCopyWith(CandidateEducationsState value,
          $Res Function(CandidateEducationsState) then) =
      _$CandidateEducationsStateCopyWithImpl<$Res>;
  $Res call(
      {List<Education> educations,
      Set<String> pendingDeletions,
      Set<String> pendingUpdates,
      bool isLoading,
      Object? error});
}

/// @nodoc
class _$CandidateEducationsStateCopyWithImpl<$Res>
    implements $CandidateEducationsStateCopyWith<$Res> {
  _$CandidateEducationsStateCopyWithImpl(this._value, this._then);

  final CandidateEducationsState _value;
  // ignore: unused_field
  final $Res Function(CandidateEducationsState) _then;

  @override
  $Res call({
    Object? educations = freezed,
    Object? pendingDeletions = freezed,
    Object? pendingUpdates = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      educations: educations == freezed
          ? _value.educations
          : educations // ignore: cast_nullable_to_non_nullable
              as List<Education>,
      pendingDeletions: pendingDeletions == freezed
          ? _value.pendingDeletions
          : pendingDeletions // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      pendingUpdates: pendingUpdates == freezed
          ? _value.pendingUpdates
          : pendingUpdates // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc
abstract class _$$_CandidateEducationsStateCopyWith<$Res>
    implements $CandidateEducationsStateCopyWith<$Res> {
  factory _$$_CandidateEducationsStateCopyWith(
          _$_CandidateEducationsState value,
          $Res Function(_$_CandidateEducationsState) then) =
      __$$_CandidateEducationsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Education> educations,
      Set<String> pendingDeletions,
      Set<String> pendingUpdates,
      bool isLoading,
      Object? error});
}

/// @nodoc
class __$$_CandidateEducationsStateCopyWithImpl<$Res>
    extends _$CandidateEducationsStateCopyWithImpl<$Res>
    implements _$$_CandidateEducationsStateCopyWith<$Res> {
  __$$_CandidateEducationsStateCopyWithImpl(_$_CandidateEducationsState _value,
      $Res Function(_$_CandidateEducationsState) _then)
      : super(_value, (v) => _then(v as _$_CandidateEducationsState));

  @override
  _$_CandidateEducationsState get _value =>
      super._value as _$_CandidateEducationsState;

  @override
  $Res call({
    Object? educations = freezed,
    Object? pendingDeletions = freezed,
    Object? pendingUpdates = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_CandidateEducationsState(
      educations: educations == freezed
          ? _value._educations
          : educations // ignore: cast_nullable_to_non_nullable
              as List<Education>,
      pendingDeletions: pendingDeletions == freezed
          ? _value._pendingDeletions
          : pendingDeletions // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      pendingUpdates: pendingUpdates == freezed
          ? _value._pendingUpdates
          : pendingUpdates // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_CandidateEducationsState implements _CandidateEducationsState {
  const _$_CandidateEducationsState(
      {required final List<Education> educations,
      required final Set<String> pendingDeletions,
      required final Set<String> pendingUpdates,
      required this.isLoading,
      required this.error})
      : _educations = educations,
        _pendingDeletions = pendingDeletions,
        _pendingUpdates = pendingUpdates;

  final List<Education> _educations;
  @override
  List<Education> get educations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_educations);
  }

  final Set<String> _pendingDeletions;
  @override
  Set<String> get pendingDeletions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pendingDeletions);
  }

  final Set<String> _pendingUpdates;
  @override
  Set<String> get pendingUpdates {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pendingUpdates);
  }

  @override
  final bool isLoading;
  @override
  final Object? error;

  @override
  String toString() {
    return 'CandidateEducationsState(educations: $educations, pendingDeletions: $pendingDeletions, pendingUpdates: $pendingUpdates, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CandidateEducationsState &&
            const DeepCollectionEquality()
                .equals(other._educations, _educations) &&
            const DeepCollectionEquality()
                .equals(other._pendingDeletions, _pendingDeletions) &&
            const DeepCollectionEquality()
                .equals(other._pendingUpdates, _pendingUpdates) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_educations),
      const DeepCollectionEquality().hash(_pendingDeletions),
      const DeepCollectionEquality().hash(_pendingUpdates),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_CandidateEducationsStateCopyWith<_$_CandidateEducationsState>
      get copyWith => __$$_CandidateEducationsStateCopyWithImpl<
          _$_CandidateEducationsState>(this, _$identity);
}

abstract class _CandidateEducationsState implements CandidateEducationsState {
  const factory _CandidateEducationsState(
      {required final List<Education> educations,
      required final Set<String> pendingDeletions,
      required final Set<String> pendingUpdates,
      required final bool isLoading,
      required final Object? error}) = _$_CandidateEducationsState;

  @override
  List<Education> get educations;
  @override
  Set<String> get pendingDeletions;
  @override
  Set<String> get pendingUpdates;
  @override
  bool get isLoading;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$_CandidateEducationsStateCopyWith<_$_CandidateEducationsState>
      get copyWith => throw _privateConstructorUsedError;
}
