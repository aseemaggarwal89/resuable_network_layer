import 'package:resuable_network_layer/data_layer/data_source/models/data_source.dart';
import 'package:resuable_network_layer/domain_layer/networkService/app_api_repository.dart';
import 'package:resuable_network_layer/domain_layer/repositories/api_repository.dart';
import 'package:resuable_network_layer/domain_layer/utils/api_result.dart';

import '../data_source/remote/app_api_request.dart';
import '../data_source/remote/app_api_request_type.dart';

class NetworkAPIRepository extends INetworkAPIRepository {
  final INetworkService networkManager;

  NetworkAPIRepository(this.networkManager);

  @override
  Future<ApiResult<T>> getDataAll<T>(APIRequestNodeType nodeType,
      {Map<String, dynamic>? param = const {}}) {
    final apiRequest = AppAPIRequest(
      ApiRequestType.getAll(nodeType: nodeType),
      queryParam: param,
    );

    return networkManager.loadRequest(apiRequest);
  }

  @override
  Future<ApiResult<T>> getDetailData<T>(APIRequestNodeType nodeType, String id) {
    final apiRequest = AppAPIRequest(
      ApiRequestType.getAll(nodeType: nodeType,
        path: '/$id',
      ),
    );

    return networkManager.loadRequest(apiRequest);
  }

    @override
  Future<ApiResult<T>> postData<T>(APIRequestNodeType nodeType,
      Map<String, dynamic> body, {String endpoint = ""}) async {
    final apiRequest = AppAPIRequest(ApiRequestType.postData(
      path: endpoint, nodeType: nodeType),
        body: body);

    return networkManager.loadRequest(apiRequest);
  }
}