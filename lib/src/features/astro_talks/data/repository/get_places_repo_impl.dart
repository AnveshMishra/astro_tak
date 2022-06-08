
import 'package:astro_talk/src/features/astro_talks/domain/entities/places_entity.dart';

import '../../domain/repository/get_places_repo.dart';
import '../data_sources/remote/astro_tak_api_service.dart';

class GetPlacesRepoImpl extends GetPlacesRepo{
  final AstroTakApiService apiService;

  GetPlacesRepoImpl(this.apiService);
  @override
  Future<PlacesEntity> getPlaces(String params) {
    return apiService.getPlaces(params);
  }
}