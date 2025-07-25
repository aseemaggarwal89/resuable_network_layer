import 'dart:async';

import 'package:resuable_network_layer/domain_layer/models/get_brand_response.dart';

import '/domain_layer/domain_layer.dart';
import '/domain_layer/repositories/api_repository.dart';


abstract class IGetAllUseCaseUseCases {
  Future<List<BrandDTO>> fetchAllBrandData();
}

class GetAllUseCase implements IGetAllUseCaseUseCases {
  final INetworkAPIRepository _networkAPIRepository;

  GetAllUseCase(
    this._networkAPIRepository,
  );

  @override
  Future<List<BrandDTO>> fetchAllBrandData() async {
    ApiResult<GetBrandsResponse> result =
        await _networkAPIRepository.getDataAll(APIRequestNodeType.brand);
    return result.when(
        success: (success) {
          if (success != null && success.status == "success") {
            return success.data ?? [];
          } else {
            return throw const NetworkExceptions.notFound("Data not available");
          }
        },
        failure: (failure) => throw failure);
  }
}
