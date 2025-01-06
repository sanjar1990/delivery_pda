
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  String? token;
  String? tokeType;
  int? service_user_id;

  LoginData(this.token, this.tokeType, this.service_user_id);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
  _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}


