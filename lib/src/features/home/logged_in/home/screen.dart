// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/home/viewmodel.dart';
import 'package:challenge_for_skin_x/widget/custom_listtile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget(
        onModelReady: (model) async {
          await model.requestPlaylist();
        },
        builder: (_, model, __) {
          List<Item> listItems = model.listItems;
          return RefreshIndicator(
            onRefresh: () async {
              await model.requestPlaylist(reload: true);
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.isLoadMoreNotification) {
                  model.requestPlaylist();
                  return true;
                }
                return false;
              },
              child: ListView.separated(
                itemCount: listItems.length,
                itemBuilder: (_, index) {
                  Item item = listItems[index];
                  return CustomListTile(
                    imageUrl: (item.images ?? []).isEmpty ? '' : item.toLargestImage,
                    title: item.name,
                    subtitle: item.description,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 8),
              ),
            ),
          );
        },
        model: HomeViewModel(context: context),
      );
}
