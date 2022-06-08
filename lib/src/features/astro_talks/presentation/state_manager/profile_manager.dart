import 'package:astro_talk/src/core/params/add_profile_request_params.dart';
import 'package:astro_talk/src/features/astro_talks/domain/entities/add_relative_entity.dart';
import 'package:astro_talk/src/features/astro_talks/domain/entities/places_entity.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/add_profile_use_case.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/get_all_relative_use_case.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/get_places_usecase.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/update_relative_use_case.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/constants.dart';
import '../../../../core/use_cases.dart';
import '../../domain/entities/relatives_entity.dart';
import '../../domain/use_cases/delete_releative_use_case.dart';

enum UserAction {
  none,
  addProfile,
  editProfile,
}

class ProfileManager extends ChangeNotifier {
  final GetAllRelativeUseCase allRelativeUseCase;
  final GetPlacesUseCase placesUseCase;
  final AddProfileUseCase addProfileUseCase;
  final UpdateRelativeUseCase updateRelativeUseCase;
  Status status = Status.LOADING;
  RelativesEntity? relativesEntity;
  UserAction action = UserAction.none;
  final formKey = GlobalKey<FormState>();
  String? selectGender;
  TextEditingController nameController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController hourTimeOfBirthController = TextEditingController();
  TextEditingController minuteTimeOfBirthController = TextEditingController();
  TextEditingController dayOBController = TextEditingController();
  TextEditingController monthOBController = TextEditingController();
  TextEditingController yearOBController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  String meridiem = "AM";
  AllRelatives? selectedRelative;
  String? uid;
  final DeleteReleativeUseCase deleteReleativeUseCase;

  ProfileManager(
      this.allRelativeUseCase,
      this.placesUseCase,
      this.addProfileUseCase,
      this.updateRelativeUseCase,
      this.deleteReleativeUseCase) {
    _initView();
  }

  _initView() async {
    try {
      relativesEntity = await allRelativeUseCase(NoParams());
      status = Status.COMPLETED;
      notifyListeners();
    } catch (ex) {
      print(ex);
      status = Status.ERROR;
      notifyListeners();
    }
  }

  changeUserAction(UserAction userAction) {
    action = userAction;
    notifyListeners();
  }

  addProfile() async {
    try {
      PlacesEntity entity = await placesUseCase(placeOfBirthController.text);
      List name = nameController.text.split(" ");
      String fistName = name.first;
      String lastname = name.length > 1 ? name.last : "";

      AddProfileParams params = AddProfileParams(
          BirthDetailsParams(
              int.parse(dayOBController.text),
              int.parse(monthOBController.text),
              int.parse(yearOBController.text),
              int.parse(hourTimeOfBirthController.text),
              int.parse(minuteTimeOfBirthController.text),
              meridiem),
          BirthPlaceParams(
              entity.data.first.placeName, entity.data.first.placeId),
          fistName,
          lastname,
          selectGender!);
      AddRelativeEntity addRelativeEntity = await addProfileUseCase(params);
      Fluttertoast.showToast(msg: addRelativeEntity.message);
      action = UserAction.none;
      status = Status.LOADING;
      _clearFormData();
      _initView();
      notifyListeners();
    } catch (ex) {
      Fluttertoast.showToast(msg: ex.toString());
    }
  }

  updateProfile() async {
    try {
      PlacesEntity entity = await placesUseCase(placeOfBirthController.text);
      List name = nameController.text.split(" ");
      String fistName = name.first;
      String lastname = name.length > 1 ? name.last : "";

      AddProfileParams params = AddProfileParams(
          BirthDetailsParams(
              int.parse(dayOBController.text),
              int.parse(monthOBController.text),
              int.parse(yearOBController.text),
              int.parse(hourTimeOfBirthController.text),
              int.parse(minuteTimeOfBirthController.text),
              meridiem),
          BirthPlaceParams(
              entity.data.first.placeName, entity.data.first.placeId),
          fistName,
          lastname,
          selectGender!,
          uuid: selectedRelative!.uuid);
      Map addRelativeEntity = await updateRelativeUseCase(params);
      Fluttertoast.showToast(msg: addRelativeEntity["message"]);
      action = UserAction.none;
      status = Status.LOADING;
      selectedRelative = null;
      _clearFormData();
      _initView();
      notifyListeners();
    } catch (ex) {
      Fluttertoast.showToast(msg: ex.toString());
    }
  }

  populateRelativeInfo() {
    if (selectedRelative != null) {
      dayOBController.text = selectedRelative!.birthDetails.dobDay.toString();
      monthOBController.text =
          selectedRelative!.birthDetails.dobMonth.toString();
      yearOBController.text = selectedRelative!.birthDetails.dobYear.toString();
      hourTimeOfBirthController.text =
          selectedRelative!.birthDetails.tobHour.toString();
      minuteTimeOfBirthController.text =
          selectedRelative!.birthDetails.tobMin.toString();
      meridiem = selectedRelative!.birthDetails.meridiem;
      selectGender = selectedRelative!.gender;
      nameController.text = selectedRelative!.fullName;
      placeOfBirthController.text = selectedRelative!.birthPlace.placeName;
      relationController.text = selectedRelative!.relation;
      notifyListeners();
    }
  }

  _clearFormData() {
    dayOBController.clear();
    monthOBController.clear();
    yearOBController.clear();
    hourTimeOfBirthController.clear();
    minuteTimeOfBirthController.clear();
    selectGender = null;
    nameController.clear();
    placeOfBirthController.clear();
    relationController.clear();
    meridiem = "AM";
  }

  deleteRelative()async{
    try{
      await deleteReleativeUseCase(uid!);
      uid = null;
      _initView();
    }catch(ex){}
  }

  toggleMeridiem() {
    if (meridiem == "AM") {
      meridiem = "PM";
    } else {
      meridiem = "AM";
    }
    notifyListeners();
  }
}
