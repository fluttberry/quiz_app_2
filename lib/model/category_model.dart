import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  List<CategoryItemModel> triviaCategories;
  CategoryModel({required this.triviaCategories});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'trivia_categories': triviaCategories.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      triviaCategories: List<CategoryItemModel>.from(
        (map['trivia_categories']).map<CategoryItemModel>(
          (x) => CategoryItemModel.fromMap(x as Map<String,dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) {
    return CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}

class CategoryItemModel {
  int id;
  String name;
  CategoryItemModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name};
  }

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(id: map['id'] as int, name: map['name'] as String);
  }

  String toJson() => json.encode(toMap());

  factory CategoryItemModel.fromJson(String source) =>
      CategoryItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
