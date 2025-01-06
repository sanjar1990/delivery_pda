import 'package:freezed_annotation/freezed_annotation.dart';

part 'bring_courier_request.g.dart';

@JsonSerializable()
class BringCourierRequest {
  List<Map<String,dynamic>>? orders;
  int? service_user_id;

  BringCourierRequest(this.orders, this.service_user_id);

  factory BringCourierRequest.fromJson(Map<String, dynamic> json) =>
      _$BringCourierRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BringCourierRequestToJson(this);
}
