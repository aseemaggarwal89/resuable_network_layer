import 'package:resuable_network_layer/domain_layer/usecases/getAll/cases/get_all_usecase.dart';
import 'package:resuable_network_layer/locator.dart';

abstract class GetAllUseCaseInjection {}

extension GetAllUseCaseInjectionExtension on GetAllUseCaseInjection {
  IGetAllUseCaseUseCases get getAllDataUseCase {
    return injector<IGetAllUseCaseUseCases>();
  }
}
