import 'package:delivery_pda/data/storage/auth/auth_holder.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final PdaHolder _authData;

  AuthInterceptor(this._authData);
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_authData.token.isNotEmpty == true) {
      options.headers['Authorization'] = 'Bearer ${_authData.token}';
    }
    Get.log("Data in interceptor${options.data}");
    Get.log("Extra in interceptor${options.extra}");
    Get.log("QueryParams in interceptor${options.queryParameters}");
    Get.log("content in interceptor${options.contentType}");
    Get.log("headers in interceptor${options.headers}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    Get.log("Response in interceptor ${handler.toString()} : $response");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    Get.log("Error in interceptor ${handler.toString()} : ${err.requestOptions}");
    super.onError(err, handler);
  }
}
