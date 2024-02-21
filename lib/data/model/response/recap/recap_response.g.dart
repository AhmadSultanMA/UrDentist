// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recap_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecapResponse _$RecapResponseFromJson(Map<String, dynamic> json) =>
    RecapResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => RecapData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecapResponseToJson(RecapResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

RecapData _$RecapDataFromJson(Map<String, dynamic> json) => RecapData(
      dayCompleted: json['DayCompleted'] as int,
      totalPoints: json['TotalPoints'] as int,
      completedTasks: json['completedTasks'] as int,
      periode: json['periode'] as String,
    );

Map<String, dynamic> _$RecapDataToJson(RecapData instance) => <String, dynamic>{
      'DayCompleted': instance.dayCompleted,
      'TotalPoints': instance.totalPoints,
      'completedTasks': instance.completedTasks,
      'periode': instance.periode,
    };
