import 'package:default_project/cubits/tab_box/tab_box_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TabBoxCubit extends Cubit<TabBoxState> {
  TabBoxCubit() : super(CalculateScreenState());

  updateScreen({required int index}) {
    if (index == 0) {
      emit(CalculateScreenState());
    } else {
      emit(LoginScreenState());
    }
  }
}