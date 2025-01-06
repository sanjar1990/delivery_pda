// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderResponse _$PlaceOrderResponseFromJson(Map<String, dynamic> json) =>
    PlaceOrderResponse(
      (json['ret'] as num?)?.toInt(),
      json['msg'] as String?,
      json['data'],
    );

Map<String, dynamic> _$PlaceOrderResponseToJson(PlaceOrderResponse instance) =>
    <String, dynamic>{
      'ret': instance.ret,
      'msg': instance.msg,
      'data': instance.data,
    };
