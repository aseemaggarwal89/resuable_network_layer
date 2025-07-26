import 'package:get_it/get_it.dart';
import '/domain_layer/repositories/api_repository.dart';
import '/domain_layer/usecases/getAll/cases/get_all_usecase.dart';
import '/domain_layer/usecases/postData/cases/post_data_usecase.dart';

import '../data_layer/data_layer.dart';
import 'app_configuration.dart';

export 'networkService/app_api_repository.dart';
export 'utils/utils.dart';
export 'app_configuration.dart';

export 'repositories/authentication_api_repository.dart';

export 'models/entities.dart';
export '../data_layer/data_source/models/data_source.dart';

export 'usecases/getAll/extension/get_all_usecase_extension.dart';

class DomainLayer {
  static Future<void> initializeDependencies(
      Environment environment, GetIt injector) async {
    injector.registerSingleton<AppConfiguration>(
        AppConfiguration(appEnv: environment));
    await DataLayer.initializeDataLayerDependencies(injector);

    injector.registerSingleton<IGetAllUseCaseUseCases>(
        GetAllUseCase(injector<INetworkAPIRepository>()));
    injector.registerSingleton<IPostDataUseCases>(
        PostDataUseCase(injector<INetworkAPIRepository>()));
  }
}
