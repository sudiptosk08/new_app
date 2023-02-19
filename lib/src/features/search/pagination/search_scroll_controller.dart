import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_app/constant/pagination_state.dart';

final searchListScrollProvider =
    StateNotifierProvider((ref) => SearchListScrollController(ref: ref));

class SearchListScrollController extends StateNotifier<ScrollState> {
  // ignore: deprecated_member_use
  final ProviderReference? ref;

  SearchListScrollController({this.ref}) : super(ScrollInitialState());

  ScrollController _scrollController = ScrollController();

  get controller {
    _scrollController.addListener(scrollListener);
    return _scrollController;
  }

  set setController(ScrollController scrollController) {
    _scrollController = scrollController;
  }

  get scrollNotifierState => state;

  scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      state = ScrollReachedBottomState();
    }
  }

  resetState() {
    state = ScrollInitialState();
  }
}
