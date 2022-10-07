import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:i_streamo_test/app/data/share_pref.dart';
import 'package:i_streamo_test/app/routes/app_pages.dart';
import 'package:local_auth/local_auth.dart';

import '../models/auth_state.dart';

class AuthController extends GetxController {
  final _localAuth = LocalAuthentication();
  final _authenticationStateStream = AuthenticationState().obs;
  final _biometricSupportedStream = false.obs;
  RxBool showLogin = false.obs;
  AuthenticationState get authState => _authenticationStateStream.value;
  bool get isBiometricsSupported => _biometricSupportedStream.value;

  @override
  void onInit() {
    _checkIfBiometricsSupported();
    _authenticationStateStream.value = UnAuthenticated();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signInWithBiometrics() async {
    try {
      var isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate with your biometrics',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
        ),
      );
      if (isAuthenticated) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to Aunthenticate",
          backgroundColor: Colors.red,
        );
      }
      LocalStorage().addValueFor(
        LocalStorageKeys.userLoggedIn,
        isAuthenticated,
      );
    } on PlatformException catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to Aunthenticate",
        backgroundColor: Colors.red,
      );
      print(e.message);
    }
  }

  void signOut() {
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _checkIfBiometricsSupported() async {
    _biometricSupportedStream.value = await _localAuth.isDeviceSupported();
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    showLogin(true);
  }
}
