import 'package:json_annotation/json_annotation.dart';

part 'json_model.g.dart';

@JsonSerializable()
class JsonData {
  final String type;
  final int flex;
  final dynamic data;
  final List<JsonData> children;

  JsonData({
    required this.type,
    required this.flex,
    this.data,
    required this.children,
  });

  factory JsonData.fromJson(Map<String, dynamic> json) =>
      _$JsonDataFromJson(json);
}

@JsonSerializable()
class MediaData {
  final String type;
  final String ext;
  final String value;

  MediaData({required this.type, required this.ext, required this.value});

  factory MediaData.fromJson(Map<String, dynamic> json) =>
      _$MediaDataFromJson(json);
}