// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/src/features/main_navigation/viewmodel.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) => BaseWidget(
        onModelReady: (model) async {
          await model.getUserToken();
        },
        model: MainNavigationViewModel(context: context),
        builder: (_, model, __) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (model.userIsLogin) ...[
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
                ],
                ElevatedButton(
                  onPressed: () {
                    model.userIsLogin ? model.logout() : model.fetchSpotifyAccessToken();
                  },
                  child: Text(
                    model.userIsLogin ? 'Logout' : 'Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
