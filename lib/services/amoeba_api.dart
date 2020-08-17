import 'package:coding_blocks_junior/config.dart';
import 'package:dio/dio.dart';

class AmoebaApiService {
  Dio dio;

  AmoebaApiService() {
    dio = new Dio(BaseOptions(
      baseUrl: config['api']['url'],
    ));
  }
}
