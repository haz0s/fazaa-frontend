import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fazaa/core/utils/app_localizations.dart';
import 'package:flutter/material.dart';

Route goRoute({required var x}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => x,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.fastEaseInToSlowEaseOut;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

void messages(BuildContext context, String error, Color c, {int msgTime = 2}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    backgroundColor: c,
    content: Center(child: Text(error)),
    duration: Duration(seconds: msgTime),
  ));
}

void showSuccessDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required void Function() onOkPressed,
}) async {
  await AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.scale,
    title: title,
    desc: desc,
    descTextStyle: const TextStyle(fontSize: 16),
    btnOkText: "المتابعة",
    buttonsTextStyle: const TextStyle(color: Colors.white),
    btnOkOnPress: onOkPressed,
    dismissOnTouchOutside: false,
  ).show();
}

void showAwesomeDialog({
  required BuildContext context,
  required DialogType dialogType,
  required String title,
  required String desc,
  required void Function() btnOk,
  required void Function() btnCancel,
}) async {
  await AwesomeDialog(
    descTextStyle: const TextStyle(fontSize: 16),
    btnOkText: "yes".tr(context),
    btnCancelText: "no".tr(context),
    context: context,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: title,
    desc: desc,
    btnCancelOnPress: btnCancel,
    btnOkOnPress: btnOk,
  ).show();
}
