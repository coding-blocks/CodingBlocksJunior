import 'package:coding_blocks_junior/config.dart';
import 'package:dio/dio.dart';

class AmoebaApiService {
  Dio dio;

  AmoebaApiService () {
    print(config['api']['url']);
    dio = new Dio(BaseOptions(
      baseUrl: config['api']['url'],

    ));
  }
}