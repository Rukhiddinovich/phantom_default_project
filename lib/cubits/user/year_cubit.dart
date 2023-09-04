import 'package:default_project/cubits/user/year_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:default_project/data/models/universal_data.dart';
import '../../data/models/year_model.dart';
import '../../data/repository/user/user_repository.dart';


class YearCubit extends Cubit<YearState> {
  YearCubit(this.userRepository) : super(YearInitial());

  final UserRepository userRepository;

  Future<void> getAllUsers() async {
    emit(YearLoadingState());

    UniversalData universalData = await userRepository.getAllHomework();
    if (universalData.error.isEmpty) {
      emit(YearSuccessState(yearModels: universalData.data as List<YearModel>));
    } else {
      emit(YearErrorState(errorText: universalData.error));
    }
  }
}
