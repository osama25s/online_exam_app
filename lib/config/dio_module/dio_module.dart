import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:online_exam_app/core/constants/api_constants.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
}
