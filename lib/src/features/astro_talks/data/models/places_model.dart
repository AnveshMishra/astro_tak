import 'package:astro_talk/src/features/astro_talks/domain/entities/places_entity.dart';

class PlacesModel extends PlacesEntity {
  PlacesModel(
      {required super.httpStatus,
      required super.httpStatusCode,
      required super.success,
      required super.message,
      required super.data});

  factory PlacesModel.fromJson(Map json) {
    return PlacesModel(
        httpStatus: json["httpStatus"],
        data: (json['data'] as List).map((e) => Data.fromJson(e)).toList(),
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
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}
