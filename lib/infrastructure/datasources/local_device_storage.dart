import 'package:flutter_e_commerce_app/infrastructure/exceptions/exceptions.dart';
import 'package:get_storage/get_storage.dart';


enum DefaultCacheType {
  boolean(true),
  string('');

  final dynamic value;
  const DefaultCacheType(this.value);
}

enum CacheKey {
  isFirstTime('IS_FIRST_TIME', DefaultCacheType.boolean),
  rememberMeEmail('REMEMBER_ME_EMAIL', DefaultCacheType.string),
  rememberMePassword('REMEMBER_ME_PASSWORD', DefaultCacheType.string);

  final String key;
  final DefaultCacheType type;
  const CacheKey(this.key, this.type);
}

abstract class LocalDeviceStorage {
  T? getCachedValue<T>(CacheKey cacheKey);
  Future<void> cacheValue(
      {required CacheKey cacheKey,
      required dynamic value,
      bool override = false});
  Future<void> deleteValue(CacheKey cacheKey);
}

class LocalDeviceStorageImpl implements LocalDeviceStorage {
  final GetStorage deviceStorage;

  LocalDeviceStorageImpl({required this.deviceStorage});

  @override
  Future<void> cacheValue(
      {required CacheKey cacheKey,
      required dynamic value,
      bool override = false}) async {
    checkType(cacheKey, value);
    override
        ? await deviceStorage.write(cacheKey.key, value)
        : await deviceStorage.writeIfNull(cacheKey.key, value);
  }

  @override
  T? getCachedValue<T>(CacheKey cacheKey) {
    if (cacheKey.type.value is! T) {
      throw DCacheException();
    }

    return deviceStorage.read(cacheKey.key);
  }

  @override
  Future<void> deleteValue(CacheKey cacheKey) async {
    await deviceStorage.remove(cacheKey.key);
  }
  
  void checkType(CacheKey cacheKey, value) {
    if (cacheKey.type.value is String && value is String) {
      return;
    } else if (cacheKey.type.value is bool && value is bool) {
      return;
    } else {
      throw DCacheException();
    }
  }
}
