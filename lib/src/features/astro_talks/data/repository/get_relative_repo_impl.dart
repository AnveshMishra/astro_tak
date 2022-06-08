
import 'package:astro_talk/src/features/astro_talks/domain/entities/relatives_entity.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/get_all_relative_repo.dart';

import '../data_sources/remote/astro_tak_api_service.dart';

class GetRelativeRepoImpl extends GetAllRelativeRepo{
  final AstroTakApiService apiService;

  GetRelativeRepoImpl(this.apiService);

  @override
  Future<RelativesEntity> getAllRelative() async{
    return apiService.getAllRelatives();
  }
}