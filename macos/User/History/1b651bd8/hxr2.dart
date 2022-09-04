import 'package:zanalys/data/network/network_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';

abstract class AppServicesProvider {
  NetworkService get network;

  StorageService get storage;
}
