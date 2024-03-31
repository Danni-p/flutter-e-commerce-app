import 'package:supabase_flutter/supabase_flutter.dart';

extension EdgeFunctionsExtensions on FunctionsClient {
  Future<FunctionResponse> deleteAccount() => invoke('delete-user-account');
}
