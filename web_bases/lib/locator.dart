import 'package:get_it/get_it.dart';
import 'package:web_bases/services/navigator_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigatorService());
}
