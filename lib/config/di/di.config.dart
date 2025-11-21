// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/search_subjects/api/api_service/api_service.dart'
    as _i750;
import '../../feature/search_subjects/api/datasourse/search_subjects_datasourse_impl.dart'
    as _i1065;
import '../../feature/search_subjects/data/datasourse/search_subjects_datasourse_contract.dart'
    as _i5;
import '../../feature/search_subjects/data/repo/search_subjects_repo_impl.dart'
    as _i784;
import '../../feature/search_subjects/domain/repo/search_subjects_repo_contract.dart'
    as _i726;
import '../../feature/search_subjects/domain/usecase/get_subjects_usecase.dart'
    as _i352;
import '../../feature/search_subjects/presentation/view_models/get_subjects_view_model.dart'
    as _i616;
import '../dio_module/dio_module.dart' as _i773;
import '../shared_preferences_module/shared_preferences_module.dart' as _i354;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingletonAsync<_i354.CacheHelper>(() => _i354.CacheHelper.create());
    gh.factory<_i750.ApiService>(() => _i750.ApiService(gh<_i361.Dio>()));
    gh.factory<_i5.SearchSubjectsDataSourceContract>(
      () => _i1065.SearchSubjectsDatasourseImpl(gh<_i750.ApiService>()),
    );
    gh.factory<_i726.SearchSubjectsRepoContract>(
      () => _i784.SearchSubjectsRepoImpl(
        gh<_i5.SearchSubjectsDataSourceContract>(),
      ),
    );
    gh.factory<_i352.GetSubjectsUsecase>(
      () => _i352.GetSubjectsUsecase(gh<_i726.SearchSubjectsRepoContract>()),
    );
    gh.factory<_i616.GetSubjectsViewModel>(
      () => _i616.GetSubjectsViewModel(gh<_i352.GetSubjectsUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
