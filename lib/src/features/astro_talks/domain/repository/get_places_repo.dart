
import '../entities/places_entity.dart';

abstract class GetPlacesRepo{
  Future<PlacesEntity> getPlaces(String input);
}