// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonData _$JsonDataFromJson(Map<String, dynamic> json) => JsonData(
  type: json['type'] as String,
  flex: (json['flex'] as num).toInt(),
  data: json['data'],
  children:
      (json['children'] as List<dynamic>)
          .map((e) => JsonData.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$JsonDataToJson(JsonData instance) => <String, dynamic>{
  'type': instance.type,
  'flex': instance.flex,
  'data': instance.data,
  'children': instance.children,
};

MediaData _$MediaDataFromJson(Map<String, dynamic> json) => MediaData(
  type: json['type'] as String,
  ext: json['ext'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$MediaDataToJson(MediaData instance) => <String, dynamic>{
  'type': instance.type,
  'ext': instance.ext,
  'value': instance.value,
};
