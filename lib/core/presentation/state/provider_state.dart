

import 'package:connectivity_plus/connectivity_plus.dart';

class ProviderState<T> {
  bool hasError = false;
  bool isReady = false;
  bool isLoading = false;
  String errorMessage = '';
  T? _payload;


  T? get payload => _payload;

  set initialPayload(T? data) => _payload = data;

  static ConnectivityResult _connectionState = ConnectivityResult.none;
  int _connectionChangeCount = 0;
  static ConnectivityResult _previousConnectionState = ConnectivityResult.none;
  bool hasConnectionChanged = false;
  var connectivitySubscription;

  ConnectivityResult get connectionState => _connectionState;
  ConnectivityResult get previousConnectionState => _previousConnectionState;

  setPreviousConnectionState(ConnectivityResult newState) =>
      _previousConnectionState = newState;

  update({loading, hasErr, errorMsg, ready, T? statePayload}) {
    isLoading = loading;
    hasError = hasErr;
    errorMessage = errorMsg;
    isReady = ready;
    _payload = statePayload == _payload || statePayload == null
        ? _payload
        : statePayload;
  }

  subscribeToConnectionState(Function callback) async {
    try {
      _connectionState = await (Connectivity().checkConnectivity());
      connectivitySubscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
        _connectionState = result;
        if (_connectionChangeCount < 1) {
          _connectionChangeCount++;
        } else {
          hasConnectionChanged = true;
        }
        callback();
      });
    } catch (e) {
     // logger.e("Connectivity not responding $e");
    }
  }

  bool hasInternetConnection() {
    return _connectionState == ConnectivityResult.mobile ||
        _connectionState == ConnectivityResult.wifi;
  }

  cancelConnectionStateSubscription() {
    connectivitySubscription.cancel();
  }
}
