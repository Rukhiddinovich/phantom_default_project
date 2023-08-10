import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../data/models/universal_response.dart';
import '../data/network/api_provider.dart';
import '../data/network/api_repository.dart';
import '../services/upload_service.dart';
import '../utils/ui_utils/loading_dialog.dart';

class ProfileProvider with ChangeNotifier {
  ProfileProvider();

  bool isLoading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String imageUrl = "";

  ApiRepository apiRepository = ApiRepository(apiProvider: ApiProvider());

  Future<void> postNotification() async {
    String title = titleController.text;
    String description = descriptionController.text;
    String image = imageUrl;
    await apiRepository.postNotification(
        title: title, description: description, image: image);
    clearTexts();

  }

  Future<void> uploadCategoryImage(
      BuildContext context,
      XFile xFile,
      ) async {
    showLoading(context: context);
    UniversalResponse data = await FileUploader.imageUploader(xFile);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (data.error.isEmpty) {
      imageUrl = data.data as String;
      notifyListeners();
    } else {
      if (context.mounted) {
        showMessage(context, data.error);
      }
    }
  }

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString())));

    isLoading = false;
    notifyListeners();
  }

  clearTexts() {
    titleController.clear();
    descriptionController.clear();
    imageUrl="";
  }

}