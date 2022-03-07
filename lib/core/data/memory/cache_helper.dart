import 'dart:async';



class InMemory {
  static final InMemory instance = InMemory._internal();
 // TODO: implement USER OBJECT TO BE SAVED HERE
  // bool hasSession = false;
  // bool isFirstInstance = false;
  // bool requiresPin = false;
  // double? localDepositRate;
  // double? localWithdrawalRate;
  // double? transactionFee;
  // double? minDeposit;
  // double? minBuySell;
  // String? userEmail;
  // String? giftId;
  // String? oldFcmToken;
  // String? uploadedAddress;
  // String? the_peer_refrence;
  // String? username;
  // UpdateAddressParams? addressParams;
  // String? dealRoomToken;
  // String? organization_id;
  // String? tokenId;

  StreamController<Map<String, dynamic>> messageReceived =
  StreamController.broadcast();
  factory InMemory() => instance;
  InMemory._internal();

  close() {
    messageReceived.close();
  }

}
