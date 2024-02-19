import 'package:urdentist/data/model/response/profile/profile_response.dart';
import 'package:urdentist/data/repository/repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var namaLengkap = "";
  var tempatLahir = "";
  var tanggalLahir = "";
  var alamat = "";
  var alergi = "";
  String tahun = "";
  String bulan = "";

  var profileId = 0;

  var isLoading = false.obs;

  var repo = Repository();

  RxList<ProfileResponse> profiles = <ProfileResponse>[].obs;

  var profile = ProfileResponse().obs;

  getProfileAll({
    required Function(List<ProfileResponse>) onSuccess,
    required Function(String) onFailed,
  }) {
    repo.getProfileAll(onSuccess: onSuccess, onFailed: onFailed);
  }

  createProfile({
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    isLoading(true);

    repo.createProfile(namaLengkap, tempatLahir, tanggalLahir, alamat, alergi,
        onSuccess: (msg) {
      isLoading(false);
      onSuccess(msg);
    }, onFailed: (msg) {
      isLoading(false);
      onFailed(msg);
    });
  }

  getProfileId({
    required Function(ProfileResponse) onSuccess,
    required Function(String) onFailed,
  }) {
    repo.getProfileId(profileId, onSuccess: onSuccess, onFailed: onFailed);
  }
}
