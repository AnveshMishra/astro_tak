import 'package:astro_talk/src/core/api_provider.dart';
import 'package:astro_talk/src/features/astro_talks/data/data_sources/remote/astro_tak_api_service.dart';
import 'package:astro_talk/src/features/astro_talks/data/repository/add_relative_repo_impl.dart';
import 'package:astro_talk/src/features/astro_talks/data/repository/delete_relative_repo_impl.dart';
import 'package:astro_talk/src/features/astro_talks/data/repository/get_places_repo_impl.dart';
import 'package:astro_talk/src/features/astro_talks/data/repository/get_question_category_repo_impl.dart';
import 'package:astro_talk/src/features/astro_talks/data/repository/get_relative_repo_impl.dart';
import 'package:astro_talk/src/features/astro_talks/data/repository/update_relative_repo_impl.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/add_relative_repo.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/delete_releative_repo.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/get_all_relative_repo.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/get_places_repo.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/get_question_category.dart';
import 'package:astro_talk/src/features/astro_talks/domain/repository/update_relatives.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/add_profile_use_case.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/delete_releative_use_case.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/get_all_relative_use_case.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/get_categaory_usecase.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/get_places_usecase.dart';
import 'package:astro_talk/src/features/astro_talks/domain/use_cases/update_relative_use_case.dart';
import 'package:astro_talk/src/features/astro_talks/presentation/state_manager/profile_manager.dart';
import 'package:get_it/get_it.dart';

import 'src/features/astro_talks/presentation/state_manager/home_manager.dart';

final injector = GetIt.instance;

Future<void> initDependency() async {
  ///Remote_data
  injector.registerSingleton<ApiProvider>(ApiProvider());
  injector
      .registerSingleton<AstroTakApiService>(AstroTakApiService(injector()));

  ///repository
  injector.registerSingleton<GetQuestionCategoryRepository>(
      GetQuestionCategoryRepoImpl(injector()));
  injector
      .registerSingleton<GetAllRelativeRepo>(GetRelativeRepoImpl(injector()));
  injector.registerSingleton<GetPlacesRepo>(GetPlacesRepoImpl(injector()));
  injector.registerSingleton<AddRelativeRepo>(AddRelativeRepoImpl(injector()));
  injector.registerSingleton<UpdateRelativeRepo>(UpdateRelativeRepoImpl(injector()));
  injector.registerSingleton<DeleteRelativeRepo>(DeleteReleativeRepoImpl(injector()));


  ///use_cases
  injector
      .registerSingleton<GetCategoryUseCase>(GetCategoryUseCase(injector()));
  injector.registerSingleton<GetAllRelativeUseCase>(
      GetAllRelativeUseCase(injector()));
  injector.registerSingleton<GetPlacesUseCase>(GetPlacesUseCase(injector()));
  injector.registerSingleton<AddProfileUseCase>(AddProfileUseCase(injector()));
  injector.registerSingleton<UpdateRelativeUseCase>(UpdateRelativeUseCase(injector()));
  injector.registerSingleton<DeleteReleativeUseCase>(DeleteReleativeUseCase(injector()));

  ///State_managers
  injector.registerSingleton<HomeManager>(HomeManager(injector()));
  // injector.registerSingleton<ProfileManager>(ProfileManager(injector()));
}
