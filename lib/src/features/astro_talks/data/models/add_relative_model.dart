import 'package:astro_talk/src/features/astro_talks/domain/entities/add_relative_entity.dart';

class AddRelativeModel extends AddRelativeEntity {
  AddRelativeModel(
      {required super.httpStatus,
      required super.httpStatusCode,
      required super.success,
      required super.message});

  factory AddRelativeModel.fromJson(Map<String, dynamic> json){
    return AddRelativeModel(
    httpStatus: json['httpStatus'],
    httpStatusCode:json['httpStatusCode'],
    success: json['success'],
    message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['httpStatus'] = httpStatus;
    _data['httpStatusCode'] = httpStatusCode;
    _data['success'] = success;
    _data['message'] = message;
    return _data;
  }
}
