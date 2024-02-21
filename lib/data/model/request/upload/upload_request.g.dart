// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadRequest _$UploadRequestFromJson(Map<String, dynamic> json) =>
    UploadRequest(
      myFile: UploadRequest._fileFromJson(json['myFile'] as String?),
      text: json['text'] as String,
    );

Map<String, dynamic> _$UploadRequestToJson(UploadRequest instance) =>
    <String, dynamic>{
      'myFile': UploadRequest._fileToJson(instance.myFile),
      'text': instance.text,
    };
