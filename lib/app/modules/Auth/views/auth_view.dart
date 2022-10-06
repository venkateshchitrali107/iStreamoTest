import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'AuthView is working ${controller.isBiometricsSupported}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              if (controller.isBiometricsSupported) {
                return ElevatedButton(
                  onPressed: () {
                    controller.signInWithBiometrics();
                  },
                  child: Text('Login with biometrics'),
                );
              } else {
                return Text(
                  'Oops, device does not support biometrics',
                  style: Get.textTheme.bodyText1
                      ?.copyWith(color: Get.theme.errorColor),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
