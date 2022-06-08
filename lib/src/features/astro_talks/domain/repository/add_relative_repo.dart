
import 'package:astro_talk/src/core/params/add_profile_request_params.dart';
import 'package:astro_talk/src/features/astro_talks/domain/entities/add_relative_entity.dart';

abstract class AddRelativeRepo{
  Future<AddRelativeEntity> getAllRelative(AddProfileParams prams);
}