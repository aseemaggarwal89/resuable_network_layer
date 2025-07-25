import 'package:json_annotation/json_annotation.dart';
import 'package:resuable_network_layer/data_layer/data_source/mapper/JsonSerializable.dart';

part 'base_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class GetBaseResponseDTO<T> extends JsonFactory<GetBaseResponseDTO<T>> {
  String status;
  int results;
  @JsonKey(name: 'data')
  final List<T>? data;
  GetBaseResponseDTO({
    required this.status,
    required this.results,
    required this.data,
  });

  factory GetBaseResponseDTO.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$GetBaseResponseDTOFromJson(json, fromJsonT);

  Map<String, dynamic> toJsonForObject(Object Function(T value) toJsonT) =>
      _$GetBaseResponseDTOToJson(this, toJsonT);
      
   @override
    GetBaseResponseDTO<T> fromJson(Map<String, dynamic> json) {
      // TODO: implement fromJson
      throw UnimplementedError();
    }
}

@JsonSerializable(
  genericArgumentFactories: true,
)
class GetDetailBaseResponse<T> {
  String status;
  @JsonKey(name: 'data')
  T? data;

  GetDetailBaseResponse({required this.data, required this.status});

  factory GetDetailBaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$GetDetailBaseResponseFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJsonForObject(Object Function(T value) toJsonT) => _$GetDetailBaseResponseToJson(this, toJsonT);
}
