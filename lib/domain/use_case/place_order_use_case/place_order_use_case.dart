import 'package:delivery_pda/data/server/api/api_service.dart';
import 'package:delivery_pda/domain/data/result/result.dart';
import 'package:delivery_pda/domain/entities/place_order/place_order_request.dart';
import 'package:delivery_pda/domain/entities/place_order/place_order_response.dart';
import 'package:rxdart/rxdart.dart';
import 'package:delivery_pda/data/server/error_parser.dart';

class PlaceOrderUseCase {
  final ApiService _service;

  PlaceOrderUseCase(this._service);

  Stream<Result<PlaceOrderResponse>> invoke(PlaceOrderRequest request) => _service
      .placingOrder(request)
      .map((response) {
    return Result.content(response);
  })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
