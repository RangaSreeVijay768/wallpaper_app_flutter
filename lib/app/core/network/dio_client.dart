import 'package:basic/app/core/network/interceptors/dio_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@singleton
@Order(-1)
class DioClient {
  final dio = Dio();

  addInterceptors(InterceptorsWrapper interceptorsWrapper) {
    dio.interceptors.add(interceptorsWrapper);
  }
}

abstract class RestService {
  late DioClient dioClient;

  RestService() {
    this.dioClient = GetIt.instance<DioClient>();
    // this.dioClient.addInterceptors(EScaleInterceptors());
  }

  getDioClient() {
    return dioClient.dio;
  }
}
