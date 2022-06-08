class QuestionCategoryEntity {
  QuestionCategoryEntity({
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

  QuestionCategoryEntity.fromJson(Map<String, dynamic> json){
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
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

class Data {
  Data({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    required this.suggestions,
  });
  late final int id;
  late final String name;
  late final int price;
  late final String? description;
  late final List<String> suggestions;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = null;
    suggestions = List.castFrom<dynamic, String>(json['suggestions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['description'] = description;
    _data['suggestions'] = suggestions;
    return _data;
  }
}