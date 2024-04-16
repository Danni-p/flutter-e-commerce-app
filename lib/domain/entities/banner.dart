class Banner {
  final int id;
  final String targetScreen;
  final String imageUrl;
  final bool active;

  Banner(
      {required this.targetScreen,
      required this.imageUrl,
      required this.active,
      required this.id});

  Banner copyWith(
      {int? id,
      String? targetScreen,
      String? imageUrl,
      bool? active}) {
    return Banner(
        id: id ?? this.id,
        targetScreen: targetScreen ?? this.targetScreen,
        imageUrl: imageUrl ?? this.imageUrl,
        active: active ?? this.active);
  }

  factory Banner.empty() =>
      Banner(id: -1, targetScreen: '', imageUrl: '', active: false);
}
