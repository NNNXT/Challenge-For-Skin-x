// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:easy_localization/easy_localization.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/src/features/home/not_logged_in/viewmodel.dart';
import 'package:challenge_for_skin_x/widget/custom_button.dart';

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
            child: CustomButton(
              text: 'not_logged_in.login'.tr(),
              onPressed: () async {
                await model.fetchSpotifyAccessToken();
              },
            ),
          ),
        ),
        model: NotLoggedInViewModel(context: context),
      );
}
