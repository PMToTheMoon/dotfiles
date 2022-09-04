Map<String, dynamic> anyToJson(dynamic object) => object.toJson();

List<dynamic>? anyListToJson(List<dynamic>? objects) =>
    objects?.map((e) => e.toJson()).toList();
