class Category {
  final int id;
  final String name;
  final String image;
  final int? parentId;
  final bool isFeatured;

  Category(
      {required this.name,
      required this.image,
      this.parentId,
      required this.isFeatured,
      required this.id});

  Category copyWith(
      {int? id,
      String? name,
      String? image,
      int? parentId,
      bool? isFeatured}) {
    return Category(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        parentId: parentId ?? this.parentId,
        isFeatured: isFeatured ?? this.isFeatured);
  }

  factory Category.empty() =>
      Category(id: -1, name: '', image: '', isFeatured: false);
}
