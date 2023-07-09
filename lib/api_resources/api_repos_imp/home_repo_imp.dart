import 'dart:convert';
import 'dart:isolate';

import 'package:http/http.dart';

import '../../constants/app_api_paths.dart';
import '../../core/app_print.dart';
import '../../core/boxes/data_boxes.dart';
import '../api_models/photos_model.dart';
import '../api_repos_abstract/home_repo.dart';
import '../api_services/api_response.dart';
import '../api_services/handling_response.dart';

class HomeRepoImp extends HomeRepo {
  @override
  Future<ApiResponse> getUser({bool allowLocalSaveAndGet = false}) async {
    try {
      Response res = await apiServices.get(AppApiPaths.passengers);
      ApiResponse result = HandlingResponse.returnResponse(res);
      console('REPO : ${result.status}');
      if (result.status == Status.completed) {
        List<PhotosModel> data = await Isolate.run(() => List<PhotosModel>.from(
            json.decode(res.body).map((x) => PhotosModel.fromJson(x))));
        // List<PhotosModel> data = List<PhotosModel>.from(
        //     json.decode(res.body).map((x) => PhotosModel.fromJson(x)));
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
        List<PhotosModel> data = await Isolate.run(() => List<PhotosModel>.from(
            json.decode(response.data).map((x) => PhotosModel.fromJson(x))));
        // List<PhotosModel> data = List<PhotosModel>.from(
        //     json.decode(response.data).map((x) => PhotosModel.fromJson(x)));
        return ApiResponse.completed(data);
      } else {
        return response;
      }
    }
  }
}
