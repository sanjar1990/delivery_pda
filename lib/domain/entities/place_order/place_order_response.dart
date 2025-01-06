import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_order_response.g.dart';

@JsonSerializable()
class PlaceOrderResponse {
  int? ret;
  String? msg;
  dynamic data;
  PlaceOrderResponse(this.ret, this.msg, this.data);

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderResponseToJson(this);
}
