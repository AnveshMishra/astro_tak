
import 'package:astro_talk/src/core/use_cases.dart';

import '../entities/question_category_entity.dart';
import '../repository/get_question_category.dart';

class GetCategoryUseCase extends UseCase<QuestionCategoryEntity,NoParams>{
  final GetQuestionCategoryRepository repository;
  GetCategoryUseCase(this.repository);
  @override
  Future<QuestionCategoryEntity> call(NoParams params) {
    return repository.getCategory();
  }
}