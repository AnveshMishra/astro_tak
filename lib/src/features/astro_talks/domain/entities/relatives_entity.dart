class RelativesEntity {
  RelativesEntity({
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
  late final Data data;

}

class Data {
  Data({
    required this.allRelatives,
  });
  late final List<AllRelatives> allRelatives;

  Data.fromJson(Map<String, dynamic> json){
    allRelatives = List.from(json['allRelatives']).map((e)=>AllRelatives.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['allRelatives'] = allRelatives.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AllRelatives {
  AllRelatives({
    required this.uuid,
    required this.relationId,
    required this.relation,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.fullName,
    required this.gender,
    required this.dateAndTimeOfBirth,
    required this.birthDetails,
    required this.birthPlace,
  });
  late final String uuid;
  late final int relationId;
  late final String relation;
  late final String firstName;
  late final Null middleName;
  late final String lastName;
  late final String fullName;
  late final String gender;
  late final String dateAndTimeOfBirth;
  late final BirthDetails birthDetails;
  late final BirthPlace birthPlace;

  AllRelatives.fromJson(Map<String, dynamic> json){
    uuid = json['uuid'];
    relationId = json['relationId'];
    relation = json['relation'];
    firstName = json['firstName'];
    middleName = null;
    lastName = json['lastName'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateAndTimeOfBirth = json['dateAndTimeOfBirth'];
    birthDetails = BirthDetails.fromJson(json['birthDetails']);
    birthPlace = BirthPlace.fromJson(json['birthPlace']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['relationId'] = relationId;
    _data['relation'] = relation;
    _data['firstName'] = firstName;
    _data['middleName'] = middleName;
    _data['lastName'] = lastName;
    _data['fullName'] = fullName;
    _data['gender'] = gender;
    _data['dateAndTimeOfBirth'] = dateAndTimeOfBirth;
    _data['birthDetails'] = birthDetails.toJson();
    _data['birthPlace'] = birthPlace.toJson();
    return _data;
  }
}

class BirthDetails {
  BirthDetails({
    required this.dobYear,
    required this.dobMonth,
    required this.dobDay,
    required this.tobHour,
    required this.meridiem,
    required this.tobMin,
  });
  late final int dobYear;
  late final int dobMonth;
  late final int dobDay;
  late final int tobHour;
  late final String meridiem;
  late final int tobMin;

  BirthDetails.fromJson(Map<String, dynamic> json){
    dobYear = json['dobYear'];
    dobMonth = json['dobMonth'];
    dobDay = json['dobDay'];
    tobHour = json['tobHour'];
    meridiem = json['meridiem'];
    tobMin = json['tobMin'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dobYear'] = dobYear;
    _data['dobMonth'] = dobMonth;
    _data['dobDay'] = dobDay;
    _data['tobHour'] = tobHour;
    _data['meridiem'] = meridiem;
    _data['tobMin'] = tobMin;
    return _data;
  }
}

class BirthPlace {
  BirthPlace({
    required this.placeName,
    required this.placeId,
  });
  late final String placeName;
  late final String placeId;

  BirthPlace.fromJson(Map<String, dynamic> json){
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