import 'package:flutter_e_commerce_app/utils/formatters/formatter.dart';

class UserDataModel {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  UserDataModel(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture,
      required this.id});

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

  get formattedPhoneNumber => DFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName(fullName) {
    final nameParts = UserDataModel.nameParts(fullName);
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = '$firstName$lastName';
    return 'cwt_$camelCaseUsername';
  }

  factory UserDataModel.empty() => UserDataModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String,dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "profile_picture": profilePicture
    };
  }

  /* factory UserDataModel.fromJson(Map<String, dynamic> userRecord) {

  } */

  /*UserData toDomain() {
    return UserCredential(
        id: UniqueId.fromUniqueString(id),
        firstName: firstName,
        lastName: lastName,
        username: username,
        deleted: deleted,
        amount: amount);
  }*/
}
