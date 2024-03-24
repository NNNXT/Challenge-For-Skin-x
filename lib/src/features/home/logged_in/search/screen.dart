// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';

// Internal Modules
import 'package:challenge_for_skin_x/base/base_extension.dart';
import 'package:challenge_for_skin_x/base/base_widget.dart';
import 'package:challenge_for_skin_x/constant.dart';
import 'package:challenge_for_skin_x/model/playlist/item.dart';
import 'package:challenge_for_skin_x/src/features/home/logged_in/search/viewmodel.dart';
import 'package:challenge_for_skin_x/widget/custom_icon.dart';
import 'package:challenge_for_skin_x/widget/custom_listtile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) => BaseWidget(
        builder: (_, model, __) {
          List<Item> listSearchs = model.listSearchs;
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.isLoadMoreNotification) {
                model.searchPlaylist();
                return true;
              }
              return false;
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    cursorColor: mainColor,
                    decoration: InputDecoration(
                      icon: const CustomIcon(
                        CustomIconName.searchSelected,
                      ),
                      hintText: 'search.search_hint'.tr(),
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColor),
                      ),
                    ),
                    onChanged: (value) async {
                      if (value.isNotEmpty) {
                        model.searchText = value;
                        EasyDebounce.debounce(
                          'searchTextInput',
                          const Duration(milliseconds: 100),
                          () => model.searchPlaylist(reload: true),
                        );
                      } else {
                        model
                          ..searchText = ''
                          ..clearSearchPlayList();
                      }
                    },
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: listSearchs.length,
                    itemBuilder: (_, index) {
                      Item item = listSearchs[index];
                      return CustomListTile(
                        imageUrl: (item.images ?? []).isEmpty ? '' : item.toLargestImage,
                        title: item.name,
                        subtitle: item.description,
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                  ),
                ),
              ],
            ),
          );
        },
        model: SearchViewModel(context: context),
      );
}
