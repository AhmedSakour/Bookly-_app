import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServices {
  final String _baseUrl = '${dotenv.env['base_url']}';
  final Dio dio;
  ApiServices(this.dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get(
      '$_baseUrl$endPoint',
    );
    return response.data;
  }
}
