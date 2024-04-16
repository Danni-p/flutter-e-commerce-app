import 'package:flutter_e_commerce_app/domain/entities/category.dart';
import 'package:flutter_e_commerce_app/domain/repositories/category_repository.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final CategoryRepository categoryRepository;

  CategoryController({required this.categoryRepository});

  /// Variables
  final RxList<Category> allCategories = <Category>[].obs;
  final RxList<Category> featuredCategories = <Category>[].obs;
  final isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchCategories();
  }

  /// -- Load category data
  Future<void> fetchCategories() async {
    print('fetch categories');
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch categories from data source
      final categories = await categoryRepository.getAllCategories();
      // update the categories list
      allCategories.assignAll(categories);

      // filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId == null).take(8).toList());
    } catch (e) {
      print(e);
      DLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  /// -- Load selected category data

  /// -- Get Category or Sub-Category Products
}
