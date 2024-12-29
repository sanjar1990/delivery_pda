import 'package:delivery_pda/data/server/auth_interceptor.dart';
import 'package:delivery_pda/domain/entities/login/login_request.dart';
import 'package:delivery_pda/domain/entities/login/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'api_constant.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(AuthInterceptor authInterceptor) {
    var options = BaseOptions(
        connectTimeout: const Duration(milliseconds: ApiConst.CONNECTION_TIME),
        sendTimeout: const Duration(milliseconds: ApiConst.SEND_TIME_OUT),
        baseUrl: ApiConst.Base_URl,
        headers: ApiConst.HEADERS);
    Dio dio = Dio(options);
    dio.interceptors
      ..add(authInterceptor)
      ..add(LogInterceptor(requestBody: true, responseBody: true));

    return _ApiService(dio);
  }


  @POST(ApiConst.LOGIN)
  Stream<LoginResponse> login(@Body() LoginRequest request);

}
