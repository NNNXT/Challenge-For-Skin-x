// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:easy_localization/easy_localization.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/home/screen.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/viewmodel.dart';
import 'package:challenge_for_skin_x/widget/custom_icon.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget(
        builder: (_, model, __) {
          int selectedIndex = model.selectedIndex;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                model.logout();
              },
            ),
            body: IndexedStack(
              index: selectedIndex,
              children: [
                const HomeScreen(),
                Container(),
                Container(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: CustomIcon(
                    selectedIndex == 0 ? CustomIconName.homeSelected : CustomIconName.homeUnSelected,
                    size: 24,
                  ),
                  label: 'logged_in.home'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: CustomIcon(
                    selectedIndex == 1 ? CustomIconName.searchSelected : CustomIconName.searchUnSelected,
                    size: 24,
                  ),
                  label: 'logged_in.search'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: CustomIcon(
                    selectedIndex == 2 ? CustomIconName.libaryUnselected : CustomIconName.libaryUnselected,
                    size: 24,
                  ),
                  label: 'logged_in.library'.tr(),
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: mainColor,
              backgroundColor: backgroundColor,
              unselectedItemColor: Colors.white,
              onTap: (value) {
                model.selectIndex(value);
              },
            ),
          );
        },
        model: LoggedInViewModel(context: context),
      );
}
