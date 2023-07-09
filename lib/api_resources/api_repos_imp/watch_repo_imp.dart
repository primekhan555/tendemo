import 'dart:convert';
import 'dart:isolate';

import 'package:http/http.dart';
import 'package:tendemo/api_resources/api_models/movie_detail_model.dart';
import 'package:tendemo/api_resources/api_models/movie_images_model.dart';
import 'package:tendemo/api_resources/api_models/movie_videos_model.dart';
import 'package:tendemo/api_resources/api_models/up_coming_movie_model.dart';

import '../../constants/app_api_paths.dart';
import '../../core/app_print.dart';
import '../../core/boxes/data_boxes.dart';
import '../api_repos_abstract/watch_repo.dart';
import '../api_services/api_response.dart';
import '../api_services/handling_response.dart';

class WatchRepoImp extends WatchRepo {
  @override
  Future<ApiResponse> getUpComingMovie(
      {bool allowLocalSaveAndGet = false}) async {
    try {
      Response res = await apiServices.get(AppApiPaths.upcoming);
      ApiResponse result = HandlingResponse.returnResponse(res);
      console('REPO : ${result.status}');
      if (result.status == Status.completed) {
        UpComingMoviesModel data = await Isolate.run(
            () => UpComingMoviesModel.fromJson(json.decode(res.body)));
      console('REPO : parsing complete');

        if (allowLocalSaveAndGet) {
          DataBoxes.ins.setData(AppApiPaths.upcoming, res.body);
        }
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } catch (w) {
      console('REPO : parsing error $w');

      ApiResponse response = HandlingResponse.returnException(w,
          localDataKey: AppApiPaths.upcoming,
          loadOfflineData: allowLocalSaveAndGet);
      if (response.status == Status.completed) {
        UpComingMoviesModel data = await Isolate.run(
            () => UpComingMoviesModel.fromJson(json.decode(response.data)));
        return ApiResponse.completed(data);
      } else {
        return response;
      }
    }
  }

  @override
  Future<ApiResponse> getMovieDetail(
      {required String id, bool allowLocalSaveAndGet = false}) async {
    try {
      Response res = await apiServices.get(AppApiPaths.movieDetail(id));
      ApiResponse result = HandlingResponse.returnResponse(res);
      console('REPO : ${result.status}');
      if (result.status == Status.completed) {
        MovieDetailModel data = await Isolate.run(
            () => MovieDetailModel.fromJson(json.decode(res.body)));
        if (allowLocalSaveAndGet) {
          DataBoxes.ins.setData(AppApiPaths.passengers, res.body);
        }
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } catch (w) {
      ApiResponse response = HandlingResponse.returnException(w,
          localDataKey: AppApiPaths.passengers,
          loadOfflineData: allowLocalSaveAndGet);
      if (response.status == Status.completed) {
        UpComingMoviesModel data = await Isolate.run(
            () => UpComingMoviesModel.fromJson(json.decode(response.data)));
        return ApiResponse.completed(data);
      } else {
        return response;
      }
    }
  }

  @override
  Future<ApiResponse> getMovieImages(
      {required String id, bool allowLocalSaveAndGet = false}) async {
    try {
      Response res = await apiServices.get(AppApiPaths.movieImages(id));
      ApiResponse result = HandlingResponse.returnResponse(res);
      console('REPO : ${result.status}');
      if (result.status == Status.completed) {
        MovieImagesModel data = await Isolate.run(
            () => MovieImagesModel.fromJson(json.decode(res.body)));
        if (allowLocalSaveAndGet) {
          DataBoxes.ins.setData(AppApiPaths.passengers, res.body);
        }
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } catch (w) {
      ApiResponse response = HandlingResponse.returnException(w,
          localDataKey: AppApiPaths.passengers,
          loadOfflineData: allowLocalSaveAndGet);
      if (response.status == Status.completed) {
        UpComingMoviesModel data = await Isolate.run(
            () => UpComingMoviesModel.fromJson(json.decode(response.data)));
        return ApiResponse.completed(data);
      } else {
        return response;
      }
    }
  }

  @override
  Future<ApiResponse> getMovieVideos(
      {required String id, bool allowLocalSaveAndGet = false}) async {
    try {
      Response res = await apiServices.get(AppApiPaths.movieVideos(id));
      ApiResponse result = HandlingResponse.returnResponse(res);
      console('REPO : ${result.status}');
      if (result.status == Status.completed) {
        MovieVideosModel data = await Isolate.run(
            () => MovieVideosModel.fromJson(json.decode(res.body)));
        if (allowLocalSaveAndGet) {
          DataBoxes.ins.setData(AppApiPaths.passengers, res.body);
        }
        return ApiResponse.completed(data);
      } else {
        return result;
      }
    } catch (w) {
      ApiResponse response = HandlingResponse.returnException(w,
          localDataKey: AppApiPaths.passengers,
          loadOfflineData: allowLocalSaveAndGet);
      if (response.status == Status.completed) {
        UpComingMoviesModel data = await Isolate.run(
            () => UpComingMoviesModel.fromJson(json.decode(response.data)));
        return ApiResponse.completed(data);
      } else {
        return response;
      }
    }
  }
}
