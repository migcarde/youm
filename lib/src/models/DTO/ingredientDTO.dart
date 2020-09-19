class IngredientDTO {
  String id;
  String name;
  String quantity;

  IngredientDTO({this.id, this.name, this.quantity});

  factory IngredientDTO.fromJson(Map<String, dynamic> json) {
    return IngredientDTO(
        id: json['id'], name: json['name'], quantity: json['quantity']);
  }
}
