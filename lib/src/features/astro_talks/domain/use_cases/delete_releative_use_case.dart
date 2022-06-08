
import 'package:astro_talk/src/core/use_cases.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/delete_releative_repo.dart';

class DeleteReleativeUseCase extends UseCase<Map,String>{
  final DeleteRelativeRepo deleteRelativeRepo;

  DeleteReleativeUseCase(this.deleteRelativeRepo);
  @override
  Future<Map> call(String params) {
    return deleteRelativeRepo.deleteRelative(params);
  }

}