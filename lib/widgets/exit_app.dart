import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitApp {
  static Future<bool> exitApp(BuildContext context) async {
    return (await CoolAlert.show(
            context: context,
            type: CoolAlertType.warning,
            title: 'Wait!',
            text: "Do you really want to leave?",
            backgroundColor: Colors.green,
            lottieAsset: 'assets/animations/cries.json',
            showCancelBtn: true,
            onConfirmBtnTap: () => SystemNavigator.pop(),
            // onCancelBtnTap: () {},
            cancelBtnTextStyle: const TextStyle(color: Colors.pink),
            cancelBtnText: 'No')) ??
        false;
  }
}
