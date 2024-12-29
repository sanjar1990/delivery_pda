
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  String? token;
  String? tokeType;

  LoginData(this.token, this.tokeType);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
  _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}


