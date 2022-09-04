import 'package:zanalys/data/network/network_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';

abstract class AppServicesInitializer {
  FutureOr<void> init();
}
