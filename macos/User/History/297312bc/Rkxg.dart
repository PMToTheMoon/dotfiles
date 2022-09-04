abstract class Serializable<T> {
  Map<String, dynamic> serializableToJson(T object);
}

Map<String, dynamic> serializableToJson<T>(T object);