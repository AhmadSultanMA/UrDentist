import 'dart:io';

import 'package:urdentist/data/model/response/upload/upload_response.dart';
import 'package:urdentist/data/repository/repository.dart';
import 'package:get/get.dart';

class CarierController extends GetxController {
  String text = "";

  var isLoading = false.obs;

  var repo = Repository();

  var persen = "".obs;
  var texts = "".obs;

  carierDetector(
    File myFile, {
    required Function(UploadResponse) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading(true);
    repo.carierDetector(
      myFile,
      text,
      onSuccess: (res) {
        isLoading(false);
        onSuccess(res);
      },
      onFailed: (err) {
        isLoading(false);
        onFailed(err);
      },
    );
  }
}
