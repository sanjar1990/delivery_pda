// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bring_courier_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BringCourierRequest _$BringCourierRequestFromJson(Map<String, dynamic> json) =>
    BringCourierRequest(
      (json['orders'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      (json['service_user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BringCourierRequestToJson(
        BringCourierRequest instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'service_user_id': instance.service_user_id,
    };
