// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bring_courier_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BringCourierResponse _$BringCourierResponseFromJson(
        Map<String, dynamic> json) =>
    BringCourierResponse(
      (json['ret'] as num?)?.toInt(),
      json['msg'] as String?,
      json['data'],
    );

Map<String, dynamic> _$BringCourierResponseToJson(
        BringCourierResponse instance) =>
    <String, dynamic>{
      'ret': instance.ret,
      'msg': instance.msg,
      'data': instance.data,
    };
