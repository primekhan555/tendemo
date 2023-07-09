import 'package:tendemo/api_resources/base_repo/base.dart';

import '../api_services/api_response.dart';

abstract class WatchRepo extends Base {
  Future<ApiResponse> getUpComingMovie({bool allowLocalSaveAndGet = false});
  Future<ApiResponse> getMovieDetail({required String id,bool allowLocalSaveAndGet = false});
  Future<ApiResponse> getMovieImages({required String id,bool allowLocalSaveAndGet = false});
  Future<ApiResponse> getMovieVideos({required String id,bool allowLocalSaveAndGet = false});
}
