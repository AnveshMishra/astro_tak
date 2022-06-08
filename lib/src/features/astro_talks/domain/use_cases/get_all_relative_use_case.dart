
import 'package:astro_talk/src/core/use_cases.dart';
import 'package:astro_talk/src/features/astro_talks/domain/entities/relatives_entity.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/get_all_relative_repo.dart';

class GetAllRelativeUseCase extends UseCase<RelativesEntity,NoParams>{
  final GetAllRelativeRepo repository;

  GetAllRelativeUseCase(this.repository);
  @override
  Future<RelativesEntity> call(NoParams params) async{
    return await repository.getAllRelative();
  }
}