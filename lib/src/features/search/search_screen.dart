import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_app/src/features/search/controller/search_controller.dart';
import 'package:new_app/src/features/search/state/search_state.dart';
import 'package:new_app/style/kTextStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/assets_path.dart';
import '../../../style/kColors.dart';
import '../../../style/kSize.dart';
import 'component/list_card.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final List<String>? items;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  initData() async {
    final prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList('items');
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchProvider);
    final searchData = searchState is SearchSuccessState
        ? searchState.searchModel!.search!.results
        : [];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: KColor.stickerColor,
          title: Text(
            "Learn Arabic",
            style: KTextStyle.headline4,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
                searchData!.length,
                (index) => ListCard(
                      results: searchData[index],
                    )),
          ),
        ));
  }
}
