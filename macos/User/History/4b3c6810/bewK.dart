// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CandidateApi extends CandidateService {
  _$CandidateApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CandidateService;

  @override
  Future<Response<Candidate>> candidate(String id) {
    final $url = '/candidates/:candidate_id';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Candidate, Candidate>($request);
  }
}
