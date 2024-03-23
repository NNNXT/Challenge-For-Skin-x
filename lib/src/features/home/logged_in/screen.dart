// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/model/user_profile/user_profie.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/viewmodel.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget(
        builder: (_, model, __) {
          UserProfile? userProfile = model.userProfile;
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(160),
                        child: Image.network(
                          userProfile?.toLargestImage ?? '',
                          width: 128,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(userProfile?.displayName ?? ''),
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
          );
        },
        model: LoggedInViewModel(context: context),
      );
}
