
import 'package:astro_talk/src/core/params/add_profile_request_params.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/update_relatives.dart';

import '../data_sources/remote/astro_tak_api_service.dart';

class UpdateRelativeRepoImpl extends UpdateRelativeRepo{
  final AstroTakApiService apiService;

  UpdateRelativeRepoImpl(this.apiService);

  @override
  Future<Map> updateRelative(AddProfileParams params) async{
    Map<String,dynamic> body = params.toJson();
    return apiService.updateRelativeModel(body);
  }

}