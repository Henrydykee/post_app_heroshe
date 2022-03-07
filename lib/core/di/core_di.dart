

import 'package:post_app_heroshe/core/platform/storage/secure_storage_impl.dart';

import '../data/memory/cache_helper.dart';
import '../data/network/network_config.dart';
import '../data/network/network_interceptor.dart';
import '../data/network/network_service.dart';
import '../data/network/network_service_impl.dart';
import '../platform/storage/secure_storage.dart';
import 'di_config.dart';

Future<void> coreInjector() async {
  inject.registerSingleton<SecuredStorage>(SecuredStorageImpl());
  // inject.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  // inject.registerSingleton<SentryManager>(SentryManager.instance);
  // inject.registerSingleton<FirebaseCloudMessagingManager>(FirebaseCloudMessagingManager.instance);
  // inject.registerSingleton<DeviceManager>(DeviceManager.instance);
  // inject.registerSingleton<RemoteConfigManager>(RemoteConfigManager.instance);
  // inject.registerSingleton<DeepLinkManager>(DeepLinkManager.instance);
  // inject.registerSingleton<SocketsManager>(SocketsManager.instance);

  inject.registerFactory<NetworkInterceptor>(
          () => NetworkInterceptor(networkConfigInterface: inject(), deviceManager:  inject()));
  inject.registerFactory<NetworkConfig>(() => NetworkConfigImpl());
  inject.registerLazySingleton<NetworkService>(() => NetworkServiceImpl(networkConfiguration: inject(), interceptor: inject()),
  );
  // inject.registerLazySingleton<LocalDatabaseConfig>(() => LocalDatabaseConfig());
  inject.registerLazySingleton<InMemory>(() => InMemory.instance);
}