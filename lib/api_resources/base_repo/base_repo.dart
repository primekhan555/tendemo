import 'package:tendemo/api_resources/api_repos_abstract/watch_repo.dart';

import '../../di/di.dart';
import '../api_repos_abstract/home_repo.dart';

mixin BaseRepo {
  final HomeRepo _homeRepo = getIt.get<HomeRepo>();
  HomeRepo get homeRepo => _homeRepo;

    final WatchRepo _watchRepo = getIt.get<WatchRepo>();
  WatchRepo get watchRepo => _watchRepo;
}
