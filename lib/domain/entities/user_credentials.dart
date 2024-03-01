class UserCredentials {
  final String id;

  UserCredentials({required this.id});

  factory UserCredentials.empty() {
    return UserCredentials(id: '');
  }

  UserCredentials copyWith({String? id}) {
    return UserCredentials(id: id ?? this.id);
  }
}
