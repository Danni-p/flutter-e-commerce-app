import 'package:flutter_e_commerce_app/domain/entities/category.dart';
import 'package:get/get.dart';

class CategoryModel {
  final int id;
  final String? name;
  final String? image;
  final int? parentId;
  final bool? isFeatured;

  CategoryModel(
      {required this.id,
      this.name,
      this.image,
      this.parentId,
      this.isFeatured});

  CategoryModel copyWith(
      {int? id,
      String? name,
      String? image,
      int? parentId,
      bool? isFeatured}) {
    return CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        parentId: parentId ?? this.parentId,
        isFeatured: isFeatured ?? this.isFeatured);
  }

  factory CategoryModel.empty() => CategoryModel(id: -1);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json.addIf(name != null, 'name', name);
    json.addIf(image != null, 'image', image);
    json.addIf(parentId != null, 'parent_id', parentId);
    json.addIf(isFeatured != null, 'is_featured', isFeatured);

    return json;
  }

  factory CategoryModel.fromJson(Map<String, dynamic> categoryRecord) {
    return CategoryModel(
        name: categoryRecord['name'],
        image: categoryRecord['image'],
        parentId: categoryRecord['parent_id'],
        isFeatured: categoryRecord['is_featured'],
        id: categoryRecord['id']);
  }

  Category toDomain() {
    return Category(
        id: id,
        name: name ?? '',
        image: image ?? '',
        parentId: parentId,
        isFeatured: isFeatured ?? false);
  }

  factory CategoryModel.fromDomain(Category category) => CategoryModel(
      id: category.id,
      name: category.name,
      image: category.image,
      parentId: category.parentId,
      isFeatured: category.isFeatured);
}
