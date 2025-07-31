import 'package:flutter/material.dart';
import 'package:login_signin_screen/core/app_colors.dart';
import 'package:login_signin_screen/main.dart';
import 'package:login_signin_screen/presentation/widgets/app_button.dart';


class AlertsManager {
  static Future<T> showAppDialog<T>({required Widget child, Color? barrierColor, bool barrierDismissible = true}) async {
    return await showDialog(
      //
      context: appContext,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder:
          (builder) => Dialog(
            //
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            insetPadding: const EdgeInsets.all(16),
            child: child,
          ),
    );
  }

  static Future<T?> showAppGeneralDialog<T>({Color? barrierColor, bool barrierDismissible = true, required Widget child, double finalScale = 1}) async {
    return await showGeneralDialog<T>(
      context: appContext,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor!,
      transitionBuilder: (context, animation, secondaryAnimation, dialogChild) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);

        return ScaleTransition(scale: Tween<double>(begin: 0.2, end: finalScale).animate(curvedAnimation), child: FadeTransition(opacity: Tween<double>(begin: 0.5, end: 1).animate(curvedAnimation), child: dialogChild));
      },

      pageBuilder: (context, animation, secondaryAnimation) => SafeArea(child: Center(child: Material(child: child))),
    );
  }

  static Future<void> showLoadingDialog() async {
    await showAppDialog(barrierDismissible: false, child: const CircularProgressIndicator());
  }

  static Future<T?> showAppModelSheet<T>({String? title, required Widget child, bool isBarrierDismissible = true}) async {
    return await showModalBottomSheet<T>(
      context: appContext,
      isDismissible: isBarrierDismissible,
      builder:
          (context) => SafeArea(
            child: Wrap(
              children:
              //
              [
                //
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    //
                    spacing: 16,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(),
                      if (title != null) ...[
                        Text(
                          title,
                          //
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),
                        ),
                      ],

                      child,
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  static Future<T?> showOptionalBottomSheet<T>(String content, {String? okText, String? cancelText, bool barrierDismissible = true, Color? okButtonColor, Color? cancelButtonColor, VoidCallback? onCancel, VoidCallback? onOk, Widget? child}) async {
    return await showAppModelSheet(
      isBarrierDismissible: barrierDismissible,

      //
      child: Column(
        spacing: 16,
        children: [
          Text(
            content,
            //
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pop(appContext);
                    if (onCancel != null) {
                      onCancel();
                    }
                  },
                  label: 'Log Out',
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  static Future<void> showAppSnackBarMessage(
    String message, {
    required BuildContext context,
    Color? backgroundColor,
    Color? textColor,
  }) async {
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}