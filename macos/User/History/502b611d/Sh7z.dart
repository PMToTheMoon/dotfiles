import 'dart:async';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

typedef Skills = Set<Skill>;

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
    final experiences = await _candidateApi
        .professionalExperiences(authRepository.session.userId)
        .then((res) =>
            res.unwrapOrThrow('Unable to fetch professional experiences'));
    _professionalExperiences = experiences;
    _professionalExperiencesStream.add(experiences);
    return experiences;
  }

  Future<void> deleteProfessionalExperience(String id) async {
    await _candidateApi.deleteProfessionalExperience(
        authRepository.session.userId, id);
    if (_professionalExperiences != null) {
      final newList =
          List<ProfessionalExperience>.from(_professionalExperiences!);
      newList.removeWhere((element) => element.id == id);
      _professionalExperiences = newList;
      _professionalExperiencesStream.add(newList);
    } else {
      await fetchProfessionalExperiences();
    }
  }

  Future<void> createProfessionalExperience(
    NewProfessionalExperience experience,
  ) async {
    await _candidateApi
        .createProfessionalExperience(authRepository.session.userId, experience)
        .then((r) => r.unwrapOrThrow(r));
    await fetchProfessionalExperiences();
  }

  Future<void> updateProfessionalExperience(
    ProfessionalExperienceUpdate update,
  ) async {
    await _candidateApi
        .updateProfessionalExperience(
            authRepository.session.userId, update.id, update)
        .then((r) => r.unwrapOrThrow(r));
    await fetchProfessionalExperiences();
  }

  // Skillz

  final _skillsStreamController = StreamController<Skills>.broadcast();
  Stream<Skills> get skillsStream => _skillsStreamController.stream;
  Skills? _skills;
  Skills? get skills => _skills;

  Future<Skills> fetchSkills() async {
    final res = await _candidateApi
        .skills(authRepository.session.userId)
        .then((r) => r.unwrapOrThrow('Unable to fetch skills'));
    final skills = Set<Skill>.from(res);
    _skills = skills;
    _skillsStreamController.add(skills);
    return skills;
  }

  Future<void> createSkills(Skills value) async {
    await _candidateApi
        .createSkills(
          authRepository.session.userId,
          value.toList(),
        )
        .then((r) => r.unwrapOrThrow('Unable to set skills'));
    await fetchSkills();
  }

  Future<void> deleteSkills(Skill skill) async {
    await _candidateApi
        .deleteSkill(authRepository.session.userId, skill.name)
        .then((res) => res.unwrapOrThrow('Unable to delete skill'));
    if (_skills?.isNotEmpty == true) {
      final newValue = Set.of(_skills!)..remove(skill);
      _skills = newValue;
      _skillsStreamController.add(newValue);
    } else {
      await fetchSkills();
    }
  }

  // Educations

  final _educationsStream = StreamController<List<Education>>.broadcast();
  List<Education>? _educations;

  Stream<List<Education>> get educationsStream => _educationsStream.stream;

  List<Education>? get educations => _educations;

  Future<List<Education>> fetchEducations() async {
    final res = await _candidateApi
        .educations(authRepository.session.userId)
        .then((res) => res.unwrapOrThrow(res));
    _educations = res;
    _educationsStream.add(res);
    return res;
  }

  Future<void> deleteEducation(String id) async {
    await _candidateApi.deleteEducation(authRepository.session.userId, id);
    if (_educations != null) {
      final newList = List<Education>.from(_educations!);
      newList.removeWhere((element) => element.id == id);
      _educations = newList;
      _educationsStream.add(newList);
    } else {
      await fetchEducations();
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
      final educations = List<Education>.from(_educations!);
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
      _educations = educations;
      _educationsStream.add(_educations!);
    }
  }
}
