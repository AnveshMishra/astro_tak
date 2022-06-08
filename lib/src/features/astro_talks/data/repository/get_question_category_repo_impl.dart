
import 'package:astro_talk/src/features/astro_talks/data/data_sources/remote/astro_tak_api_service.dart';
import 'package:astro_talk/src/features/astro_talks/domain/entities/question_category_entity.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/get_question_category.dart';

class GetQuestionCategoryRepoImpl implements GetQuestionCategoryRepository{

  final AstroTakApiService apiService;
  GetQuestionCategoryRepoImpl(this.apiService);
  @override
  Future<QuestionCategoryEntity> getCategory() async{
    return apiService.getCategory();
  }
}