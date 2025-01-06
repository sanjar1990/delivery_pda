import 'package:delivery_pda/data/server/api/api_service.dart';
import 'package:delivery_pda/domain/data/result/result.dart';
import 'package:delivery_pda/domain/entities/bring_courier/bring_courier_request.dart';
import 'package:delivery_pda/domain/entities/bring_courier/bring_courier_response.dart';
import 'package:rxdart/rxdart.dart';
import 'package:delivery_pda/data/server/error_parser.dart';

class BringCourierUseCase {
  final ApiService _service;

  BringCourierUseCase(this._service);

  Stream<Result<BringCourierResponse>> invoke(BringCourierRequest request) => _service
      .bringCourier(request)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
