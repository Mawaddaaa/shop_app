import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/modules/search/cubit/search_states.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import '../../../network/end_points.dart';
import '../../../shared/component/constants.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;
  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        token: token,
        data: {
          "text": text
        }
        ).then((value) {
          searchModel = SearchModel.fromJson(value?.data);
          emit(SearchSuccessState());
    })
        .catchError((error) {
          print(error.toString());
          emit(SearchErrorState());
    });
  }
}
