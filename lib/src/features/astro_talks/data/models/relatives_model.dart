import 'package:astro_talk/src/features/astro_talks/domain/entities/relatives_entity.dart';

class RelativeModel extends RelativesEntity {
  RelativeModel(
      {required super.httpStatus,
      required super.httpStatusCode,
      required super.success,
      required super.message,
      required super.data});

  factory RelativeModel.fromJson(Map json) {
    return RelativeModel(
        httpStatus: json["httpStatus"],
        data:  Data.fromJson(json['data']),
        message: json['message'],
        success: json['success'],
        httpStatusCode: json['httpStatusCode']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['httpStatus'] = httpStatus;
    _data['httpStatusCode'] = httpStatusCode;
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}
