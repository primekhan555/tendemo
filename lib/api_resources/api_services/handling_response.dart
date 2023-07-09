import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/core.dart';
import 'api_response.dart';

class HandlingResponse {
  static ApiResponse returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ApiResponse.completed(response);
      case 400:
        return ApiResponse.error('Some Error Occured');
      case 401:
        return ApiResponse.unAuthorised('Un Authorized');
      case 403:
        return ApiResponse.error('Un Authorized');
      case 404:
        return ApiResponse.error('Un Authorized');
      case 500:
        return ApiResponse.error('Some Error Occured');
      default:
        return ApiResponse.error('Some Error Occured');
    }
  }

  static ApiResponse returnException(Object exception, {String? localDataKey,bool loadOfflineData=false}) {
    if (exception is SocketException) {
      if (loadOfflineData) {
        var data = DataBoxes.ins.getData(localDataKey ?? '');
        if (localDataKey == null && data == null) {
          return ApiResponse.noInternet('No Internet');
        } else {
          console('LOCAL DATA LOADED : KEY: $localDataKey ');
          return ApiResponse.completed(data);
        }
      } else {
        return ApiResponse.noInternet('No Internet');
      }
    } else if (exception is TimeoutException) {
      return ApiResponse.timeout('Timeout');
    } else {
      return ApiResponse.error('Some Error Occured');
    }
  }
}
