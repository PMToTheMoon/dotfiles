import 'package:yaml/yaml.dart';

extension YamlMapConverter on YamlMap {
  dynamic _convertNode(dynamic value) {
    if (value is YamlMap) {
      return value.toMap();
    } else if (value is YamlList) {
      var list = <dynamic>[];
      v.forEach((e) {
        list.add(_convertNode(e));
      });
      return list;
    } else {
      return v;
    }
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    nodes.forEach((k, v) {
      map[(k as YamlScalar).value.toString()] = _convertNode(v.value);
    });
    return map;
  }
}
