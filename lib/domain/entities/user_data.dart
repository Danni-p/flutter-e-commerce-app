import 'package:flutter_e_commerce_app/utils/formatters/formatter.dart';

class UserData {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  UserData(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture,
      required this.id});

  UserData copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? username,
      String? email,
      String? phoneNumber,
      String? profilePicture}) {
    return UserData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        profilePicture: profilePicture ?? this.profilePicture);
  }

  String get formattedPhoneNumber => DFormatter.formatPhoneNumber(phoneNumber);

  factory UserData.empty() => UserData(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  String get fullName => '$firstName $lastName';
}
