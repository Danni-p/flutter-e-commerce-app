import 'package:flutter_e_commerce_app/domain/entities/user_data.dart';
import 'package:get/get.dart';

class UserDataModel {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? profilePicture;

  UserDataModel(
      {required this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.phoneNumber,
      this.profilePicture});

  UserDataModel copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? username,
      String? email,
      String? phoneNumber,
      String? profilePicture}) {
    return UserDataModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        profilePicture: profilePicture ?? this.profilePicture);
  }

  factory UserDataModel.empty() => UserDataModel(id: '');

  Map<String, dynamic> toJson() {

    Map<String, dynamic> json = {};
    json.addIf(firstName != null, 'first_name', firstName);
    json.addIf(lastName != null, 'last_name', lastName);
    json.addIf(username != null, 'username', username);
    json.addIf(email != null, 'email', email);
    json.addIf(phoneNumber != null, 'phone_number', phoneNumber);
    json.addIf(profilePicture != null, 'profile_picture', profilePicture);

    return json;
  }

  String get fullName => '$firstName $lastName';

  factory UserDataModel.fromJson(Map<String, dynamic> userRecord) {
    return UserDataModel(
        firstName: userRecord['first_name'],
        lastName: userRecord['last_name'],
        username: userRecord['username'],
        email: userRecord['email'],
        phoneNumber: userRecord['phone_number'],
        profilePicture: userRecord['profile_picture'],
        id: userRecord['id']);
  }

  UserData toDomain() {
    return UserData(
        id: id,
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        username: username ?? '',
        email: email ?? '',
        phoneNumber: phoneNumber ?? '',
        profilePicture: profilePicture ?? '');
  }

  factory UserDataModel.fromDomain(UserData userData) => UserDataModel(
        id: userData.id,
        firstName: userData.firstName,
        lastName: userData.lastName,
        username: userData.username,
        email: userData.email,
        phoneNumber: userData.phoneNumber,
        profilePicture: userData.profilePicture
      );

  
}
