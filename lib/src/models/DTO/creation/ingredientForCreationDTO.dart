class IngredientForCreationDTO {
  String name;
  double quantity;
  String unit;

  IngredientForCreationDTO(this.name, this.quantity, this.unit);

  IngredientForCreationDTO.create();

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'quantity': quantity, 'unit': unit};
}
