import 'package:chopper/chopper.dart';

part 'candidate_api.chopper.dart';

@ChopperApi()
abstract class TodosListService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static TodosListService create([ChopperClient client]) =>
      _$TodosListService(client);
}
