// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'doctor_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DoctorListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? filter) filterChanged,
    required TResult Function(Patient doctor) doctorSelected,
    required TResult Function(Patient doctor) doctorUnselected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorListStarted value) started,
    required TResult Function(DoctorListFilterChanged value) filterChanged,
    required TResult Function(DoctorListDoctorSelected value) doctorSelected,
    required TResult Function(DoctorListDoctorUnselected value)
        doctorUnselected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorListEventCopyWith<$Res> {
  factory $DoctorListEventCopyWith(
          DoctorListEvent value, $Res Function(DoctorListEvent) then) =
      _$DoctorListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DoctorListEventCopyWithImpl<$Res>
    implements $DoctorListEventCopyWith<$Res> {
  _$DoctorListEventCopyWithImpl(this._value, this._then);

  final DoctorListEvent _value;
  // ignore: unused_field
  final $Res Function(DoctorListEvent) _then;
}

/// @nodoc
abstract class _$$DoctorListStartedCopyWith<$Res> {
  factory _$$DoctorListStartedCopyWith(
          _$DoctorListStarted value, $Res Function(_$DoctorListStarted) then) =
      __$$DoctorListStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DoctorListStartedCopyWithImpl<$Res>
    extends _$DoctorListEventCopyWithImpl<$Res>
    implements _$$DoctorListStartedCopyWith<$Res> {
  __$$DoctorListStartedCopyWithImpl(
      _$DoctorListStarted _value, $Res Function(_$DoctorListStarted) _then)
      : super(_value, (v) => _then(v as _$DoctorListStarted));

  @override
  _$DoctorListStarted get _value => super._value as _$DoctorListStarted;
}

/// @nodoc

class _$DoctorListStarted extends DoctorListStarted {
  const _$DoctorListStarted() : super._();

  @override
  String toString() {
    return 'DoctorListEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DoctorListStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? filter) filterChanged,
    required TResult Function(Patient doctor) doctorSelected,
    required TResult Function(Patient doctor) doctorUnselected,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
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
    required TResult Function(DoctorListStarted value) started,
    required TResult Function(DoctorListFilterChanged value) filterChanged,
    required TResult Function(DoctorListDoctorSelected value) doctorSelected,
    required TResult Function(DoctorListDoctorUnselected value)
        doctorUnselected,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class DoctorListStarted extends DoctorListEvent {
  const factory DoctorListStarted() = _$DoctorListStarted;
  const DoctorListStarted._() : super._();
}

/// @nodoc
abstract class _$$DoctorListFilterChangedCopyWith<$Res> {
  factory _$$DoctorListFilterChangedCopyWith(_$DoctorListFilterChanged value,
          $Res Function(_$DoctorListFilterChanged) then) =
      __$$DoctorListFilterChangedCopyWithImpl<$Res>;
  $Res call({String? filter});
}

/// @nodoc
class __$$DoctorListFilterChangedCopyWithImpl<$Res>
    extends _$DoctorListEventCopyWithImpl<$Res>
    implements _$$DoctorListFilterChangedCopyWith<$Res> {
  __$$DoctorListFilterChangedCopyWithImpl(_$DoctorListFilterChanged _value,
      $Res Function(_$DoctorListFilterChanged) _then)
      : super(_value, (v) => _then(v as _$DoctorListFilterChanged));

  @override
  _$DoctorListFilterChanged get _value =>
      super._value as _$DoctorListFilterChanged;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$DoctorListFilterChanged(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DoctorListFilterChanged extends DoctorListFilterChanged {
  const _$DoctorListFilterChanged({this.filter}) : super._();

  @override
  final String? filter;

  @override
  String toString() {
    return 'DoctorListEvent.filterChanged(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorListFilterChanged &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(filter));

  @JsonKey(ignore: true)
  @override
  _$$DoctorListFilterChangedCopyWith<_$DoctorListFilterChanged> get copyWith =>
      __$$DoctorListFilterChangedCopyWithImpl<_$DoctorListFilterChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? filter) filterChanged,
    required TResult Function(Patient doctor) doctorSelected,
    required TResult Function(Patient doctor) doctorUnselected,
  }) {
    return filterChanged(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
  }) {
    return filterChanged?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
    required TResult orElse(),
  }) {
    if (filterChanged != null) {
      return filterChanged(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorListStarted value) started,
    required TResult Function(DoctorListFilterChanged value) filterChanged,
    required TResult Function(DoctorListDoctorSelected value) doctorSelected,
    required TResult Function(DoctorListDoctorUnselected value)
        doctorUnselected,
  }) {
    return filterChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
  }) {
    return filterChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
    required TResult orElse(),
  }) {
    if (filterChanged != null) {
      return filterChanged(this);
    }
    return orElse();
  }
}

abstract class DoctorListFilterChanged extends DoctorListEvent {
  const factory DoctorListFilterChanged({final String? filter}) =
      _$DoctorListFilterChanged;
  const DoctorListFilterChanged._() : super._();

  String? get filter => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DoctorListFilterChangedCopyWith<_$DoctorListFilterChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoctorListDoctorSelectedCopyWith<$Res> {
  factory _$$DoctorListDoctorSelectedCopyWith(_$DoctorListDoctorSelected value,
          $Res Function(_$DoctorListDoctorSelected) then) =
      __$$DoctorListDoctorSelectedCopyWithImpl<$Res>;
  $Res call({Patient doctor});
}

/// @nodoc
class __$$DoctorListDoctorSelectedCopyWithImpl<$Res>
    extends _$DoctorListEventCopyWithImpl<$Res>
    implements _$$DoctorListDoctorSelectedCopyWith<$Res> {
  __$$DoctorListDoctorSelectedCopyWithImpl(_$DoctorListDoctorSelected _value,
      $Res Function(_$DoctorListDoctorSelected) _then)
      : super(_value, (v) => _then(v as _$DoctorListDoctorSelected));

  @override
  _$DoctorListDoctorSelected get _value =>
      super._value as _$DoctorListDoctorSelected;

  @override
  $Res call({
    Object? doctor = freezed,
  }) {
    return _then(_$DoctorListDoctorSelected(
      doctor: doctor == freezed
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Patient,
    ));
  }
}

/// @nodoc

class _$DoctorListDoctorSelected extends DoctorListDoctorSelected {
  const _$DoctorListDoctorSelected({required this.doctor}) : super._();

  @override
  final Patient doctor;

  @override
  String toString() {
    return 'DoctorListEvent.doctorSelected(doctor: $doctor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorListDoctorSelected &&
            const DeepCollectionEquality().equals(other.doctor, doctor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(doctor));

  @JsonKey(ignore: true)
  @override
  _$$DoctorListDoctorSelectedCopyWith<_$DoctorListDoctorSelected>
      get copyWith =>
          __$$DoctorListDoctorSelectedCopyWithImpl<_$DoctorListDoctorSelected>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? filter) filterChanged,
    required TResult Function(Patient doctor) doctorSelected,
    required TResult Function(Patient doctor) doctorUnselected,
  }) {
    return doctorSelected(doctor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
  }) {
    return doctorSelected?.call(doctor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
    required TResult orElse(),
  }) {
    if (doctorSelected != null) {
      return doctorSelected(doctor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorListStarted value) started,
    required TResult Function(DoctorListFilterChanged value) filterChanged,
    required TResult Function(DoctorListDoctorSelected value) doctorSelected,
    required TResult Function(DoctorListDoctorUnselected value)
        doctorUnselected,
  }) {
    return doctorSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
  }) {
    return doctorSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
    required TResult orElse(),
  }) {
    if (doctorSelected != null) {
      return doctorSelected(this);
    }
    return orElse();
  }
}

abstract class DoctorListDoctorSelected extends DoctorListEvent {
  const factory DoctorListDoctorSelected({required final Patient doctor}) =
      _$DoctorListDoctorSelected;
  const DoctorListDoctorSelected._() : super._();

  Patient get doctor => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DoctorListDoctorSelectedCopyWith<_$DoctorListDoctorSelected>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoctorListDoctorUnselectedCopyWith<$Res> {
  factory _$$DoctorListDoctorUnselectedCopyWith(
          _$DoctorListDoctorUnselected value,
          $Res Function(_$DoctorListDoctorUnselected) then) =
      __$$DoctorListDoctorUnselectedCopyWithImpl<$Res>;
  $Res call({Patient doctor});
}

/// @nodoc
class __$$DoctorListDoctorUnselectedCopyWithImpl<$Res>
    extends _$DoctorListEventCopyWithImpl<$Res>
    implements _$$DoctorListDoctorUnselectedCopyWith<$Res> {
  __$$DoctorListDoctorUnselectedCopyWithImpl(
      _$DoctorListDoctorUnselected _value,
      $Res Function(_$DoctorListDoctorUnselected) _then)
      : super(_value, (v) => _then(v as _$DoctorListDoctorUnselected));

  @override
  _$DoctorListDoctorUnselected get _value =>
      super._value as _$DoctorListDoctorUnselected;

  @override
  $Res call({
    Object? doctor = freezed,
  }) {
    return _then(_$DoctorListDoctorUnselected(
      doctor: doctor == freezed
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Patient,
    ));
  }
}

/// @nodoc

class _$DoctorListDoctorUnselected extends DoctorListDoctorUnselected {
  const _$DoctorListDoctorUnselected({required this.doctor}) : super._();

  @override
  final Patient doctor;

  @override
  String toString() {
    return 'DoctorListEvent.doctorUnselected(doctor: $doctor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorListDoctorUnselected &&
            const DeepCollectionEquality().equals(other.doctor, doctor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(doctor));

  @JsonKey(ignore: true)
  @override
  _$$DoctorListDoctorUnselectedCopyWith<_$DoctorListDoctorUnselected>
      get copyWith => __$$DoctorListDoctorUnselectedCopyWithImpl<
          _$DoctorListDoctorUnselected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? filter) filterChanged,
    required TResult Function(Patient doctor) doctorSelected,
    required TResult Function(Patient doctor) doctorUnselected,
  }) {
    return doctorUnselected(doctor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
  }) {
    return doctorUnselected?.call(doctor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? filter)? filterChanged,
    TResult Function(Patient doctor)? doctorSelected,
    TResult Function(Patient doctor)? doctorUnselected,
    required TResult orElse(),
  }) {
    if (doctorUnselected != null) {
      return doctorUnselected(doctor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorListStarted value) started,
    required TResult Function(DoctorListFilterChanged value) filterChanged,
    required TResult Function(DoctorListDoctorSelected value) doctorSelected,
    required TResult Function(DoctorListDoctorUnselected value)
        doctorUnselected,
  }) {
    return doctorUnselected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
  }) {
    return doctorUnselected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListStarted value)? started,
    TResult Function(DoctorListFilterChanged value)? filterChanged,
    TResult Function(DoctorListDoctorSelected value)? doctorSelected,
    TResult Function(DoctorListDoctorUnselected value)? doctorUnselected,
    required TResult orElse(),
  }) {
    if (doctorUnselected != null) {
      return doctorUnselected(this);
    }
    return orElse();
  }
}

abstract class DoctorListDoctorUnselected extends DoctorListEvent {
  const factory DoctorListDoctorUnselected({required final Patient doctor}) =
      _$DoctorListDoctorUnselected;
  const DoctorListDoctorUnselected._() : super._();

  Patient get doctor => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DoctorListDoctorUnselectedCopyWith<_$DoctorListDoctorUnselected>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DoctorListState {
  String? get filter => throw _privateConstructorUsedError;
  List<Patient> get selectedDoctors => throw _privateConstructorUsedError;
  List<Patient> get doctors => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        initial,
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        fetch,
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        present,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        initial,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        fetch,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        present,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        initial,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        fetch,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        present,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorListInitial value) initial,
    required TResult Function(DoctorListFetch value) fetch,
    required TResult Function(DoctorListPresent value) present,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListInitial value)? initial,
    TResult Function(DoctorListFetch value)? fetch,
    TResult Function(DoctorListPresent value)? present,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListInitial value)? initial,
    TResult Function(DoctorListFetch value)? fetch,
    TResult Function(DoctorListPresent value)? present,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoctorListStateCopyWith<DoctorListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorListStateCopyWith<$Res> {
  factory $DoctorListStateCopyWith(
          DoctorListState value, $Res Function(DoctorListState) then) =
      _$DoctorListStateCopyWithImpl<$Res>;
  $Res call(
      {String? filter, List<Patient> selectedDoctors, List<Patient> doctors});
}

/// @nodoc
class _$DoctorListStateCopyWithImpl<$Res>
    implements $DoctorListStateCopyWith<$Res> {
  _$DoctorListStateCopyWithImpl(this._value, this._then);

  final DoctorListState _value;
  // ignore: unused_field
  final $Res Function(DoctorListState) _then;

  @override
  $Res call({
    Object? filter = freezed,
    Object? selectedDoctors = freezed,
    Object? doctors = freezed,
  }) {
    return _then(_value.copyWith(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDoctors: selectedDoctors == freezed
          ? _value.selectedDoctors
          : selectedDoctors // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      doctors: doctors == freezed
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ));
  }
}

/// @nodoc
abstract class _$$DoctorListInitialCopyWith<$Res>
    implements $DoctorListStateCopyWith<$Res> {
  factory _$$DoctorListInitialCopyWith(
          _$DoctorListInitial value, $Res Function(_$DoctorListInitial) then) =
      __$$DoctorListInitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? filter, List<Patient> selectedDoctors, List<Patient> doctors});
}

/// @nodoc
class __$$DoctorListInitialCopyWithImpl<$Res>
    extends _$DoctorListStateCopyWithImpl<$Res>
    implements _$$DoctorListInitialCopyWith<$Res> {
  __$$DoctorListInitialCopyWithImpl(
      _$DoctorListInitial _value, $Res Function(_$DoctorListInitial) _then)
      : super(_value, (v) => _then(v as _$DoctorListInitial));

  @override
  _$DoctorListInitial get _value => super._value as _$DoctorListInitial;

  @override
  $Res call({
    Object? filter = freezed,
    Object? selectedDoctors = freezed,
    Object? doctors = freezed,
  }) {
    return _then(_$DoctorListInitial(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDoctors: selectedDoctors == freezed
          ? _value._selectedDoctors
          : selectedDoctors // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      doctors: doctors == freezed
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ));
  }
}

/// @nodoc

class _$DoctorListInitial extends DoctorListInitial {
  const _$DoctorListInitial(
      {this.filter,
      required final List<Patient> selectedDoctors,
      required final List<Patient> doctors})
      : _selectedDoctors = selectedDoctors,
        _doctors = doctors,
        super._();

  @override
  final String? filter;
  final List<Patient> _selectedDoctors;
  @override
  List<Patient> get selectedDoctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedDoctors);
  }

  final List<Patient> _doctors;
  @override
  List<Patient> get doctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  String toString() {
    return 'DoctorListState.initial(filter: $filter, selectedDoctors: $selectedDoctors, doctors: $doctors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorListInitial &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            const DeepCollectionEquality()
                .equals(other._selectedDoctors, _selectedDoctors) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(filter),
      const DeepCollectionEquality().hash(_selectedDoctors),
      const DeepCollectionEquality().hash(_doctors));

  @JsonKey(ignore: true)
  @override
  _$$DoctorListInitialCopyWith<_$DoctorListInitial> get copyWith =>
      __$$DoctorListInitialCopyWithImpl<_$DoctorListInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        initial,
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        fetch,
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        present,
  }) {
    return initial(filter, selectedDoctors, doctors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        initial,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        fetch,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        present,
  }) {
    return initial?.call(filter, selectedDoctors, doctors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        initial,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        fetch,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        present,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(filter, selectedDoctors, doctors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorListInitial value) initial,
    required TResult Function(DoctorListFetch value) fetch,
    required TResult Function(DoctorListPresent value) present,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListInitial value)? initial,
    TResult Function(DoctorListFetch value)? fetch,
    TResult Function(DoctorListPresent value)? present,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListInitial value)? initial,
    TResult Function(DoctorListFetch value)? fetch,
    TResult Function(DoctorListPresent value)? present,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DoctorListInitial extends DoctorListState {
  const factory DoctorListInitial(
      {final String? filter,
      required final List<Patient> selectedDoctors,
      required final List<Patient> doctors}) = _$DoctorListInitial;
  const DoctorListInitial._() : super._();

  @override
  String? get filter => throw _privateConstructorUsedError;
  @override
  List<Patient> get selectedDoctors => throw _privateConstructorUsedError;
  @override
  List<Patient> get doctors => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DoctorListInitialCopyWith<_$DoctorListInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoctorListFetchCopyWith<$Res>
    implements $DoctorListStateCopyWith<$Res> {
  factory _$$DoctorListFetchCopyWith(
          _$DoctorListFetch value, $Res Function(_$DoctorListFetch) then) =
      __$$DoctorListFetchCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? filter, List<Patient> selectedDoctors, List<Patient> doctors});
}

/// @nodoc
class __$$DoctorListFetchCopyWithImpl<$Res>
    extends _$DoctorListStateCopyWithImpl<$Res>
    implements _$$DoctorListFetchCopyWith<$Res> {
  __$$DoctorListFetchCopyWithImpl(
      _$DoctorListFetch _value, $Res Function(_$DoctorListFetch) _then)
      : super(_value, (v) => _then(v as _$DoctorListFetch));

  @override
  _$DoctorListFetch get _value => super._value as _$DoctorListFetch;

  @override
  $Res call({
    Object? filter = freezed,
    Object? selectedDoctors = freezed,
    Object? doctors = freezed,
  }) {
    return _then(_$DoctorListFetch(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDoctors: selectedDoctors == freezed
          ? _value._selectedDoctors
          : selectedDoctors // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      doctors: doctors == freezed
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ));
  }
}

/// @nodoc

class _$DoctorListFetch extends DoctorListFetch {
  const _$DoctorListFetch(
      {this.filter,
      required final List<Patient> selectedDoctors,
      required final List<Patient> doctors})
      : _selectedDoctors = selectedDoctors,
        _doctors = doctors,
        super._();

  @override
  final String? filter;
  final List<Patient> _selectedDoctors;
  @override
  List<Patient> get selectedDoctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedDoctors);
  }

  final List<Patient> _doctors;
  @override
  List<Patient> get doctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  String toString() {
    return 'DoctorListState.fetch(filter: $filter, selectedDoctors: $selectedDoctors, doctors: $doctors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorListFetch &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            const DeepCollectionEquality()
                .equals(other._selectedDoctors, _selectedDoctors) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(filter),
      const DeepCollectionEquality().hash(_selectedDoctors),
      const DeepCollectionEquality().hash(_doctors));

  @JsonKey(ignore: true)
  @override
  _$$DoctorListFetchCopyWith<_$DoctorListFetch> get copyWith =>
      __$$DoctorListFetchCopyWithImpl<_$DoctorListFetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        initial,
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        fetch,
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        present,
  }) {
    return fetch(filter, selectedDoctors, doctors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        initial,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        fetch,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        present,
  }) {
    return fetch?.call(filter, selectedDoctors, doctors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        initial,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        fetch,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        present,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(filter, selectedDoctors, doctors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorListInitial value) initial,
    required TResult Function(DoctorListFetch value) fetch,
    required TResult Function(DoctorListPresent value) present,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListInitial value)? initial,
    TResult Function(DoctorListFetch value)? fetch,
    TResult Function(DoctorListPresent value)? present,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListInitial value)? initial,
    TResult Function(DoctorListFetch value)? fetch,
    TResult Function(DoctorListPresent value)? present,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class DoctorListFetch extends DoctorListState {
  const factory DoctorListFetch(
      {final String? filter,
      required final List<Patient> selectedDoctors,
      required final List<Patient> doctors}) = _$DoctorListFetch;
  const DoctorListFetch._() : super._();

  @override
  String? get filter => throw _privateConstructorUsedError;
  @override
  List<Patient> get selectedDoctors => throw _privateConstructorUsedError;
  @override
  List<Patient> get doctors => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DoctorListFetchCopyWith<_$DoctorListFetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoctorListPresentCopyWith<$Res>
    implements $DoctorListStateCopyWith<$Res> {
  factory _$$DoctorListPresentCopyWith(
          _$DoctorListPresent value, $Res Function(_$DoctorListPresent) then) =
      __$$DoctorListPresentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? filter, List<Patient> selectedDoctors, List<Patient> doctors});
}

/// @nodoc
class __$$DoctorListPresentCopyWithImpl<$Res>
    extends _$DoctorListStateCopyWithImpl<$Res>
    implements _$$DoctorListPresentCopyWith<$Res> {
  __$$DoctorListPresentCopyWithImpl(
      _$DoctorListPresent _value, $Res Function(_$DoctorListPresent) _then)
      : super(_value, (v) => _then(v as _$DoctorListPresent));

  @override
  _$DoctorListPresent get _value => super._value as _$DoctorListPresent;

  @override
  $Res call({
    Object? filter = freezed,
    Object? selectedDoctors = freezed,
    Object? doctors = freezed,
  }) {
    return _then(_$DoctorListPresent(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDoctors: selectedDoctors == freezed
          ? _value._selectedDoctors
          : selectedDoctors // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      doctors: doctors == freezed
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ));
  }
}

/// @nodoc

class _$DoctorListPresent extends DoctorListPresent {
  const _$DoctorListPresent(
      {this.filter,
      required final List<Patient> selectedDoctors,
      required final List<Patient> doctors})
      : _selectedDoctors = selectedDoctors,
        _doctors = doctors,
        super._();

  @override
  final String? filter;
  final List<Patient> _selectedDoctors;
  @override
  List<Patient> get selectedDoctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedDoctors);
  }

  final List<Patient> _doctors;
  @override
  List<Patient> get doctors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_doctors);
  }

  @override
  String toString() {
    return 'DoctorListState.present(filter: $filter, selectedDoctors: $selectedDoctors, doctors: $doctors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorListPresent &&
            const DeepCollectionEquality().equals(other.filter, filter) &&
            const DeepCollectionEquality()
                .equals(other._selectedDoctors, _selectedDoctors) &&
            const DeepCollectionEquality().equals(other._doctors, _doctors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(filter),
      const DeepCollectionEquality().hash(_selectedDoctors),
      const DeepCollectionEquality().hash(_doctors));

  @JsonKey(ignore: true)
  @override
  _$$DoctorListPresentCopyWith<_$DoctorListPresent> get copyWith =>
      __$$DoctorListPresentCopyWithImpl<_$DoctorListPresent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        initial,
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        fetch,
    required TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)
        present,
  }) {
    return present(filter, selectedDoctors, doctors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        initial,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        fetch,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        present,
  }) {
    return present?.call(filter, selectedDoctors, doctors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        initial,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        fetch,
    TResult Function(String? filter, List<Patient> selectedDoctors,
            List<Patient> doctors)?
        present,
    required TResult orElse(),
  }) {
    if (present != null) {
      return present(filter, selectedDoctors, doctors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoctorListInitial value) initial,
    required TResult Function(DoctorListFetch value) fetch,
    required TResult Function(DoctorListPresent value) present,
  }) {
    return present(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DoctorListInitial value)? initial,
    TResult Function(DoctorListFetch value)? fetch,
    TResult Function(DoctorListPresent value)? present,
  }) {
    return present?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoctorListInitial value)? initial,
    TResult Function(DoctorListFetch value)? fetch,
    TResult Function(DoctorListPresent value)? present,
    required TResult orElse(),
  }) {
    if (present != null) {
      return present(this);
    }
    return orElse();
  }
}

abstract class DoctorListPresent extends DoctorListState {
  const factory DoctorListPresent(
      {final String? filter,
      required final List<Patient> selectedDoctors,
      required final List<Patient> doctors}) = _$DoctorListPresent;
  const DoctorListPresent._() : super._();

  @override
  String? get filter => throw _privateConstructorUsedError;
  @override
  List<Patient> get selectedDoctors => throw _privateConstructorUsedError;
  @override
  List<Patient> get doctors => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DoctorListPresentCopyWith<_$DoctorListPresent> get copyWith =>
      throw _privateConstructorUsedError;
}
