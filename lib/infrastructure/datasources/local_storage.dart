import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:get_storage/get_storage.dart';

abstract class LocalStorage {
  static const isFirstTimeCache = 'IS_FIRST_TIME';

  // isFirstTime
  bool getCachedIsFirstTime();
  Future<void> cacheIsFirstTime({required bool flag, bool override = false});
}

class LocalStorageImpl implements LocalStorage {
  final GetStorage deviceStorage;

  LocalStorageImpl({required this.deviceStorage});

  @override
  Future<void> cacheIsFirstTime(
      {required bool flag, bool override = false}) async {
    return override
        ? await deviceStorage.write(LocalStorage.isFirstTimeCache, flag)
        : await deviceStorage.writeIfNull(LocalStorage.isFirstTimeCache, flag);
  }

  @override
  bool getCachedIsFirstTime() {
    final isFirstTime = deviceStorage.read(LocalStorage.isFirstTimeCache);

    if (isFirstTime == null) {
      throw CacheException();
    }

    return isFirstTime;
  }
}
