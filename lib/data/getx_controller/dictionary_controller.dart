import 'package:default_project/data/models/dictionary_model/dictionary_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/ui_utils/error_message_dialog.dart';
import '../../utils/ui_utils/loading_dialog.dart';
import '../models/universal_data.dart';
import '../network/api_service.dart';

class DictionaryController extends GetxController {
  DictionaryController({required this.apiService});

  final ApiService apiService;
  var word = "".obs;
  var isSearchTapped = false.obs;
  late Rx<DictionaryModel> dictionaryInfo;

  RxList<DictionaryModel> dictionaryModel = <DictionaryModel>[].obs;

  getWordDefinitionList({required BuildContext context}) async {
    showLoading(context: context);
    UniversalData universalData =
        await apiService.getDefinition(word: word.value);
    if (context.mounted) {
      hideLoading(context: context);
    }
    if (universalData.error.isEmpty) {
      dictionaryModel.value = universalData.data as List<DictionaryModel>;
      dictionaryInfo = dictionaryModel[0].obs;
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }
}
