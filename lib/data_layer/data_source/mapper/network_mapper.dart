
import 'package:resuable_network_layer/domain_layer/utils/network_exceptions.dart';

class GenericFactory {
  static final Map<Type, Function(Map<String, dynamic>)> _factories = {};

  static void register<T>(T Function(Map<String, dynamic>) factory) {
    _factories[T] = factory;
  }

  static T fromJson<T>(Map<String, dynamic> json) {
    final factory = _factories[T];
    if (factory != null) {
        return factory(json) as T;
    } else {
      if (json is List) {
        return _fromJsonList<T>(json as List) as T;
      } else if (T == bool ||
              T == String ||
              T == int ||
              T == double ||
              T == Map<String, dynamic>) {
                         // primitives
            if (json is bool ||
                json is String ||
                json is int ||
                json is double ||
                // ignore: unnecessary_type_check
                json is Map<String, dynamic>) {
              return json as T;
            } else {
              throw const NetworkExceptions.unableToDecodeJson(null);
            }
   
      } else {
         throw const NetworkExceptions.unableToDecodeJson(null);
      }
    }
  }

  static List<K> _fromJsonList<K>(List<dynamic> jsonList) {
    return jsonList.map<K>((json) => fromJson<K>(json)).toList();
  }
}