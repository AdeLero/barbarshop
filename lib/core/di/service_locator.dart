import 'package:barbar_shop/core/services/services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  if (!getIt.isRegistered<NavigationService>()) {
    getIt.registerLazySingleton<NavigationService>(NavigationService.new);
  }
}
