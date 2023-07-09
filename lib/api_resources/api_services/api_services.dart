import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../core/core.dart';
import '../../resources/app_data.dart';

class ApiServices {

  static const baseurl = 'https://api.themoviedb.org/3';
  static const apiKey = '88d354fe48ec5dbe2b5fef956bb6b55f';
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': ''
    // 'Authorization': 'Bearer 3|LxcCdpF1fIl0lnu9bFq37AIXfU8wCgyoBpZfAcNh'
  };
  String get _token => 'Bearer ${AppData.instance.token ?? ''}';

  /// This function is post raw application/json.
  /// This function uses [path] parameter which is the api path after base url.
  /// the [baseUrl] parameter is optional by default it will use the value which is set in this class. if you want to pass custom base url feel free to pass.
  /// the [body] parameter is Map<String, String> if there is no body fields then don't pass this parameters.
  Future<http.Response> post(String path, Map<String, String> body,
      {String baseUrl = baseurl}) async {
    headers['Authorization'] = _token;
    String wholeUrl = baseUrl + path;
    console("SERVICES :: URL : $wholeUrl");
    var request = http.MultipartRequest('POST', Uri.parse(wholeUrl));
    request.fields.addAll(body);
    request.headers.addAll(headers);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    console('SERVICES :: RESPONSE BODY : ${response.body}');
    console('SERVICES :: STATUS CODE : ${response.statusCode}');
    return response;
  }

  /// This function is Multipart form data.
  /// This function uses [path] parameter which is the api path after base url.
  /// the [baseUrl] parameter is optional by default it will use the value which is set in this class. if you want to pass custom base url feel free to pass.
  /// the [body] parameter is Map<String, String> if there is no body fields then don't pass this parameters.
  /// the [files] parameter is List<FileInfo> if there is no Files to send then don't pass this parameters.
  Future<http.Response> postMultipart(String path,
      {String baseUrl = baseurl,
      Map<String, String> body = const {},
      List<FileInfo> files = const []}) async {
    headers['Authorization'] = _token;
    String wholeUrl = baseUrl + path;
    console("SERVICES :: URL : $wholeUrl");
    var request = http.MultipartRequest('POST', Uri.parse(wholeUrl));
    request.fields.addAll(body);
    for (var file in files) {
      request.files
          .add(await http.MultipartFile.fromPath(file.fileKey, file.filepath));
    }
    request.headers.addAll(headers);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    console('SERVICES :: RESPONSE BODY : ${response.body}');
    console('SERVICES :: STATUS CODE : ${response.statusCode}');
    return response;
  }

  /// This function uses [path] parameter which is the api path after base url.
  /// the [baseUrl] parameter is optional by default it will use the value which is set in this class. if you want to pass custom base url feel free to pass.
  Future<http.Response> get(String path, {String baseUrl = baseurl}) async {
    headers['Authorization'] = _token;
    String wholeUrl = baseUrl + path;
    console("SERVICES :: URL : $wholeUrl");
    var request = http.Request('GET', Uri.parse("$wholeUrl?api_key=$apiKey"));
    request.headers.addAll(headers);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);
    console('SERVICES :: RESPONSE BODY : ${response.body}');
    console('SERVICES :: STATUS CODE : ${response.statusCode}');
    return response;
  }

  Future<Media> fileDownload(String path, String namewithExtension,
      {String baseUrl = baseurl, String folderName = "files"}) async {
    headers['Authorization'] = _token;
    String wholeUrl = baseUrl + path;
    http.Response response =
        await http.get(Uri.parse(wholeUrl), headers: headers);
    var documentDirectory = 
    // await getApplicationDocumentsDirectory();
    Platform.isAndroid?  Directory("/storage/emulated/0"):await getApplicationSupportDirectory();
    //;//await getExternalStorageDirectory();
    console(documentDirectory.path);
    var parent = "${documentDirectory.path}/TestingStandard";
    var filePathAndName = "$parent/$namewithExtension";
    console(parent);
    console('//////////////////////');
    console(filePathAndName);
    await Directory(parent).create(recursive: true);
    File file = File(filePathAndName);
    file.writeAsBytesSync(response.bodyBytes);
    console('$file');
    return Media(file, filePathAndName);
  }
}
