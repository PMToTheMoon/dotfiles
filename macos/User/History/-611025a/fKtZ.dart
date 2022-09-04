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

RecordView _$RecordFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'cspUserRecord':
      return CspUserRecordView.fromJson(json);
    case 'patientRecord':
      return PatientRecordView.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Record',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Record {
  @JsonKey(name: 'dossierReference')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'statut')
  RecordStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'prioriteMedecin')
  RecordPriority get doctorPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'prioritePrestataire')
  RecordPriority get providerPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'medecin')
  String get doctorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
  DateTime get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
  DateTime? get lastModified => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  RecordType get recordType => throw _privateConstructorUsedError;
  @JsonKey(name: 'motif')
  String? get recordTypeComplement => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)
        cspUserRecord,
    required TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)
        patientRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        cspUserRecord,
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        patientRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        cspUserRecord,
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        patientRecord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CspUserRecordView value) cspUserRecord,
    required TResult Function(PatientRecordView value) patientRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CspUserRecordView value)? cspUserRecord,
    TResult Function(PatientRecordView value)? patientRecord,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CspUserRecordView value)? cspUserRecord,
    TResult Function(PatientRecordView value)? patientRecord,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordCopyWith<RecordView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordCopyWith<$Res> {
  factory $RecordCopyWith(RecordView value, $Res Function(RecordView) then) =
      _$RecordCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'dossierReference')
          String id,
      @JsonKey(name: 'statut')
          RecordStatus status,
      @JsonKey(name: 'prioriteMedecin')
          RecordPriority doctorPriority,
      @JsonKey(name: 'prioritePrestataire')
          RecordPriority providerPriority,
      @JsonKey(name: 'medecin')
          String doctorId,
      @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
          DateTime dateCreated,
      @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
          DateTime? lastModified,
      @JsonKey(name: 'type')
          RecordType recordType,
      @JsonKey(name: 'motif')
          String? recordTypeComplement});
}

/// @nodoc
class _$RecordCopyWithImpl<$Res> implements $RecordCopyWith<$Res> {
  _$RecordCopyWithImpl(this._value, this._then);

  final RecordView _value;
  // ignore: unused_field
  final $Res Function(RecordView) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? doctorPriority = freezed,
    Object? providerPriority = freezed,
    Object? doctorId = freezed,
    Object? dateCreated = freezed,
    Object? lastModified = freezed,
    Object? recordType = freezed,
    Object? recordTypeComplement = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      doctorId: doctorId == freezed
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recordType: recordType == freezed
          ? _value.recordType
          : recordType // ignore: cast_nullable_to_non_nullable
              as RecordType,
      recordTypeComplement: recordTypeComplement == freezed
          ? _value.recordTypeComplement
          : recordTypeComplement // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'dossierReference')
          String id,
      @JsonKey(name: 'statut')
          RecordStatus status,
      @JsonKey(name: 'prioriteMedecin')
          RecordPriority doctorPriority,
      @JsonKey(name: 'prioritePrestataire')
          RecordPriority providerPriority,
      @JsonKey(name: 'medecin')
          String doctorId,
      @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
          DateTime dateCreated,
      @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
          DateTime? lastModified,
      @JsonKey(name: 'patient')
          String patientId,
      @JsonKey(name: 'patientNom')
          String patientLastName,
      @JsonKey(name: 'patientPrenom')
          String patientFirstName,
      @JsonKey(name: 'type')
          RecordType recordType,
      @JsonKey(name: 'motif')
          String? recordTypeComplement});
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
    Object? id = freezed,
    Object? status = freezed,
    Object? doctorPriority = freezed,
    Object? providerPriority = freezed,
    Object? doctorId = freezed,
    Object? dateCreated = freezed,
    Object? lastModified = freezed,
    Object? patientId = freezed,
    Object? patientLastName = freezed,
    Object? patientFirstName = freezed,
    Object? recordType = freezed,
    Object? recordTypeComplement = freezed,
  }) {
    return _then(_$CspUserRecord(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      doctorId: doctorId == freezed
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      patientId: patientId == freezed
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      patientLastName: patientLastName == freezed
          ? _value.patientLastName
          : patientLastName // ignore: cast_nullable_to_non_nullable
              as String,
      patientFirstName: patientFirstName == freezed
          ? _value.patientFirstName
          : patientFirstName // ignore: cast_nullable_to_non_nullable
              as String,
      recordType: recordType == freezed
          ? _value.recordType
          : recordType // ignore: cast_nullable_to_non_nullable
              as RecordType,
      recordTypeComplement: recordTypeComplement == freezed
          ? _value.recordTypeComplement
          : recordTypeComplement // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CspUserRecord extends CspUserRecordView {
  const _$CspUserRecord(
      {@JsonKey(name: 'dossierReference')
          required this.id,
      @JsonKey(name: 'statut')
          required this.status,
      @JsonKey(name: 'prioriteMedecin')
          required this.doctorPriority,
      @JsonKey(name: 'prioritePrestataire')
          required this.providerPriority,
      @JsonKey(name: 'medecin')
          required this.doctorId,
      @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
          required this.dateCreated,
      @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
          required this.lastModified,
      @JsonKey(name: 'patient')
          required this.patientId,
      @JsonKey(name: 'patientNom')
          required this.patientLastName,
      @JsonKey(name: 'patientPrenom')
          required this.patientFirstName,
      @JsonKey(name: 'type')
          required this.recordType,
      @JsonKey(name: 'motif')
          this.recordTypeComplement,
      final String? $type})
      : $type = $type ?? 'cspUserRecord',
        super._();

  factory _$CspUserRecord.fromJson(Map<String, dynamic> json) =>
      _$$CspUserRecordFromJson(json);

  @override
  @JsonKey(name: 'dossierReference')
  final String id;
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
  final String doctorId;
  @override
  @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
  final DateTime dateCreated;
  @override
  @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
  final DateTime? lastModified;
  @override
  @JsonKey(name: 'patient')
  final String patientId;
  @override
  @JsonKey(name: 'patientNom')
  final String patientLastName;
  @override
  @JsonKey(name: 'patientPrenom')
  final String patientFirstName;
  @override
  @JsonKey(name: 'type')
  final RecordType recordType;
  @override
  @JsonKey(name: 'motif')
  final String? recordTypeComplement;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Record.cspUserRecord(id: $id, status: $status, doctorPriority: $doctorPriority, providerPriority: $providerPriority, doctorId: $doctorId, dateCreated: $dateCreated, lastModified: $lastModified, patientId: $patientId, patientLastName: $patientLastName, patientFirstName: $patientFirstName, recordType: $recordType, recordTypeComplement: $recordTypeComplement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CspUserRecord &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.doctorPriority, doctorPriority) &&
            const DeepCollectionEquality()
                .equals(other.providerPriority, providerPriority) &&
            const DeepCollectionEquality().equals(other.doctorId, doctorId) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality()
                .equals(other.lastModified, lastModified) &&
            const DeepCollectionEquality().equals(other.patientId, patientId) &&
            const DeepCollectionEquality()
                .equals(other.patientLastName, patientLastName) &&
            const DeepCollectionEquality()
                .equals(other.patientFirstName, patientFirstName) &&
            const DeepCollectionEquality()
                .equals(other.recordType, recordType) &&
            const DeepCollectionEquality()
                .equals(other.recordTypeComplement, recordTypeComplement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(doctorPriority),
      const DeepCollectionEquality().hash(providerPriority),
      const DeepCollectionEquality().hash(doctorId),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(lastModified),
      const DeepCollectionEquality().hash(patientId),
      const DeepCollectionEquality().hash(patientLastName),
      const DeepCollectionEquality().hash(patientFirstName),
      const DeepCollectionEquality().hash(recordType),
      const DeepCollectionEquality().hash(recordTypeComplement));

  @JsonKey(ignore: true)
  @override
  _$$CspUserRecordCopyWith<_$CspUserRecord> get copyWith =>
      __$$CspUserRecordCopyWithImpl<_$CspUserRecord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)
        cspUserRecord,
    required TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)
        patientRecord,
  }) {
    return cspUserRecord(
        id,
        status,
        doctorPriority,
        providerPriority,
        doctorId,
        dateCreated,
        lastModified,
        patientId,
        patientLastName,
        patientFirstName,
        recordType,
        recordTypeComplement);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        cspUserRecord,
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        patientRecord,
  }) {
    return cspUserRecord?.call(
        id,
        status,
        doctorPriority,
        providerPriority,
        doctorId,
        dateCreated,
        lastModified,
        patientId,
        patientLastName,
        patientFirstName,
        recordType,
        recordTypeComplement);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        cspUserRecord,
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        patientRecord,
    required TResult orElse(),
  }) {
    if (cspUserRecord != null) {
      return cspUserRecord(
          id,
          status,
          doctorPriority,
          providerPriority,
          doctorId,
          dateCreated,
          lastModified,
          patientId,
          patientLastName,
          patientFirstName,
          recordType,
          recordTypeComplement);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CspUserRecordView value) cspUserRecord,
    required TResult Function(PatientRecordView value) patientRecord,
  }) {
    return cspUserRecord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CspUserRecordView value)? cspUserRecord,
    TResult Function(PatientRecordView value)? patientRecord,
  }) {
    return cspUserRecord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CspUserRecordView value)? cspUserRecord,
    TResult Function(PatientRecordView value)? patientRecord,
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

abstract class CspUserRecordView extends RecordView {
  const factory CspUserRecordView(
      {@JsonKey(name: 'dossierReference')
          required final String id,
      @JsonKey(name: 'statut')
          required final RecordStatus status,
      @JsonKey(name: 'prioriteMedecin')
          required final RecordPriority doctorPriority,
      @JsonKey(name: 'prioritePrestataire')
          required final RecordPriority providerPriority,
      @JsonKey(name: 'medecin')
          required final String doctorId,
      @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
          required final DateTime dateCreated,
      @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
          required final DateTime? lastModified,
      @JsonKey(name: 'patient')
          required final String patientId,
      @JsonKey(name: 'patientNom')
          required final String patientLastName,
      @JsonKey(name: 'patientPrenom')
          required final String patientFirstName,
      @JsonKey(name: 'type')
          required final RecordType recordType,
      @JsonKey(name: 'motif')
          final String? recordTypeComplement}) = _$CspUserRecord;
  const CspUserRecordView._() : super._();

  factory CspUserRecordView.fromJson(Map<String, dynamic> json) =
      _$CspUserRecord.fromJson;

  @override
  @JsonKey(name: 'dossierReference')
  String get id => throw _privateConstructorUsedError;
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
  String get doctorId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
  DateTime get dateCreated => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
  DateTime? get lastModified => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient')
  String get patientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'patientNom')
  String get patientLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'patientPrenom')
  String get patientFirstName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'type')
  RecordType get recordType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'motif')
  String? get recordTypeComplement => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$CspUserRecordCopyWith<_$CspUserRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PatientRecordCopyWith<$Res> implements $RecordCopyWith<$Res> {
  factory _$$PatientRecordCopyWith(
          _$PatientRecord value, $Res Function(_$PatientRecord) then) =
      __$$PatientRecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'dossierReference')
          String id,
      @JsonKey(name: 'statut')
          RecordStatus status,
      @JsonKey(name: 'prioriteMedecin')
          RecordPriority doctorPriority,
      @JsonKey(name: 'prioritePrestataire')
          RecordPriority providerPriority,
      @JsonKey(name: 'medecin')
          String doctorId,
      @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
          DateTime dateCreated,
      @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
          DateTime? lastModified,
      @JsonKey(name: 'type')
          RecordType recordType,
      @JsonKey(name: 'motif')
          String? recordTypeComplement});
}

/// @nodoc
class __$$PatientRecordCopyWithImpl<$Res> extends _$RecordCopyWithImpl<$Res>
    implements _$$PatientRecordCopyWith<$Res> {
  __$$PatientRecordCopyWithImpl(
      _$PatientRecord _value, $Res Function(_$PatientRecord) _then)
      : super(_value, (v) => _then(v as _$PatientRecord));

  @override
  _$PatientRecord get _value => super._value as _$PatientRecord;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? doctorPriority = freezed,
    Object? providerPriority = freezed,
    Object? doctorId = freezed,
    Object? dateCreated = freezed,
    Object? lastModified = freezed,
    Object? recordType = freezed,
    Object? recordTypeComplement = freezed,
  }) {
    return _then(_$PatientRecord(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      doctorId: doctorId == freezed
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recordType: recordType == freezed
          ? _value.recordType
          : recordType // ignore: cast_nullable_to_non_nullable
              as RecordType,
      recordTypeComplement: recordTypeComplement == freezed
          ? _value.recordTypeComplement
          : recordTypeComplement // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientRecord extends PatientRecordView {
  const _$PatientRecord(
      {@JsonKey(name: 'dossierReference')
          required this.id,
      @JsonKey(name: 'statut')
          required this.status,
      @JsonKey(name: 'prioriteMedecin')
          required this.doctorPriority,
      @JsonKey(name: 'prioritePrestataire')
          required this.providerPriority,
      @JsonKey(name: 'medecin')
          required this.doctorId,
      @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
          required this.dateCreated,
      @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
          required this.lastModified,
      @JsonKey(name: 'type')
          required this.recordType,
      @JsonKey(name: 'motif')
          this.recordTypeComplement,
      final String? $type})
      : $type = $type ?? 'patientRecord',
        super._();

  factory _$PatientRecord.fromJson(Map<String, dynamic> json) =>
      _$$PatientRecordFromJson(json);

  @override
  @JsonKey(name: 'dossierReference')
  final String id;
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
  final String doctorId;
  @override
  @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
  final DateTime dateCreated;
  @override
  @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
  final DateTime? lastModified;
  @override
  @JsonKey(name: 'type')
  final RecordType recordType;
  @override
  @JsonKey(name: 'motif')
  final String? recordTypeComplement;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Record.patientRecord(id: $id, status: $status, doctorPriority: $doctorPriority, providerPriority: $providerPriority, doctorId: $doctorId, dateCreated: $dateCreated, lastModified: $lastModified, recordType: $recordType, recordTypeComplement: $recordTypeComplement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientRecord &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.doctorPriority, doctorPriority) &&
            const DeepCollectionEquality()
                .equals(other.providerPriority, providerPriority) &&
            const DeepCollectionEquality().equals(other.doctorId, doctorId) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality()
                .equals(other.lastModified, lastModified) &&
            const DeepCollectionEquality()
                .equals(other.recordType, recordType) &&
            const DeepCollectionEquality()
                .equals(other.recordTypeComplement, recordTypeComplement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(doctorPriority),
      const DeepCollectionEquality().hash(providerPriority),
      const DeepCollectionEquality().hash(doctorId),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(lastModified),
      const DeepCollectionEquality().hash(recordType),
      const DeepCollectionEquality().hash(recordTypeComplement));

  @JsonKey(ignore: true)
  @override
  _$$PatientRecordCopyWith<_$PatientRecord> get copyWith =>
      __$$PatientRecordCopyWithImpl<_$PatientRecord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)
        cspUserRecord,
    required TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)
        patientRecord,
  }) {
    return patientRecord(id, status, doctorPriority, providerPriority, doctorId,
        dateCreated, lastModified, recordType, recordTypeComplement);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        cspUserRecord,
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        patientRecord,
  }) {
    return patientRecord?.call(id, status, doctorPriority, providerPriority,
        doctorId, dateCreated, lastModified, recordType, recordTypeComplement);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'patient')
                String patientId,
            @JsonKey(name: 'patientNom')
                String patientLastName,
            @JsonKey(name: 'patientPrenom')
                String patientFirstName,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        cspUserRecord,
    TResult Function(
            @JsonKey(name: 'dossierReference')
                String id,
            @JsonKey(name: 'statut')
                RecordStatus status,
            @JsonKey(name: 'prioriteMedecin')
                RecordPriority doctorPriority,
            @JsonKey(name: 'prioritePrestataire')
                RecordPriority providerPriority,
            @JsonKey(name: 'medecin')
                String doctorId,
            @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
                DateTime dateCreated,
            @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
                DateTime? lastModified,
            @JsonKey(name: 'type')
                RecordType recordType,
            @JsonKey(name: 'motif')
                String? recordTypeComplement)?
        patientRecord,
    required TResult orElse(),
  }) {
    if (patientRecord != null) {
      return patientRecord(
          id,
          status,
          doctorPriority,
          providerPriority,
          doctorId,
          dateCreated,
          lastModified,
          recordType,
          recordTypeComplement);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CspUserRecordView value) cspUserRecord,
    required TResult Function(PatientRecordView value) patientRecord,
  }) {
    return patientRecord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CspUserRecordView value)? cspUserRecord,
    TResult Function(PatientRecordView value)? patientRecord,
  }) {
    return patientRecord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CspUserRecordView value)? cspUserRecord,
    TResult Function(PatientRecordView value)? patientRecord,
    required TResult orElse(),
  }) {
    if (patientRecord != null) {
      return patientRecord(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientRecordToJson(this);
  }
}

abstract class PatientRecordView extends RecordView {
  const factory PatientRecordView(
      {@JsonKey(name: 'dossierReference')
          required final String id,
      @JsonKey(name: 'statut')
          required final RecordStatus status,
      @JsonKey(name: 'prioriteMedecin')
          required final RecordPriority doctorPriority,
      @JsonKey(name: 'prioritePrestataire')
          required final RecordPriority providerPriority,
      @JsonKey(name: 'medecin')
          required final String doctorId,
      @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
          required final DateTime dateCreated,
      @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
          required final DateTime? lastModified,
      @JsonKey(name: 'type')
          required final RecordType recordType,
      @JsonKey(name: 'motif')
          final String? recordTypeComplement}) = _$PatientRecord;
  const PatientRecordView._() : super._();

  factory PatientRecordView.fromJson(Map<String, dynamic> json) =
      _$PatientRecord.fromJson;

  @override
  @JsonKey(name: 'dossierReference')
  String get id => throw _privateConstructorUsedError;
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
  String get doctorId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dateCreation', fromJson: _dateTimeFromJson)
  DateTime get dateCreated => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dateMiseAJour', fromJson: _nullableDateTimeFromJson)
  DateTime? get lastModified => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'type')
  RecordType get recordType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'motif')
  String? get recordTypeComplement => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$PatientRecordCopyWith<_$PatientRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
