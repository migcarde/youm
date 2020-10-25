import 'package:json_annotation/json_annotation.dart';
part 'ingredientDTO.g.dart';

@JsonSerializable()
class IngredientDTO {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'quantity')
  int quantity;

  IngredientDTO({this.id, this.name, this.quantity});

  factory IngredientDTO.fromJson(Map<String, dynamic> json) =>
      _$IngredientDTOFromJson(json);
}
