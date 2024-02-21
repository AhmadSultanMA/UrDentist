import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
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
import 'package:urdentist/data/model/response/appointment/appointment_response.dart';
import 'package:urdentist/data/model/response/baseResponse/base_response.dart';

import 'package:urdentist/data/model/response/forgot_password/forgot_password_response.dart';
// import 'package:urdentist/data/model/response/login/login_google_response.dart';
import 'package:urdentist/data/model/response/login/login_response.dart';
import 'package:urdentist/data/model/response/profile/profile_response.dart';
import 'package:urdentist/data/model/response/question/question_response.dart';
import 'package:urdentist/data/model/response/recap/recap_response.dart';
import 'package:urdentist/data/model/response/register/register_response.dart';
import 'package:urdentist/data/model/response/reset_password/reset_password_response.dart';
import 'package:urdentist/data/model/response/task/task_response.dart';
import 'package:urdentist/data/model/response/upload/upload_response.dart';
import 'package:urdentist/data/model/response/verify/verify_response.dart';
import 'package:urdentist/data/model/response/verify/resend_verify_response.dart';
import 'package:urdentist/data/model/response/verify_password/verify_password_response.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: "https://supple-hulling-408914.et.r.appspot.com")
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @POST("/login")
  Future<LoginResponse> login(
    @Body() LoginRequest request,
  );

  @POST("/register")
  Future<RegisterResponse> register(
    @Body() Register request,
  );

  @POST("/resend-verification")
  Future<ResendVerifyResponse> resend(
    @Body() ResendVerify request,
  );

  @POST("/verify")
  Future<VerifyResponse> verify(
    @Body() VerificationCode request,
  );

  @POST("/forgot-password")
  Future<ForgotPasswordResponse> forgot(
    @Body() ForgotPasswordRequest request,
  );

  @POST("/verify-token")
  Future<VerifyPasswordResponse> verifyPassword(
    @Body() VerifyPassword request,
  );

  @PUT("/reset-password")
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPassword request,
  );

  // Profile
  @POST("/profile")
  Future<BaseResponse> createProfile(
    @Body() CreateProfileRequest request,
  );

  @GET("/profile")
  Future<List<ProfileResponse>> getProfileAll();

  @GET("/profile/{profileId}")
  Future<ProfileResponse> getProfileId(@Path("profileId") int profileId);

  @DELETE("/profile/{profileId}")
  Future<BaseResponse> deleteProfile(@Path("profileId") int profileId);

  // Task
  @POST("/profile/{profileId}/task/{taskId}/complete")
  Future<BaseResponse> completeTask(
    @Path("profileId") int profileId,
    @Path("taskId") int taskId,
  );

  @GET("/profile/{profileId}/tasks")
  Future<List<TaskResponse>> getTasksByProfileAndDate(
    @Path("profileId") int profileId,
    @Query("date") String date,
  );

  // Question

  @POST("/profile/{profileId}/question")
  Future<BaseResponse> createQuestion(
    @Path("profileId") int profileId,
    @Body() QuestionRequest request,
  );

  @GET("/questions")
  Future<List<QuestionResponse>> getQuestionAll();

  @GET("/question/{questionId}")
  Future<QuestionResponse> getQuestionId(@Path("questionId") int questionId);

  @GET("/profile/{profileId}/completedTasks")
  Future<RecapResponse> getRecap(@Path("profileId") int profileId);

  @POST("/profile/{profileId}/appointment")
  Future<AppointmentResponse> appointment(
      @Path("profileId") int profileId, @Body() AppointmentRequest request);

  @PUT("/paymentsdummy/{paymentId}")
  Future<BaseResponse> payment(@Path("paymentId") int paymentId);

  @POST("/upload")
  @FormUrlEncoded()
  Future<UploadResponse> carierDetector(
    @Part() File myFile,
    @Part() String text,
  );
}
