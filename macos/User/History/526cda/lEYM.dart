import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';

class MetaFetchSmbData {}

class MetaFetchSmb extends YamlMetaObject<MetaFetchSmbData> {
  @override
  FutureOr<void> build(BuildContext context, MetaFetchSmbData data) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

/// Generate fetch bloc using state_machine_bloc
class FetchSmbGenerator extends YamlGenerator<MetaFetchSmb>

