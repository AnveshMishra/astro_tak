import 'package:astro_talk/src/core/use_cases.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../domain/entities/question_category_entity.dart';
import '../../domain/use_cases/get_categaory_usecase.dart';

class HomeManager extends ChangeNotifier {
  final GetCategoryUseCase getCategoryUseCase;
  Status status = Status.LOADING;
  QuestionCategoryEntity? categoryEntity;
  String category = "Select category";
  int? price;
  TextEditingController controller = TextEditingController();
  List<String> suggestionList = [];

  HomeManager(this.getCategoryUseCase) {
    _initView();
  }

  _initView() async {
    try {
      categoryEntity = await getCategoryUseCase(NoParams());
      status = Status.COMPLETED;
      notifyListeners();
    } catch (ex) {
      status = Status.ERROR;
      notifyListeners();
    }
  }

  void setCategory(String selectedCategory){
    category = selectedCategory;
    notifyListeners();
  }

  void setPrice(int selectedPrice){
    price = selectedPrice;
    notifyListeners();
  }

  void setSuggestion(List<String> value){
    suggestionList = value;
    notifyListeners();
  }
}
