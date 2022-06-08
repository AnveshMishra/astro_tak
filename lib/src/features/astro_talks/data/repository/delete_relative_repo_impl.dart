
import 'package:astro_talk/src/features/astro_talks/domain/repository/delete_releative_repo.dart';

import '../data_sources/remote/astro_tak_api_service.dart';

class DeleteReleativeRepoImpl extends DeleteRelativeRepo{
  final AstroTakApiService apiService;

  DeleteReleativeRepoImpl(this.apiService);

  @override
  Future<Map> deleteRelative(String uuid) {
    return apiService.deleteRelativeApi(uuid);
  }
}