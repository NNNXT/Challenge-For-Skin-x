// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/viewmode.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget(
        builder: (context, model, child) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(160),
                      child: Image.network(
                        model.userImage,
                        width: 160,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(model.displayName),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    model.logout();
                  },
                  child: const Text(
                    'Logout',
                  ),
                ),
              ],
            ),
          ),
        ),
        model: LoggedInViewModel(context: context),
      );
}
