import 'package:json_annotation/json_annotation.dart';

part 'recap_response.g.dart';

@JsonSerializable()
class RecapResponse {
  final List<RecapData> data;

  RecapResponse({required this.data});

  factory RecapResponse.fromJson(Map<String, dynamic> json) =>
      _$RecapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecapResponseToJson(this);
}

@JsonSerializable()
class RecapData {
  @JsonKey(name: 'DayCompleted')
  final int dayCompleted;

  @JsonKey(name: 'TotalPoints')
  final int totalPoints;

  @JsonKey(name: 'completedTasks')
  final int completedTasks;

  final String periode;

  RecapData({
    required this.dayCompleted,
    required this.totalPoints,
    required this.completedTasks,
    required this.periode,
  });

  factory RecapData.fromJson(Map<String, dynamic> json) =>
      _$RecapDataFromJson(json);

  Map<String, dynamic> toJson() => _$RecapDataToJson(this);
}
