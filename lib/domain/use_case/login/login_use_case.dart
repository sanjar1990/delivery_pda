import 'package:delivery_pda/data/server/api/api_service.dart';
import 'package:delivery_pda/domain/data/result/result.dart';
import 'package:delivery_pda/domain/entities/login/login_request.dart';
import 'package:delivery_pda/domain/entities/login/login_response.dart';
import 'package:rxdart/rxdart.dart';
import 'package:delivery_pda/data/server/error_parser.dart';

class LoginUseCase {
  final ApiService _service;

  LoginUseCase(this._service);

  Stream<Result<LoginResponse>> invoke(LoginRequest request) => _service
      .login(request)
      .map((response) {
        return Result.content(response);
      })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
