import 'package:basic/app/core/network/interceptors/dio_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@singleton
class ADioClient {
  final dio = Dio();

  addInterceptors(InterceptorsWrapper interceptorsWrapper) {
    dio.interceptors.add(interceptorsWrapper);
  }
}

abstract class RestService {
  late ADioClient dioClient;

  RestService() {
    this.dioClient = GetIt.instance<ADioClient>();
    // this.dioClient.addInterceptors(EScaleInterceptors());
  }

  getDioClient() {
    return dioClient.dio;
  }
}
