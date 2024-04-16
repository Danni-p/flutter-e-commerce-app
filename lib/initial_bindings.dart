import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/domain/repositories/banner_repository.dart';
import 'package:flutter_e_commerce_app/domain/repositories/category_repository.dart';
import 'package:flutter_e_commerce_app/domain/repositories/user_repository.dart';
import 'package:flutter_e_commerce_app/features/personalization/controller/personalization/user_data_controller.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_device_storage.dart';
import 'package:flutter_e_commerce_app/infrastructure/repositories/auth_repository_impl.dart';
import 'package:flutter_e_commerce_app/infrastructure/repositories/banner_repository_impl.dart';
import 'package:flutter_e_commerce_app/infrastructure/repositories/category_repository_impl.dart';
import 'package:flutter_e_commerce_app/infrastructure/repositories/user_repository_impl.dart';
import 'package:flutter_e_commerce_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    //! Local Device Storage
  Get.lazyPut<LocalDeviceStorage>(() => LocalDeviceStorageImpl(deviceStorage: GetStorage()), fenix: true);

  //! Supabase Backend Client
  Get.lazyPut(() => Supabase.instance.client, fenix: true);

  //! Repositories
  // can not be put lazily because the onReady method has to be triggered immediatly after this init method
  Get.put<AuthRepository>(AuthRepositoryImpl(localDeviceStorage: Get.find(), supabaseClient: Get.find()), permanent: true);
  Get.lazyPut<UserRepository>(() => UserRepositoryImpl(supabaseClient: Get.find()), fenix: true);
  Get.lazyPut<CategoryRepository>(() => CategoryRepositoryImpl(supabaseClient: Get.find()), fenix: true);
  Get.lazyPut<BannerRepository>(() => BannerRepositoryImpl(supabaseClient: Get.find()), fenix: true);

  //! Global Controllers
  // Controllers that not just exist for a single screen but for the lifecycle of the whole app
  Get.lazyPut<UserDataController>(() => UserDataController(authRepository: Get.find(), userRepository: Get.find()), fenix: true);

  //! Helpers
  Get.lazyPut(() => NetworkManager(), fenix: true);
  }
}
