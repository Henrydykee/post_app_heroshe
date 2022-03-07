


import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:get_ip/get_ip.dart';

import '../../features/onboarding/data/model/registration_model.dart';
import '../di/di_config.dart';
import '../platform/storage/secure_storage.dart';
import '../platform/string_constant.dart';
import '../utils/string_utils.dart';

class DeviceManager {
  static final DeviceManager instance = DeviceManager._internal();

  factory DeviceManager() => instance;
  RegistrationRequestModel? deviceModel;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  DeviceManager._internal() {
    _getId();
  }

  _getId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String ipAddress = await GetIp.ipAddress;

    if (Platform.isIOS) {
      deviceModel = await getiOSDeviceInfo(deviceInfoPlugin, ipAddress);
    } else if (Platform.isAndroid) {
      deviceModel = await getAndroidDeviceInfo(deviceInfoPlugin, ipAddress);
    }
  }

  Future<RegistrationRequestModel> getiOSDeviceInfo(
      DeviceInfoPlugin deviceInfoPlugin, String ipAddress) async {
    dynamic iosData = await deviceInfoPlugin.iosInfo;
    ipAddress ?? "";

    String deviceId = await inject<SecuredStorage>().get(key: SecureStorageStrings.DEVICE_ID);

    if (StringUtils.isNullOrEmpty(deviceId)) {
      deviceId = iosData.identifierForVendor;
      await inject<SecuredStorage>().add(key: SecureStorageStrings.DEVICE_ID, value: deviceId);
    }
    return RegistrationRequestModel(
      os_version: iosData.systemVersion,
      os_type: AppString.IOS,
      ip: ipAddress,
      device_id: deviceId,
      brand: iosData.model,
      model: iosData.localizedModel,
    );
  }

  Future<RegistrationRequestModel> getAndroidDeviceInfo(
      DeviceInfoPlugin deviceInfoPlugin, String ipAddress) async {
    dynamic androidData = await deviceInfoPlugin.androidInfo;
    String deviceId =  await inject<SecuredStorage>().get(key: SecureStorageStrings.DEVICE_ID);

    if (StringUtils.isNullOrEmpty(deviceId)) {
      deviceId = androidData.androidId;
      await inject<SecuredStorage>()
          .add(key: SecureStorageStrings.DEVICE_ID, value: deviceId);
    }

    return RegistrationRequestModel(
        os_version: androidData.version.release,
        os_type: AppString.ANDROID,
        ip: ipAddress,
        device_id: deviceId,
        brand: androidData.brand,
        model: androidData.model);
  }

  // Future<String?> _iOSGetIPAddress() async {
  //   String? address;
  //   const platform =  MethodChannel(MethodChannelNames.IPADDRESS);
  //   try {
  //     address = await platform.invokeMethod(ChannelMethods.GET_IPADDRESS);
  //   } on PlatformException catch (e) {
  //    // logger.e("Error trying to get the device ip address $e");
  //     address;
  //   }
  //   return address;
  // }
}