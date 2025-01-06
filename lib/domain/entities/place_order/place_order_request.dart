import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_order_request.g.dart';

@JsonSerializable()
class PlaceOrderRequest {
  List<Map<String,dynamic>>? orders;
  int? service_user_id;
  int? locker_cell_id;

  PlaceOrderRequest(this.orders, this.service_user_id, this.locker_cell_id);

  factory PlaceOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderRequestToJson(this);
}
