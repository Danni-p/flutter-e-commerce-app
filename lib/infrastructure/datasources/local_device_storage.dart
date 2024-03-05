import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:get_storage/get_storage.dart';

abstract class LocalDeviceStorage {
  static const isFirstTimeCache = 'IS_FIRST_TIME';

  // isFirstTime
  bool getCachedIsFirstTime();
  /// only writes if not null
  Future<void> cacheIsFirstTime({required bool flag, bool override = false});
}

class LocalDeviceStorageImpl implements LocalDeviceStorage {
  final GetStorage deviceStorage;

  LocalDeviceStorageImpl({required this.deviceStorage});

  @override
  Future<void> cacheIsFirstTime(
      {required bool flag, bool override = false}) async {
    return override
        ? await deviceStorage.write(LocalDeviceStorage.isFirstTimeCache, flag)
        : await deviceStorage.writeIfNull(LocalDeviceStorage.isFirstTimeCache, flag);
  }

  @override
  bool getCachedIsFirstTime() {
    final isFirstTime = deviceStorage.read(LocalDeviceStorage.isFirstTimeCache);

    if (isFirstTime == null) {
      throw DCacheException();
    }

    return isFirstTime;
  }
}
