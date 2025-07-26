// abstract class JsonSerializable<T> {
//   T fromJson(Map<String, dynamic> json);
//   Map<String, dynamic> toJson();
// }

abstract class JsonFactory<T> {
  T fromJson(Map<String, dynamic> json);
}