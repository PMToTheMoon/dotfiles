Map<String, dynamic> anyToJson(dynamic object) => object.toJson(object);
List<dynamic> anyListToJson(List<dynamic> objects) =>
    objects.map((e) => e.toJson()).toList();
