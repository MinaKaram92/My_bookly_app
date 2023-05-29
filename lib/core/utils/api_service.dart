import 'package:bookly_app/core/error_handling/exceptions.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'www.googleapis.com';

  Future<http.Response> getData(Map<String, dynamic> params) async {
    var uri = Uri.https(
      baseUrl,
      '/books/v1/volumes',
      params,
    );
    var response = await http.get(uri);
    if (response.statusCode != 200) {
      _returnResponse(response.statusCode);
    }
    return response;
  }

  dynamic _returnResponse(int statusCode) {
    switch (statusCode) {
      case 400:
        throw BadRequestException();
      case 401:
      case 403:
        throw UnauthorisedException();
      case 500:
      default:
        throw FetchDataException();
    }
  }
}
