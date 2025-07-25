import 'package:get_it/get_it.dart';
import '/data_layer/api_repository/api_repository.dart';
import '/data_layer/data_source/remote/app_base_api_client.dart';
import '/data_layer/networkLayer/appnetworking/networkClient/http_client.dart';
import '/domain_layer/repositories/api_repository.dart';

import '../domain_layer/domain_layer.dart';

export 'networkLayer/appnetworking/api_contants.dart';
export 'data_source/models/data_source.dart';

class DataLayer {
  static Future<void> initializeDataLayerDependencies(GetIt injector) async {
    injector.registerSingleton<IAppHttpClient>(AppHttpClient());
    injector.registerLazySingleton<INetworkService>(() {
      return AppAPIClient(injector(), injector<AppConfiguration>().appURLs);
    });

    // API
    injector.registerFactory<INetworkAPIRepository>(
        () => NetworkAPIRepository(injector()));
  }
}
