import 'package:json_annotation/json_annotation.dart';
import '/domain_layer/domain_layer.dart';

part 'authenticate_response_dto.g.dart';

@JsonSerializable()
class AuthenticateResponseDTO {
  @JsonKey(name: "token")
  final String token;
  final String status;
  @JsonKey(name: "data")
  final UserDTO user;

  @JsonKey(name: "expiresIn", fromJson: _fromJson, toJson: _toJson)
  final DateTime expiryDate;

  static DateTime _fromJson(num timestamp) {
    var date = DateTime.fromMicrosecondsSinceEpoch(timestamp.toInt() * 1000);
    return date;
  }

  String? get validToken {
    if (expiryDate.isAfter(DateTime.now())) {
      return token;
    }
    return null;
  }

  static String _toJson(DateTime date) {
    final remaingSeconds = date.second;
    return "$remaingSeconds";
  }

  AuthenticateResponseDTO({
    required this.token,
    required this.expiryDate,
    required this.user,
    required this.status,
  });

  factory AuthenticateResponseDTO.fromJson(Map<String, dynamic> json) {
    return _$AuthenticateResponseDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthenticateResponseDTOToJson(this);
}
