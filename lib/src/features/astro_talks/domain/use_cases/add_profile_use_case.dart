
import 'package:astro_talk/src/core/params/add_profile_request_params.dart';
import 'package:astro_talk/src/core/use_cases.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/add_relative_repo.dart';

import '../entities/add_relative_entity.dart';

class AddProfileUseCase extends UseCase<AddRelativeEntity,AddProfileParams>{
  final AddRelativeRepo addRelativeRepo;

  AddProfileUseCase(this.addRelativeRepo);
  @override
  Future<AddRelativeEntity> call(AddProfileParams params) async{
    return addRelativeRepo.getAllRelative(params);
  }
}