import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/domain/repositories/user_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/datasources/local_device_storage.dart';
import 'package:flutter_e_commerce_app/infrastructure/repositories/auth_repository_impl.dart';
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

  //! Helpers
  Get.lazyPut(() => NetworkManager(), fenix: true);
  }
}
