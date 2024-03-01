import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce_app/utils/constants/texts.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually chekc the connection status.
 @override
 void onInit() {
  super.onInit();
  _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
 } 

 /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
 Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  _connectionStatus.value = result;
  if (_connectionStatus.value == ConnectivityResult.none) {
    DLoaders.warningSnackBar(title: DTexts.noInternetConnection);
  }
 }

 /// Check the internet connection status
 /// returns 'true' if connected, 'false' otherwise
 Future<bool> isConnected() async {
  try {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  } on PlatformException catch (_) {
    return false;
  }
 }

 /// Dispose or close the active connectivity stream.
 @override
 void onClose() {
  super.onClose();
  _connectivitySubscription.cancel();
 }
}