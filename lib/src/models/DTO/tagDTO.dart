class TagDTO {
  String id;
  String name;

  TagDTO({this.id, this.name});

  factory TagDTO.fromJson(Map<String, dynamic> json) {
    return TagDTO(id: json['id'], name: json['name']);
  }
}
