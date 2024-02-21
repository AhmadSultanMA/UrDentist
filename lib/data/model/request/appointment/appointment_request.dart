import 'package:json_annotation/json_annotation.dart';

part 'appointment_request.g.dart';

@JsonSerializable()
class AppointmentRequest {
  @JsonKey(name: 'OnlineConsultationID')
  int onlineConsultationID;

  AppointmentRequest({
    required this.onlineConsultationID,
  });

  factory AppointmentRequest.fromJson(Map<String, dynamic> json) =>
      _$AppointmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentRequestToJson(this);
}
