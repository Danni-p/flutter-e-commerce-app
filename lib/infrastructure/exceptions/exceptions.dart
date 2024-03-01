import 'package:flutter_e_commerce_app/utils/constants/texts.dart';

class DCacheException implements Exception{
  final String? msg;

  DCacheException({this.msg});

  String get message => msg ?? DTexts.cacheException;
}

class DAuthException implements Exception {
  final String? msg;

  DAuthException({this.msg});

  String get message => msg ?? DTexts.authException;
}

class DPostgresException implements Exception {
  final String? msg;

  DPostgresException({this.msg});

  String get message => msg ?? DTexts.postgresException;
}

class DUnknownException implements Exception {
  final String? msg;

  DUnknownException({this.msg});

  String get message => msg ?? DTexts.unknownException;
}