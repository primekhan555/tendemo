import 'package:get_it/get_it.dart';
import 'package:tendemo/api_resources/api_repos_abstract/watch_repo.dart';

import '../api_resources/api_repos_abstract/home_repo.dart';
import '../api_resources/api_repos_imp/home_repo_imp.dart';
import '../api_resources/api_repos_imp/watch_repo_imp.dart';
import '../api_resources/api_services/api_services.dart';

GetIt getIt = GetIt.instance;

class DI {
  static Future<void> initDI() async {
    getIt.registerLazySingleton<ApiServices>(() => ApiServices());
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImp());
    getIt.registerLazySingleton<WatchRepo>(() => WatchRepoImp());

    // getIt.registerSingleton<HomeRepo>(HomeRepoImp());
    await getIt.allReady();
  }
}
