import 'dart:async';

import 'package:models/models.dart';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys/user/user_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class RecordService {
  RecordService({
    required AuthService authService,
    required this.userService,
    required AppEnvironment environment,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: false, //environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  final UserService userService;

  late final api.ZanalysPrivateApiClient _client;

  final _recordsStream = StreamController<List<CspUserRecordView>>.broadcast();

  List<CspUserRecordView>? _records;

  List<CspUserRecordView>? get records => _records;

  Stream<List<CspUserRecordView>> get recordsStream => _recordsStream.stream;

  Future<void> updatePushToken({required String token}) =>
      _client.updatePushToken(token: token);

  Future<void> fetchRecords() async {
    if (userService.user == null) return;
    final records = await _client.cspUserRecords(userService.user!.id!);
    _records = records;
    _recordsStream.add(records);
  }

  /// Returns the newly created record's id
  Future<String> newRecord(NewRecord record) async {
    final id = await _client.newRecord(record);
    await fetchRecords();
    return id;
  }

  Future<void> deleteRecord(String id) async {
    await _client.deleteRecord(id);
    await fetchRecords();
  }

  Future<Record> fullRecord(String id) async {
    return _client.fullRecord(id);
  }

  Future<void> publishGeneralRecord(
    Record record, {
    required String title,
    required MedicalInformationGeneral? medicalInformation,
    required MedicalContext? medicalContext,
  }) async {
    final update = generalRecordUpdateFromRecord(record);
    await _client.publishGeneralRecord(update);
  }

  Future<void> updateGeneralRecord(
    Record record, {
    required MedicalInformationGeneral medicalInformation,
  }) async {
    final medicalInformationOverride =
        api.GeneralRecordUpdateMedicalInformation(
      id: record.medicalInformationGeneral?.id ?? 0,
      weight: medicalInformation.weight,
      height: medicalInformation.height,
      temperature: medicalInformation.temperature,
      heartRate: medicalInformation.heartRate,
      SasSuspected: medicalInformation.SasSuspected,
      smoker: medicalInformation.smoker,
      alcohol: medicalInformation.alcohol,
      smokeFrequency: medicalInformation.smokeFrequency,
      alcoholFrequency: medicalInformation.alcoholFrequency,
      bodyMassIndex: medicalInformation.bodyMassIndex,
      comment: medicalInformation.comment,
      arterialPressurePas: medicalInformation.arterialPressurePas,
      arterialPressurePad: medicalInformation.arterialPressurePad,
      treatments: medicalInformation.treatments,
    );
    final update = api.GeneralRecordUpdate(
      childRecords: [],
      id: record.id,
      type: record.type,
      title: record.title,
      creationDate: record.creationDate,
      creatorId: record.creatorId,
      shareDate: record.shareDate,
      lastModifiedDate: record.lastModifiedDate,
      closingDate: record.closingDate,
      assignmentDate: record.assignmentDate,
      patientConsent: record.patientConsent,
      trustedPersonConsent: record.trustedPersonConsent,
      trustedPersonFirstName: record.trustedPersonFirstName,
      trustedPersonLastName: record.trustedPersonLastName,
      trustedPersonFamilyLink: record.trustedPersonFamilyLink,
      status: record.status,
      patientStatus: record.patientStatus,
      doctorProviderStatus: record.doctorProviderStatus,
      patient: record.patient,
      doctorId: record.doctorId,
      doctorLastName: record.doctorLastName,
      doctorFirstName: record.doctorFirstName,
      delegateDoctor: record.delegateDoctor,
      delegateDoctorLastName: record.delegateDoctorLastName,
      delegateDoctorFirstName: record.delegateDoctorFirstName,
      establishmentId: record.establishmentId,
      providerId: record.providerId,
      providerLastName: record.providerLastName,
      providerFirstName: record.providerFirstName,
      providerConsultationId: record.providerConsultationId,
      providerConsultation: record.providerConsultation,
      providerSpecialty: record.providerSpecialty,
      paymentDate: record.paymentDate,
      groupAffectation: record.groupAffectation,
      doctorAdvice: record.doctorAdvice,
      doctorAdviceDate: record.doctorAdviceDate,
      rapportValidationDate: record.rapportValidationDate,
      toValidateOrReturn: record.toValidateOrReturn,
      paymentCode: record.paymentCode,
      billedToEstablishment: record.billedToEstablishment,
      urgent: record.urgent,
      consultationBill: record.consultationBill,
      reason: record.reason,
      reasonText: record.reasonText,
      priorityForDoctor: record.priorityForDoctor,
      priorityForProvider: record.priorityForProvider,
      serviceType: record.serviceType,
      parentRecordId: record.parentRecordId,
      complements: record.complements,
      medicalInformationGeneral: medicalInformationOverride,
      medicalContext: record.medicalInformationGeneral?.medicalContext,
    );
    return _client.updateGeneralRecord(
      update,
    );
  }
}

api.GeneralRecordUpdate generalRecordUpdateFromRecord(Record record) =>
    api.GeneralRecordUpdate(
      childRecords: [],
      id: record.id,
      type: record.type,
      title: record.title,
      creationDate: record.creationDate,
      creatorId: record.creatorId,
      shareDate: record.shareDate,
      lastModifiedDate: record.lastModifiedDate,
      closingDate: record.closingDate,
      assignmentDate: record.assignmentDate,
      patientConsent: record.patientConsent,
      trustedPersonConsent: record.trustedPersonConsent,
      trustedPersonFirstName: record.trustedPersonFirstName,
      trustedPersonLastName: record.trustedPersonLastName,
      trustedPersonFamilyLink: record.trustedPersonFamilyLink,
      status: record.status,
      patientStatus: record.patientStatus,
      doctorProviderStatus: record.doctorProviderStatus,
      patient: record.patient,
      doctorId: record.doctorId,
      doctorLastName: record.doctorLastName,
      doctorFirstName: record.doctorFirstName,
      delegateDoctor: record.delegateDoctor,
      delegateDoctorLastName: record.delegateDoctorLastName,
      delegateDoctorFirstName: record.delegateDoctorFirstName,
      establishmentId: record.establishmentId,
      providerId: record.providerId,
      providerLastName: record.providerLastName,
      providerFirstName: record.providerFirstName,
      providerConsultationId: record.providerConsultationId,
      providerConsultation: record.providerConsultation,
      providerSpecialty: record.providerSpecialty,
      paymentDate: record.paymentDate,
      groupAffectation: record.groupAffectation,
      doctorAdvice: record.doctorAdvice,
      doctorAdviceDate: record.doctorAdviceDate,
      rapportValidationDate: record.rapportValidationDate,
      toValidateOrReturn: record.toValidateOrReturn,
      paymentCode: record.paymentCode,
      billedToEstablishment: record.billedToEstablishment,
      urgent: record.urgent,
      consultationBill: record.consultationBill,
      reason: record.reason,
      reasonText: record.reasonText,
      priorityForDoctor: record.priorityForDoctor,
      priorityForProvider: record.priorityForProvider,
      serviceType: record.serviceType,
      parentRecordId: record.parentRecordId,
      complements: record.complements,
      medicalInformationGeneral: api.GeneralRecordUpdateMedicalInformation(
        id: record.medicalInformationGeneral?.id ?? 0,
        weight: record.medicalInformationGeneral?.weight,
        height: record.medicalInformationGeneral?.height,
        temperature: record.medicalInformationGeneral?.temperature,
        heartRate: record.medicalInformationGeneral?.heartRate,
        SasSuspected: record.medicalInformationGeneral?.SasSuspected,
        smoker: record.medicalInformationGeneral?.smoker,
        alcohol: record.medicalInformationGeneral?.alcohol,
        smokeFrequency: record.medicalInformationGeneral?.smokeFrequency,
        alcoholFrequency: record.medicalInformationGeneral?.alcoholFrequency,
        bodyMassIndex: record.medicalInformationGeneral?.bodyMassIndex,
        comment: record.medicalInformationGeneral?.comment,
        arterialPressurePas:
            record.medicalInformationGeneral?.arterialPressurePas,
        arterialPressurePad:
            record.medicalInformationGeneral?.arterialPressurePad,
        treatments: record.medicalInformationGeneral?.treatments,
      ),
      medicalContext: record.medicalInformationGeneral?.medicalContext,
    );
