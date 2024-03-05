class DSupabaseAuthExceptionMapper {
  static Exception getException(String message) {
    if (message == "Email not confirmed") {
      return DEmailUnconfirmedException();
    } else {
      return DUnknownAuthException(message);
    }
  }
}

abstract class DSupabaseAuthException implements Exception {
  DSupabaseAuthException();

  String get message;
}

class DEmailUnconfirmedException implements DSupabaseAuthException {
  DEmailUnconfirmedException();

  @override
  String get message {
    return "The email is not confirmed yet.";
  }
}

class DNoEmailProvidedException implements DSupabaseAuthException {
  DNoEmailProvidedException();

  @override
  String get message {
    return "Unfortunatelly you have not provided an email!";
  }
}

class DUnknownAuthException implements DSupabaseAuthException {
  DUnknownAuthException(this.msg);

  final String msg;

  @override
  String get message => msg;
}
