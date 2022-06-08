import 'package:astro_talk/src/features/astro_talks/domain/entities/question_category_entity.dart';

class QuestionCategoryModel extends QuestionCategoryEntity {
  QuestionCategoryModel(
      {required super.httpStatus,
      required super.httpStatusCode,
      required super.success,
      required super.message,
      required super.data});

  factory QuestionCategoryModel.fromJson(Map json) {
    return QuestionCategoryModel(
        httpStatus: json["httpStatus"],
        data: (json['data'] as List).map((e) => Data.fromJson(e)).toList(),
        message: json['message'],
        success: json['success'],
        httpStatusCode: json['httpStatusCode']);
  }
}
