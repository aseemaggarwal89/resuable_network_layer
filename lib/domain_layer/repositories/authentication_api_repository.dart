import '../domain_layer.dart';
import '../models/authenticate_response_dto.dart';

abstract class IAuthenticationAPIRepository {
  Future<ApiResult<AuthenticateResponseDTO>> loginUser(
      LoginUserDTO loginUserDTO) async {
    throw UnimplementedError();
  }
}
