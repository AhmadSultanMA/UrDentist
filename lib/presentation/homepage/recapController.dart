import 'package:get/get.dart';
import 'package:urdentist/data/model/response/recap/recap_response.dart';
import 'package:urdentist/data/repository/repository.dart';

class RecapController extends GetxController {
  var profileId = 0;
  Rx<RecapResponse> data = RecapResponse(data: []).obs;

  Rx<RecapData> detailRecap =
      RecapData(dayCompleted: 0, totalPoints: 0, completedTasks: 0, periode: "")
          .obs;

  var repo = Repository();

  getRecap({
    required Function(RecapResponse) onSuccess,
    required Function(String) onFailed,
  }) {
    repo.getRecap(profileId, onSuccess: onSuccess, onFailed: onFailed);
  }
}
