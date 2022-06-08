
import 'package:astro_talk/src/core/use_cases.dart';
import 'package:astro_talk/src/features/astro_talks/domain/entities/places_entity.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/get_places_repo.dart';

class GetPlacesUseCase extends UseCase<PlacesEntity,String>{
  final GetPlacesRepo getPlacesRepo;

  GetPlacesUseCase(this.getPlacesRepo);
  @override
  Future<PlacesEntity> call(String params) async{
    return getPlacesRepo.getPlaces(params);
  }
}