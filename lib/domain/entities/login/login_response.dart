import 'package:delivery_pda/domain/data/login_data/login_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  int? ret;
  String? msg;
  LoginData? data;
  LoginResponse(this.ret, this.msg, this.data);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
