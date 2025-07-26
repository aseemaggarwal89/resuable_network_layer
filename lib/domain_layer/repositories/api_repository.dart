import '../domain_layer.dart';

abstract class INetworkAPIRepository {
  Future<ApiResult<T>> getDataAll<T>(APIRequestNodeType nodeType,
      {Map<String, dynamic>? param = const {}});
  Future<ApiResult<T>> getDetailData<T>(APIRequestNodeType nodeType, String id);
  Future<ApiResult<T>> postData<T>(
      APIRequestNodeType nodeType, Map<String, dynamic> body,
      {String endpoint = ""});
}

