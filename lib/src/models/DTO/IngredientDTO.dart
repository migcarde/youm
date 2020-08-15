class IngredientDTO {
  String id;
  String name;

  IngredientDTO({this.id, this.name});

  factory IngredientDTO.fromJson(Map<String, dynamic> json) {
    return IngredientDTO(id: json['id'], name: json['name']);
  }
}
