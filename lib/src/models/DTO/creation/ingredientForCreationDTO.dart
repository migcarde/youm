class IngredientForCreationDTO {
  String name;
  String quantity;

  IngredientForCreationDTO({this.name, this.quantity});

  Map<String, dynamic> toJson() => {'name': name, 'quantity': quantity};
}
