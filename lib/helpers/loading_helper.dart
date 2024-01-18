import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class LoadingHelper {
  ProgressDialog? pd;

  showLoadingHelper(context) async {
    pd = ProgressDialog(context: context);
    pd!.show(
        barrierDismissible: true,
        msg: "Mohon tunggu sebentar",
        hideValue: true,
        borderRadius: 0,
        barrierColor: Colors.black38,
        msgFontSize: 14,
        msgTextAlign: TextAlign.left,
        msgFontWeight: FontWeight.normal);
  }

  dismissLoading() {
    pd!.close();
  }
}
