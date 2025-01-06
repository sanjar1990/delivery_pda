import 'package:freezed_annotation/freezed_annotation.dart';

part 'bring_courier_response.g.dart';

@JsonSerializable()
class BringCourierResponse {
  int? ret;
  String? msg;
  dynamic data;
  BringCourierResponse(this.ret, this.msg, this.data);

  factory BringCourierResponse.fromJson(Map<String, dynamic> json) =>
      _$BringCourierResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BringCourierResponseToJson(this);
}
