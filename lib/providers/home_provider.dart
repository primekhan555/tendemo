
import 'package:flutter/cupertino.dart';

import '../api_resources/api_services/api_response.dart';
import '../api_resources/base_repo/base_repo.dart';
import '../core/core.dart';

class HomeProvider extends ChangeNotifier with BaseRepo {
  ApiResponse _airlineRes = ApiResponse.loading('message');
  ApiResponse get airlineRes => _airlineRes;
  
  getAirline() async {
    _airlineRes = await homeRepo.getUser();
    notifyListeners();
    console('PROVIDERR : ${_airlineRes.status}');
  }
}
