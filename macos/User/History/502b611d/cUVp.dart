import 'dart:async';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

typedef Skills = Set<String>;

/// A repository that provides control over candidate profile data
/// Current user should be a candidate to use these repository
class CandidateRepository {
  CandidateRepository({
    required this.authRepository,
  }) : _candidateApi = authRepository.tbtPrivateClient.candidate;

  final AuthRepository authRepository;
  final CandidateService _candidateApi;

  /// Whole candidate stream
  // final _candidateStream = StreamController<Candidate>.broadcast();
  // Candidate? _candidate;

  // Stream<Candidate> get candidateStream => _candidateStream.stream;
  // Candidate? get candidate => _candidate;

  // Future<Candidate> fetchCandidate() async {
  //   final candidate = await _candidateApi
  //       .candidate(authRepository.session.userId)
  //       .then((r) => r.unwrapOrThrow('unable to fetch candidate'));
  //   _candidate = candidate;
  //   _candidateStream.add(candidate);
  //   return candidate;
  // }

  // PROFESSIONAL EXPERIENCES

  final _professionalExperiencesStream =
      StreamController<List<ProfessionalExperience>>.broadcast();
  List<ProfessionalExperience>? _professionalExperiences;

  Stream<List<ProfessionalExperience>> get professionalExperiencesStream =>
      _professionalExperiencesStream.stream;

  List<ProfessionalExperience>? get professionalExperiences =>
      _professionalExperiences;

  Future<List<ProfessionalExperience>> fetchProfessionalExperiences() async {
    await Future.delayed(const Duration(seconds: 1));
    final res = [
      ProfessionalExperience(
        id: '0',
        title: "title",
        company: "company",
        location: "location",
        startDate: DateTime.now(),
      ),
    ];
    _professionalExperiences = res;
    _professionalExperiencesStream.add(res);
    return res;
  }

  Future<void> deleteProfessionalExperience(String id) async {
    if (_professionalExperiences != null) {
      final newList =
          List<ProfessionalExperience>.from(_professionalExperiences!);
      newList.removeWhere((element) => element.id == id);
      _professionalExperiences = newList;
      _professionalExperiencesStream.add(newList);
    }
  }

  Future<void> createProfessionalExperience(
    NewProfessionalExperience experience,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final List<ProfessionalExperience> experiences =
        _professionalExperiences ?? [];
    experiences.add(
      ProfessionalExperience(
          id: _professionalExperiences?.length.toString() ?? '0',
          title: experience.title,
          company: experience.company,
          location: experience.location,
          startDate: experience.startDate,
          endDate: experience.endDate,
          description: experience.description),
    );
    _professionalExperiences = experiences;
    _professionalExperiencesStream.add(experiences);
  }

  Future<void> updateProfessionalExperience(
    ProfessionalExperienceUpdate update,
  ) async {
    if (_professionalExperiences != null) {
      final experienceIndex = _professionalExperiences!
          .indexWhere((element) => element.id == update.id);
      final e = _professionalExperiences![experienceIndex];
      _professionalExperiences?[experienceIndex] = ProfessionalExperience(
        id: e.id,
        title: update.title ?? e.title,
        company: update.company ?? e.company,
        location: update.location ?? e.location,
        startDate: update.startDate ?? e.startDate,
        endDate: update.endDate ?? e.endDate,
        description: update.description ?? e.description,
      );
      _professionalExperiencesStream.add(_professionalExperiences!);
    }
  }

  // Skillz

  final _skillsStreamController = StreamController<Skills>.broadcast();
  Stream<Skills> get skillsStream => _skillsStreamController.stream;
  Skills? _skills;
  Skills? get skills => _skills;

  Future<Skills> fetchSkills() async {
    await Future.delayed(const Duration(seconds: 3));
    final res = {
      'Smart',
      'Flutter',
      'Dev',
    };
    _skills = res;
    _skillsStreamController.add(res);
    return res;
  }

  Future<void> setSkills(Skills value) async {
    await Future.delayed(const Duration(seconds: 1));
    _skills = value;
    _skillsStreamController.add(value);
  }

  Future<void> deleteSkills(String skill) async {
    if (_skills?.isNotEmpty == true) {
      await Future.delayed(const Duration(seconds: 1));
      final newValue = Set.of(_skills!)..remove(skill);
      _skills = newValue;
      _skillsStreamController.add(newValue);
    }
  }

  // Educations

  final _educationsStream = StreamController<List<Education>>.broadcast();
  List<Education>? _educations;

  Stream<List<Education>> get educationsStream => _educationsStream.stream;

  List<Education>? get educations => _educations;

  Future<List<Education>> fetchEducations() async {
    await Future.delayed(const Duration(seconds: 1));
    final res = [
      Education(
        id: '0',
        title: "title",
        school: "company",
        location: "location",
        startDate: DateTime.now(),
      ),
    ];
    _educations = res;
    _educationsStream.add(res);
    return res;
  }

  Future<void> deleteEducation(String id) async {
    if (_educations != null) {
      final newList = List<Education>.from(_educations!);
      newList.removeWhere((element) => element.id == id);
      _educations = newList;
      _educationsStream.add(newList);
    }
  }

  Future<void> createEducation(
    NewEducation education,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    final List<Education> educations = List.from(_educations ?? []);
    educations.add(
      Education(
          id: _educations?.length.toString() ?? '0',
          title: education.title,
          school: education.school,
          location: education.location,
          startDate: education.startDate,
          endDate: education.endDate,
          description: education.description),
    );
    _educations = educations;
    _educationsStream.add(educations);
  }

  Future<void> updateEducation(
    EducationUpdate update,
  ) async {
    if (_educations != null) {
      final educations = List.from(_educations!);
      final educationIndex =
          educations.indexWhere((element) => element.id == update.id);
      final e = educations[educationIndex];
      educations[educationIndex] = Education(
        id: e.id,
        title: update.title ?? e.title,
        school: update.school ?? e.school,
        location: update.location ?? e.location,
        startDate: update.startDate ?? e.startDate,
        endDate: update.endDate ?? e.endDate,
        description: update.description ?? e.description,
      );
      _educationsStream.add(_educations!);
    }
  }
}
