
import 'package:resuable_network_layer/data_layer/data_source/mapper/JsonSerializable.dart';

import '../domain_layer.dart';

class GetBrandsResponse extends GetBaseResponseDTO<BrandDTO> {
  GetBrandsResponse(results, data, status)
      : super(status: status, results: results, data: data);

  factory GetBrandsResponse.fromJson(Map<String, dynamic> json) {
    final data = GetBaseResponseDTO.fromJson(
        json, (json) => BrandDTO.fromJson(json as Map<String, dynamic>));
    return GetBrandsResponse(data.results, data.data, data.status);
  }
  
  @override
  GetBrandsResponse fromJson(Map<String, dynamic> json) {
      GetBrandsResponse.fromJson(json);
      return this;
  }
}
