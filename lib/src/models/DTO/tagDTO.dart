import 'package:json_annotation/json_annotation.dart';
part 'tagDTO.g.dart';

@JsonSerializable()
class TagDTO {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;

  TagDTO({this.id, this.name});

  factory TagDTO.fromJson(Map<String, dynamic> json) => _$TagDTOFromJson(json);
}
