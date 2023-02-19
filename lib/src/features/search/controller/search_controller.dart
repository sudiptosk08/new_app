
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_app/constant/base_state.dart';
import 'package:new_app/core/network/network_utils.dart';
import 'package:new_app/src/features/search/model/search_model.dart';
import 'package:new_app/src/features/search/state/search_state.dart';

import '../../../../core/network/api.dart';

/// Providers
final searchProvider =
    StateNotifierProvider<SearchController, BaseState>(
  (ref) => SearchController(ref: ref),
);

/// Controllers
class SearchController extends StateNotifier<BaseState> {
  final Ref? ref;

  SearchController({this.ref}) : super(const InitialState());
  SearchModel? searchModel;

  Future fetchSearchItem(q,size,page) async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(
        await Network.getRequest(API.search(q:q,size:size,page: page )),
      );
      if (responseBody != null) {
        searchModel =
            SearchModel.fromJson(responseBody) ;
            
        state = SearchSuccessState(searchModel);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }
}
