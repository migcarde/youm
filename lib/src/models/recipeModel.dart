class RecipeModel {
    String id;
    String title;
    int calories;
    int proteins;
    int sodium;
    double rating;
    List<String> ingredients;
    List<String> directions;
    List<String> categories;
    String description;

    RecipeModel({
        this.id,
        this.title,
        this.calories,
        this.proteins,
        this.sodium,
        this.rating,
        this.ingredients,
        this.directions,
        this.categories,
        this.description,
    });

    factory RecipeModel.fromJson(Map<String, dynamic> json) {
      return RecipeModel(
        id: json['id'],
        title: json['title'],
        calories: json['calories'],
        proteins: json['proteins'],
        sodium: json['sodium'],
        rating: json['rating'].toDouble(),
        ingredients: json['ingredients'].cast<String>(),
        directions: json['directions'].cast<String>(),
        categories: json['categories'].cast<String>(),
        description: json['description']
      );
    }
}