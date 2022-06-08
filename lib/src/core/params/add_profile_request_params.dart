class AddProfileParams {
  final String? uuid;
  final BirthDetailsParams birthDetails;
  final BirthPlaceParams birthPlace;
  final String firstName;
  final String lastname;
  final int relationId;
  final String gender;

  AddProfileParams(this.birthDetails, this.birthPlace, this.firstName,
      this.lastname, this.gender,{this.relationId=3,this.uuid});

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = {
      "firstName":firstName,
      "lastName":lastname,
      "gender":gender,
      "relationId":relationId,
      "birthDetails":birthDetails.toJson(),
      "birthPlace":birthPlace.toJson()
    };
    if(uuid!=null){
      map["uuid"] = uuid;
    }
  return map;
  }
}

class BirthDetailsParams {
  final int dobDay;
  final int dobMonth;
  final int dobYear;
  final int tobHour;
  final int tobMin;
  final String meridiem;

  BirthDetailsParams(this.dobDay, this.dobMonth, this.dobYear, this.tobHour,
      this.tobMin, this.meridiem);

  Map toJson(){
    return {
      "dobDay":dobDay,
      "dobMonth":dobMonth,
      "dobYear":dobYear,
      "tobHour":tobHour,
      "tobMin":tobMin,
      "meridiem":meridiem
    };
  }
}

class BirthPlaceParams {
  final String placeName;
  final String placeId;

  BirthPlaceParams(this.placeName, this.placeId);

  Map toJson(){
    return {
      "placeName":placeName,
      "placeId": placeId,
    };
  }
}
