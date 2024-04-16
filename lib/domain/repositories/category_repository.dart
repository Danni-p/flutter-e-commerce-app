import 'package:flutter_e_commerce_app/domain/entities/category.dart';
import 'package:get/get.dart';

abstract class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  Future<List<Category>> getAllCategories();
}
