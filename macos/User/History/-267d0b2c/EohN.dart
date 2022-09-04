import 'package:chopper/chopper.dart';

part 'candidate_api.chopper.dart';

@ChopperApi()
abstract class CandidateApi extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static CandidateApi create([ChopperClient client]) => _$CandidateApi(client);
}
