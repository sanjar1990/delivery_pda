// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      json['token'] as String?,
      json['tokeType'] as String?,
      (json['service_user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'token': instance.token,
      'tokeType': instance.tokeType,
      'service_user_id': instance.service_user_id,
    };
