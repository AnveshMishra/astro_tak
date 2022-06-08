
import '../entities/relatives_entity.dart';

abstract class GetAllRelativeRepo{
  Future<RelativesEntity> getAllRelative();
}