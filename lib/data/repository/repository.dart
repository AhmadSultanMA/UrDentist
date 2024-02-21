import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:urdentist/data/model/request/appointment/appointment_request.dart';
import 'package:urdentist/data/model/request/forgot_password/forgot_password_request.dart';
// import 'package:urdentist/data/model/request/login/login_google_request.dart';

import 'package:urdentist/data/model/request/login/login_request.dart';
import 'package:urdentist/data/model/request/profile/create_profile_request.dart';
import 'package:urdentist/data/model/request/question/question_request.dart';
import 'package:urdentist/data/model/request/register/register_request.dart';
import 'package:urdentist/data/model/request/reset_password/reset_password_request.dart';
import 'package:urdentist/data/model/request/upload/upload_request.dart';
import 'package:urdentist/data/model/request/verify/verify_request.dart';
import 'package:urdentist/data/model/request/verify/resend_verify_request.dart';
import 'package:urdentist/data/model/request/verify_password/verify_password_request.dart';
// import 'package:urdentist/data/model/response/login/login_google_response.dart';
import 'package:urdentist/data/model/response/profile/profile_response.dart';
import 'package:urdentist/data/model/response/question/question_response.dart';
import 'package:urdentist/data/model/response/recap/recap_response.dart';
import 'package:urdentist/data/model/response/task/task_response.dart';
import 'package:urdentist/data/model/response/upload/upload_response.dart';
import 'package:urdentist/data/repository/retrofit_client.dart';
import 'package:urdentist/data/repository/user.dart';

import '../../main.dart';

class Repository {
  late Dio dio;
  late RetrofitClient client;

  Repository() {
    dio = Dio();
    if (prefs != null) {
      dio.options.headers['Authorization'] =
          'Bearer ${prefs?.getString("TOKEN") ?? ""}';
    }
    client = RetrofitClient(dio);
  }

  void login(
    String email,
    String password, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .login(
      LoginRequest(emailAddress: email, password: password),
    )
        .then((value) {
      if (value.status == "User logged in successfully!") {
        UserManager.instance.setCurrentUser(value.user);
        onSuccess(value.token);
      } else {
        onFailed(value.status);
      }
    }).catchError((err) {
      onFailed(err.toString());
    });
  }

  // void googleLogin({required Function(GoogleLoginResponse) onSuccess}) {
  //   client.googleLogin().then((value) {
  //     onSuccess(value);
  //   }).catchError((err) {
  //     debugPrint(err.toString());
  //   });
  // }

  void register(
    String fullName,
    String phoneNumber,
    String email,
    String password,
    String confirmPassword, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .register(Register(
            fullName: fullName,
            phoneNumber: phoneNumber,
            emailAddress: email,
            password: password,
            confirmPassword: confirmPassword))
        .then((value) {
      if (value.status ==
          "Verification email has been sent. Please verify your account within 10 minutes.") {
        onSuccess(value.status);
      } else {
        onFailed(value.status);
      }
    }).catchError((err) {
      onFailed(err.toString());
    });
  }

  void verify(
    String code, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client.verify(VerificationCode(code: code)).then((value) {
      if (value.status == "User verified successfully!") {
        onSuccess(value.status);
      } else {
        onFailed(value.status);
      }
    }).catchError((err) {
      onFailed(err.toString());
    });
  }

  void resend(
    String email, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client.resend(ResendVerify(emailAddress: email)).then((value) {
      if (value.status ==
          "Verification email has been resent. Please verify your account within 10 minutes.") {
        onSuccess(value.status);
      } else {
        onFailed(value.status);
      }
    }).catchError((err) {
      onFailed(err.toString());
    });
  }

  void forgot(
    String email, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client.forgot(ForgotPasswordRequest(emailAddress: email)).then((value) {
      if (value.status == "Verification email has been sent.") {
        onSuccess(value.status);
      } else {
        onFailed(value.status);
      }
    }).catchError((err) {
      onFailed(err.toString());
    });
  }

  void verifyPassword(
    String email,
    String code, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .verifyPassword(
            VerifyPassword(emailAddress: email, verificationCode: code))
        .then((value) {
      if (value.status == "Token verified successfully!") {
        onSuccess(value.token);
      } else {
        onFailed(value.status);
      }
    }).catchError((err) {
      onFailed(err.toString());
    });
  }

  void resetPassword(
    String password,
    String confirmPassword, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .resetPassword(
            ResetPassword(password: password, confirmPassword: confirmPassword))
        .then((value) {
      if (value.status == "Password reset successfully!") {
        removeToken();
        onSuccess(value.status);
      } else {
        onFailed(value.status);
      }
    }).catchError((err) {
      onFailed(err.toString());
    });
  }

  saveToken(String token, Function onSuccess) {
    if (prefs != null) {
      prefs?.setString("TOKEN", token).then((value) {
        onSuccess();
      }).catchError((e) {
        debugPrint(e.toString());
      });
    }
  }

  removeToken() {
    prefs?.remove("TOKEN").catchError((e) {
      debugPrint(e.toString());
      return false;
    });
  }

  getToken(Function(String) onSuccess) {
    if (prefs != null) {
      onSuccess(prefs?.getString("TOKEN") ?? "");
    }
  }

  // Profile

  void createProfile(
    String namaLengkap,
    String tempatLahir,
    String tanggalLahir,
    String alamat,
    String alergi, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .createProfile(CreateProfileRequest(
            namaLengkap: namaLengkap,
            tempatLahir: tempatLahir,
            tanggalLahir: tanggalLahir,
            alamat: alamat,
            alergi: alergi))
        .then((response) {
      if (response.message == "Profile created successfully") {
        onSuccess(response.message);
      } else {
        onFailed("Failed to create profile");
      }
    }).catchError((error) {
      onFailed("Error: $error");
      print(error);
    });
  }

  void getProfileAll({
    required Function(List<ProfileResponse>) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getProfileAll().then((value) {
      onSuccess(value);
    }).catchError((error) {
      print('gagal $error');
      onFailed(error);
    });
  }

  void getProfileId(
    int profileId, {
    required Function(ProfileResponse) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getProfileId(profileId).then((value) {
      onSuccess(value);
    }).catchError((error) {
      onFailed("Error: $error");
    });
  }

  void deleteProfile(
    int profileId, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client.deleteProfile(profileId).then((response) {
      if (response.message == "Profile deleted successfully") {
        onSuccess(response.message);
      } else {
        onFailed("Failed to delete profile");
      }
    }).catchError((error) {
      onFailed("Error: $error");
    });
  }

  // Task

  void completeTask(
    int profileId,
    int taskId, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client.completeTask(profileId, taskId).then((response) {
      if (response.message == "Task completed successfully") {
        onSuccess(response.message);
      } else {
        onFailed("Failed to complete task");
      }
    }).catchError((error) {
      onFailed("Error: $error");
    });
  }

  void getTask(
    int profileId,
    String date, {
    required Function(List<TaskResponse>) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getTasksByProfileAndDate(profileId, date).then((value) {
      onSuccess(value);
    }).catchError((error) {
      onSuccess([]);
      onFailed("gagal di repo: $error $profileId $date");
    });
  }

  // Task

  void createQuestion(
    int profileId,
    String tag,
    String question, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .createQuestion(
            profileId, QuestionRequest(tag: tag, question: question))
        .then((value) {
      if (value.message == "Question created successfully") {
        onSuccess(value.message);
      } else {
        onFailed('Failed to create');
      }
    }).catchError((msg) {
      onFailed(msg);
    });
  }

  void getQuestionAll({
    required Function(List<QuestionResponse>) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getQuestionAll().then((value) {
      onSuccess(value);
    }).catchError((error) {
      onFailed("$error");
    });
  }

  void getQuestionId(
    int questionId, {
    required Function(QuestionResponse) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getQuestionId(questionId).then((value) {
      onSuccess(value);
    }).catchError((error) {
      onFailed("$error");
    });
  }

  void getRecap(
    int profileId, {
    required Function(RecapResponse) onSuccess,
    required Function(String) onFailed,
  }) {
    client.getRecap(profileId).then((value) {
      onSuccess(value);
    }).catchError((error) {
      onFailed('gagal recap: $error');
    });
  }

  void appointment(
    int profileId,
    int onlineConsultationID, {
    required Function(int) onSuccess,
    required Function(String) onFailed,
  }) {
    client
        .appointment(profileId,
            AppointmentRequest(onlineConsultationID: onlineConsultationID))
        .then((value) {
      onSuccess(value.id);
    }).catchError((error) {
      onFailed('$error');
    });
  }

  void payment(
    int paymentId, {
    required Function(String) onSuccess,
    required Function(String) onFailed,
  }) {
    client.payment(paymentId).then((value) {
      onSuccess(value.message);
    }).catchError((err) {
      onFailed(err);
    });
  }

  void carierDetector(
    File myFile,
    String text, {
    required Function(UploadResponse) onSuccess,
    required Function(String) onFailed,
  }) {
    client.carierDetector(myFile, text).then((value) {
      onSuccess(value);
    }).catchError((err) {
      onFailed('error in carier detector: $err');
      print('$text');
      print('$myFile');
    });
  }
}
