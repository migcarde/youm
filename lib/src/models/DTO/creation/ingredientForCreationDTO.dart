class IngredientForCreationDTO {
  String name;
  int quantity;

  IngredientForCreationDTO({this.name, this.quantity});

  Map<String, dynamic> toJson() => {'name': name, 'quantity': quantity};
}
