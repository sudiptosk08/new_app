

import '../../../../constant/base_state.dart';
import '../model/search_model.dart';



class SearchSuccessState extends SuccessState {
  final SearchModel? searchModel;

  const SearchSuccessState(this.searchModel);
}

