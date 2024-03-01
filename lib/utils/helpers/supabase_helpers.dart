import 'package:supabase_flutter/supabase_flutter.dart';

extension SupabaseHelpers on SupabaseClient {
  SupabaseQueryBuilder profilesCollection() {
    return Supabase.instance.client.from("profiles");
  }
} 
 /*extension SupabaseHelpers on SupabaseClient {
  Future<void> userDocument() async {
    final userOption = serviceLocator<AuthRepository>().getLoggedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    // return Supabase.instance.client.from("user");
  }
} 

extension DocumentReferenceExt on DocumentReference {
  CollectionReference<Map<String,dynamic>> get memberCollection => collection("members"); 
  CollectionReference<Map<String,dynamic>> get itemCollection => collection("items"); 
}*/
