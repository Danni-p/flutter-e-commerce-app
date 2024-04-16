import 'package:flutter_e_commerce_app/domain/entities/category.dart';
import 'package:flutter_e_commerce_app/domain/repositories/category_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/extensions/category_extensions.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final SupabaseClient supabaseClient;

  CategoryRepositoryImpl({required this.supabaseClient});

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      final categoriesJson = await supabaseClient.getAllCategories();

      return categoriesJson.map((cat) => CategoryModel.fromJson(cat).toDomain()).toList();
    } catch (e) {
      print(e);
      throw 'Something went wrong';
    }
  }


}
