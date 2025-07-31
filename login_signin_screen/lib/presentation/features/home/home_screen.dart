import 'package:flutter/material.dart';
import 'package:login_signin_screen/core/app_colors.dart';
import 'package:login_signin_screen/core/theme/managment/alert_manager.dart';
import 'package:login_signin_screen/presentation/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              label: 'Log Out',
              textColor: AppColors.textSecondary,
              onPressed: () {
                AlertsManager.showAppSnackBarMessage(
                  'You have logged out successfully', context: context,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
