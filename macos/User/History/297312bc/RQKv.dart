abstract class Serializable<T> {
  Map<String, dynamic> toJson(T object);
}

Map<String, dynamic> serializableToJson<T extends Serializable>(T object) =>
    object.toJson(object);
