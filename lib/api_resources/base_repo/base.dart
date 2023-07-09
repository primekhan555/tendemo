import 'package:tendemo/api_resources/api_services/api_services.dart';
import 'package:tendemo/di/di.dart';

class Base {
  final ApiServices _apiServices = getIt.get<ApiServices>();
  ApiServices get apiServices =>_apiServices;
}
