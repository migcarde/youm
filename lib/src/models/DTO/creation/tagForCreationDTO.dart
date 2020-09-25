class TagForCreationDTO {
  String name;

  TagForCreationDTO({this.name});

  Map<String, dynamic> toJson() => {'name': name};
}
