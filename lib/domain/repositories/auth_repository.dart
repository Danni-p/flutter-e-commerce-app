import 'package:get/get.dart';

abstract class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();
}
