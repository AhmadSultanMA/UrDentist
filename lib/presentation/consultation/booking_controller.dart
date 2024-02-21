import 'package:urdentist/data/repository/repository.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  var repo = Repository();

  int profileId = 0;
  int paymentId = 0;
  int consultationId = 4;

  var isLoading = false.obs;
  var isLoading2 = false.obs;

  appoinment(
    profileId, {
    required Function(int) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading(true);
    repo.appointment(profileId, consultationId, onSuccess: (id) {
      isLoading(false);
      onSuccess(id);
    }, onFailed: (msg) {
      isLoading(false);
      onFailed(msg);
    });
  }

  payment({
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading2(true);
    repo.payment(paymentId, onSuccess: (msg) {
      isLoading2(false);
      onSuccess(msg);
    }, onFailed: (msg) {
      isLoading2(false);
      onFailed(msg);
    });
  }
}
