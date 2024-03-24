// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:easy_localization/easy_localization.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/home/screen.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/library/screen.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/search/screen.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/viewmodel.dart';
import 'package:challenge_for_skin_x/widget/custom_icon.dart';
import 'package:challenge_for_skin_x/widget/custom_network_image.dart';

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
            appBar: AppBar(
              backgroundColor: backgroundColor,
              title: Text(
                'main.title'.tr(),
                style: const TextStyle(color: Colors.white),
              ),
              leadingWidth: 72,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomNetworkImage(
                  imageUrl: model.userProfile?.toLargestImage ?? '',
                ),
              ),
              actions: [
                IconButton(
                  padding: const EdgeInsets.only(right: 16),
                  onPressed: () async {
                    model.logout();
                  },
                  icon: Icon(
                    Icons.logout,
                    color: mainColor,
                  ),
                ),
              ],
            ),
            body: IndexedStack(
              index: selectedIndex,
              children: const [
                HomeScreen(),
                SearchScreen(),
                LibraryScreen(),
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
