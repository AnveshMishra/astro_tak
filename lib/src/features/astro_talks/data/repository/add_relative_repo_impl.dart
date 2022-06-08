
import 'package:astro_talk/src/core/params/add_profile_request_params.dart';

import 'package:astro_talk/src/features/astro_talks/domain/entities/add_relative_entity.dart';

import '../../domain/repository/add_relative_repo.dart';
import '../data_sources/remote/astro_tak_api_service.dart';

class AddRelativeRepoImpl extends AddRelativeRepo{
  final AstroTakApiService apiService;

  AddRelativeRepoImpl(this.apiService);
  @override
  Future<AddRelativeEntity> getAllRelative(AddProfileParams prams) {
    return apiService.addRelativeModel(prams.toJson());
  }
}