// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Record _$RecordFromJson(Map<String, dynamic> json) {
  return CspUserRecord.fromJson(json);
}

/// @nodoc
mixin _$Record {
  @JsonKey(name: 'statut')
  RecordStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'prioriteMedecin')
  RecordPriority get doctorPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'prioritePrestataire')
  RecordPriority get providerPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'medecin')
  String get doctorID => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateMiseAJour')
  DateTime get lastModified => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorID,
            @JsonKey(name: 'dateMiseAJour')
                DateTime lastModified)
        cspUserRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorID,
            @JsonKey(name: 'dateMiseAJour')
                DateTime lastModified)?
        cspUserRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorID,
            @JsonKey(name: 'dateMiseAJour')
                DateTime lastModified)?
        cspUserRecord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CspUserRecord value) cspUserRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CspUserRecord value)? cspUserRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CspUserRecord value)? cspUserRecord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordCopyWith<Record> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordCopyWith<$Res> {
  factory $RecordCopyWith(Record value, $Res Function(Record) then) =
      _$RecordCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'statut') RecordStatus status,
      @JsonKey(name: 'prioriteMedecin') RecordPriority doctorPriority,
      @JsonKey(name: 'prioritePrestataire') RecordPriority providerPriority,
      @JsonKey(name: 'medecin') String doctorID,
      @JsonKey(name: 'dateMiseAJour') DateTime lastModified});
}

/// @nodoc
class _$RecordCopyWithImpl<$Res> implements $RecordCopyWith<$Res> {
  _$RecordCopyWithImpl(this._value, this._then);

  final Record _value;
  // ignore: unused_field
  final $Res Function(Record) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? doctorPriority = freezed,
    Object? providerPriority = freezed,
    Object? doctorID = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RecordStatus,
      doctorPriority: doctorPriority == freezed
          ? _value.doctorPriority
          : doctorPriority // ignore: cast_nullable_to_non_nullable
              as RecordPriority,
      providerPriority: providerPriority == freezed
          ? _value.providerPriority
          : providerPriority // ignore: cast_nullable_to_non_nullable
              as RecordPriority,
      doctorID: doctorID == freezed
          ? _value.doctorID
          : doctorID // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$CspUserRecordCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$$CspUserRecordCopyWith(
          _$CspUserRecord value, $Res Function(_$CspUserRecord) then) =
      __$$CspUserRecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'statut') RecordStatus status,
      @JsonKey(name: 'prioriteMedecin') RecordPriority doctorPriority,
      @JsonKey(name: 'prioritePrestataire') RecordPriority providerPriority,
      @JsonKey(name: 'medecin') String doctorID,
      @JsonKey(name: 'dateMiseAJour') DateTime lastModified});
}

/// @nodoc
class __$$CspUserRecordCopyWithImpl<$Res> extends _$RecordCopyWithImpl<$Res>
    implements _$$CspUserRecordCopyWith<$Res> {
  __$$CspUserRecordCopyWithImpl(
      _$CspUserRecord _value, $Res Function(_$CspUserRecord) _then)
      : super(_value, (v) => _then(v as _$CspUserRecord));

  @override
  _$CspUserRecord get _value => super._value as _$CspUserRecord;

  @override
  $Res call({
    Object? status = freezed,
    Object? doctorPriority = freezed,
    Object? providerPriority = freezed,
    Object? doctorID = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_$CspUserRecord(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RecordStatus,
      doctorPriority: doctorPriority == freezed
          ? _value.doctorPriority
          : doctorPriority // ignore: cast_nullable_to_non_nullable
              as RecordPriority,
      providerPriority: providerPriority == freezed
          ? _value.providerPriority
          : providerPriority // ignore: cast_nullable_to_non_nullable
              as RecordPriority,
      doctorID: doctorID == freezed
          ? _value.doctorID
          : doctorID // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CspUserRecord extends CspUserRecord {
  const _$CspUserRecord(
      {@JsonKey(name: 'statut') required this.status,
      @JsonKey(name: 'prioriteMedecin') required this.doctorPriority,
      @JsonKey(name: 'prioritePrestataire') required this.providerPriority,
      @JsonKey(name: 'medecin') required this.doctorID,
      @JsonKey(name: 'dateMiseAJour') required this.lastModified})
      : super._();

  factory _$CspUserRecord.fromJson(Map<String, dynamic> json) =>
      _$$CspUserRecordFromJson(json);

  @override
  @JsonKey(name: 'statut')
  final RecordStatus status;
  @override
  @JsonKey(name: 'prioriteMedecin')
  final RecordPriority doctorPriority;
  @override
  @JsonKey(name: 'prioritePrestataire')
  final RecordPriority providerPriority;
  @override
  @JsonKey(name: 'medecin')
  final String doctorID;
  @override
  @JsonKey(name: 'dateMiseAJour')
  final DateTime lastModified;

  @override
  String toString() {
    return 'Record.cspUserRecord(status: $status, doctorPriority: $doctorPriority, providerPriority: $providerPriority, doctorID: $doctorID, lastModified: $lastModified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CspUserRecord &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.doctorPriority, doctorPriority) &&
            const DeepCollectionEquality()
                .equals(other.providerPriority, providerPriority) &&
            const DeepCollectionEquality().equals(other.doctorID, doctorID) &&
            const DeepCollectionEquality()
                .equals(other.lastModified, lastModified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(doctorPriority),
      const DeepCollectionEquality().hash(providerPriority),
      const DeepCollectionEquality().hash(doctorID),
      const DeepCollectionEquality().hash(lastModified));

  @JsonKey(ignore: true)
  @override
  _$$CspUserRecordCopyWith<_$CspUserRecord> get copyWith =>
      __$$CspUserRecordCopyWithImpl<_$CspUserRecord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorID,
            @JsonKey(name: 'dateMiseAJour')
                DateTime lastModified)
        cspUserRecord,
  }) {
    return cspUserRecord(
        status, doctorPriority, providerPriority, doctorID, lastModified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorID,
            @JsonKey(name: 'dateMiseAJour')
                DateTime lastModified)?
        cspUserRecord,
  }) {
    return cspUserRecord?.call(
        status, doctorPriority, providerPriority, doctorID, lastModified);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorID,
            @JsonKey(name: 'dateMiseAJour')
                DateTime lastModified)?
        cspUserRecord,
    required TResult orElse(),
  }) {
    if (cspUserRecord != null) {
      return cspUserRecord(
          status, doctorPriority, providerPriority, doctorID, lastModified);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CspUserRecord value) cspUserRecord,
  }) {
    return cspUserRecord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CspUserRecord value)? cspUserRecord,
  }) {
    return cspUserRecord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CspUserRecord value)? cspUserRecord,
    required TResult orElse(),
  }) {
    if (cspUserRecord != null) {
      return cspUserRecord(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CspUserRecordToJson(this);
  }
}

abstract class CspUserRecord extends Record {
  const factory CspUserRecord(
      {@JsonKey(name: 'statut')
          required final RecordStatus status,
      @JsonKey(name: 'prioriteMedecin')
          required final RecordPriority doctorPriority,
      @JsonKey(name: 'prioritePrestataire')
          required final RecordPriority providerPriority,
      @JsonKey(name: 'medecin')
          required final String doctorID,
      @JsonKey(name: 'dateMiseAJour')
          required final DateTime lastModified}) = _$CspUserRecord;
  const CspUserRecord._() : super._();

  factory CspUserRecord.fromJson(Map<String, dynamic> json) =
      _$CspUserRecord.fromJson;

  @override
  @JsonKey(name: 'statut')
  RecordStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'prioriteMedecin')
  RecordPriority get doctorPriority => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'prioritePrestataire')
  RecordPriority get providerPriority => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'medecin')
  String get doctorID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dateMiseAJour')
  DateTime get lastModified => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$CspUserRecordCopyWith<_$CspUserRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
