import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

Future<bool> onWillPop(BuildContext context) async {
  return (await CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          title: 'Wait!',
          text: "Do you really want to leave?",
          backgroundColor: Colors.green,
          lottieAsset: 'assets/animations/cries.json',
          showCancelBtn: true,
          onConfirmBtnTap: () => Navigator.of(context).pop(true),
          onCancelBtnTap: () => Navigator.of(context).pop(false),
          cancelBtnTextStyle: const TextStyle(color: Colors.pink),
          cancelBtnText: 'No')) ??
      false;
}
