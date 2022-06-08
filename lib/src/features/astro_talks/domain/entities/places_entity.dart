class PlacesEntity {
  PlacesEntity({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.data,
  });
  late final String httpStatus;
  late final int httpStatusCode;
  late final bool success;
  late final String message;
  late final List<Data> data;

  PlacesEntity.fromJson(Map<String, dynamic> json){
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.placeName,
    required this.placeId,
  });
  late final String placeName;
  late final String placeId;

  Data.fromJson(Map<String, dynamic> json){
    placeName = json['placeName'];
    placeId = json['placeId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['placeName'] = placeName;
    _data['placeId'] = placeId;
    return _data;
  }
}