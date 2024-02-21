import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'upload_request.g.dart';

@JsonSerializable()
class UploadRequest {
  @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
  final File? myFile;
  final String text;

  UploadRequest({required this.myFile, required this.text});

  factory UploadRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UploadRequestToJson(this);

  static File? _fileFromJson(String? json) {
    if (json != null) {
      return File(json);
    } else {
      return null;
    }
  }

  static String _fileToJson(File? file) {
    return file?.path ?? '';
  }
}
