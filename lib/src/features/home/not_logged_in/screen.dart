// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/src/features/home/not_logged_in/viewmodel.dart';

class NotLoggedInScreen extends StatefulWidget {
  const NotLoggedInScreen({super.key});

  @override
  State<NotLoggedInScreen> createState() => _NotLoggedInScreenState();
}

class _NotLoggedInScreenState extends State<NotLoggedInScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget(
        builder: (_, model, __) => Scaffold(
          body: Center(
            child: ElevatedButton(
              child: const Text(
                'Please Login First',
              ),
              onPressed: () {
                model.fetchSpotifyAccessToken();
              },
            ),
          ),
        ),
        model: NotLoggedInViewModel(context: context),
      );
}
