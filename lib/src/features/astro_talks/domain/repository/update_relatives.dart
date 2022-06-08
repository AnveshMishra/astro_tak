
import 'package:astro_talk/src/core/params/add_profile_request_params.dart';

abstract class UpdateRelativeRepo{
  Future<Map> updateRelative(AddProfileParams params);
}