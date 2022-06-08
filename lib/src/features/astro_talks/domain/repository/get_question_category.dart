
import '../entities/question_category_entity.dart';

abstract class GetQuestionCategoryRepository{
  Future<QuestionCategoryEntity> getCategory();
}