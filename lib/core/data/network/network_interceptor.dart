
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../managers/device_manager.dart';
import 'network_config.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  NetworkConfig? networkConfigInterface;
  DeviceManager? deviceManager;

  /// NOTE: [networkConfigInterface] will be overwritten
  /// on each request. This is by design for now.
  NetworkInterceptor({this.networkConfigInterface, this.deviceManager});

  /// On request interception goes here
  /// Get token from storage
  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
   // TODO: SEAVE USER TOKEN
   // var authToken = await inject<SecuredStorage>().get(key: SecureStorageStrings.TOKEN) ?? "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final headers = {
     // "Authorization": "Bearer ${authToken}",
      "build_number": packageInfo.buildNumber,
      "os_type": deviceManager?.deviceModel?.os_type ?? "",
      "ip": deviceManager?.deviceModel?.ip ?? "",
      "os_version": deviceManager?.deviceModel?.os_version ?? "",
      "brand": deviceManager?.deviceModel?.brand ?? "",
      "model": deviceManager?.deviceModel?.model ?? "",
    };

    networkConfigInterface = NetworkConfigImpl(headers: headers,);

    options.headers.addAll(networkConfigInterface!.headers!);
   // logger.i(logRequest(options));
    return super.onRequest(options, handler);
  }

  /// When error occurs, this interceptor handles it
  @override
  void onError(DioError err,
      ErrorInterceptorHandler handler,) {
    return super.onError(err, handler);
  }

  /// When it returns a response this interceptor handles it
  @override
  void onResponse(Response response,
      ResponseInterceptorHandler handler) {
   // logger.i(logResponse(response));
    return super.onResponse(response, handler);
  }
}