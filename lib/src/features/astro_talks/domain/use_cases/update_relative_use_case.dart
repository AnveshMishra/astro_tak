
import 'package:astro_talk/src/core/params/add_profile_request_params.dart';
import 'package:astro_talk/src/core/use_cases.dart';

import '../repository/update_relatives.dart';

class UpdateRelativeUseCase extends UseCase<Map,AddProfileParams>{
  final UpdateRelativeRepo updateRelativeRepo;

  UpdateRelativeUseCase(this.updateRelativeRepo);
  @override
  Future<Map> call(AddProfileParams params) async{
    return updateRelativeRepo.updateRelative(params);
  }
}