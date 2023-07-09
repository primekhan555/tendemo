import 'package:flutter/cupertino.dart';
import 'package:tendemo/api_resources/api_models/movie_videos_model.dart'
    as movieModel;
import 'package:tendemo/api_resources/api_models/up_coming_movie_model.dart';

import '../api_resources/api_services/api_response.dart';
import '../api_resources/base_repo/base_repo.dart';
import '../core/core.dart';

enum AppBarState { normal, searchOpened, searchInit, searchSubmit }

class WatchProvider extends ChangeNotifier with BaseRepo {
  AppBarState _appBarState = AppBarState.normal;
  AppBarState get appBarState => _appBarState;
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
  List get filtered => _upComingList
      .where((element) => (element.title ?? '')
          .toLowerCase()
          .contains(_searchController.text.toLowerCase()))
      .toList();

  changeState(AppBarState state) {
    _appBarState = state;
    if (state == AppBarState.normal) {
      _searchController.clear();
    }
    notifyListeners();
  }

  onSearchValueChange(String value) {
    _appBarState == AppBarState.searchInit;
    notifyListeners();
  }

  ApiResponse _upComingRes = ApiResponse.loading('message');
  ApiResponse get upComingRes => _upComingRes;
  List<Results> _upComingList = [];
  ApiResponse _movieDetailRes = ApiResponse.loading('message');
  ApiResponse get movieDetailRes => _movieDetailRes;

  ApiResponse _movieImagesRes = ApiResponse.loading('message');
  ApiResponse get movieImagesRes => _movieImagesRes;

  ApiResponse _movieVideosRes = ApiResponse.loading('message');
  ApiResponse get movieVideosRes => _movieVideosRes;

  getUpComingMovie() async {
    _upComingRes = await watchRepo.getUpComingMovie();
    UpComingMoviesModel data = _upComingRes.data as UpComingMoviesModel;
    _upComingList = data.results ?? [];
    notifyListeners();
    console('PROVIDERR : ${_upComingRes.status}');
  }

  getMovieDetail(String id) async {
    _movieDetailRes=ApiResponse.loading('');
    notifyListeners();
    _movieDetailRes = await watchRepo.getMovieDetail(id: id);
    notifyListeners();
    console('PROVIDERR : ${_movieDetailRes.status}');
  }

  getMovieImages(String id) async {
    _movieImagesRes = await watchRepo.getMovieImages(id: id);
    notifyListeners();
    console('PROVIDERR : ${_movieImagesRes.status}');
  }


  getMovieVideos(String id) async {
    _movieVideosRes = await watchRepo.getMovieVideos(id: id);
    movieModel.MovieVideosModel data =
        _movieVideosRes.data as movieModel.MovieVideosModel;
    movieModel.Results? trailer =
        (data.results ?? []).firstWhere((element) => element.type == 'Trailer');
    if (trailer == null) {
      return (data.results!.first.key!);
    } else {
      return (trailer.key!);
    }
    console('PROVIDERR : ${_movieVideosRes.status}');
  }
}
