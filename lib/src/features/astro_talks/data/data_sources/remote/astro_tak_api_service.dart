import 'package:astro_talk/src/core/api_provider.dart';
import 'package:astro_talk/src/features/astro_talks/data/models/add_relative_model.dart';
import 'package:astro_talk/src/features/astro_talks/data/models/places_model.dart';

import '../../models/question_category_model.dart';
import '../../models/relatives_model.dart';

class AstroTakApiService {
  final ApiProvider apiProvider;

  AstroTakApiService(this.apiProvider);

  Future<QuestionCategoryModel> getCategory() async {
    final Map<String, dynamic> jsonResponse =
        await apiProvider.get("question/category/all");
    final data = QuestionCategoryModel.fromJson(jsonResponse);
    return data;
  }

  Future<RelativeModel> getAllRelatives() async {
    final Map<String, dynamic> jsonResponse =
        await apiProvider.get("relative/all");
    final data = RelativeModel.fromJson(jsonResponse);
    return data;
  }

  Future<PlacesModel> getPlaces(String input) async {
    final Map<String, dynamic> jsonResponse =
        await apiProvider.get("location/place?inputPlace=$input");
    final data = PlacesModel.fromJson(jsonResponse);
    return data;
  }

  Future<AddRelativeModel> addRelativeModel(Map<String, dynamic> body) async {
    final Map<String, dynamic> jsonResponse =
        await apiProvider.post("relative", body);
    final data = AddRelativeModel.fromJson(jsonResponse);
    return data;
  }

  Future<Map> updateRelativeModel(Map<String, dynamic> body) async {
    String uid = body["uuid"];
    final Map<String, dynamic> jsonResponse =
        await apiProvider.post("relative/update/$uid", body);
    return jsonResponse;
  }

  Future<Map> deleteRelativeApi(String uid) async {
    final Map<String, dynamic> jsonResponse =
    await apiProvider.post("relative/delete/$uid",{});
    return jsonResponse;
  }
}
