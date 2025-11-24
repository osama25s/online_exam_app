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

import '../../features/get_all_exams_on_subject/api/api_service/api_service.dart'
    as _i836;
import '../../features/get_all_exams_on_subject/api/datasources/get_exams_datasources_impl.dart'
    as _i806;
import '../../features/get_all_exams_on_subject/data/datasources/get_exams_datasources_contract.dart'
    as _i346;
import '../../features/get_all_exams_on_subject/data/repo/exam_repo_impl.dart'
    as _i827;
import '../../features/get_all_exams_on_subject/domain/repo/exam_repo_contract.dart'
    as _i820;
import '../../features/get_all_exams_on_subject/domain/usecases/get_exams_usecase.dart'
    as _i709;
import '../../features/get_all_exams_on_subject/presentation/view_models/get_exams_view_model.dart'
    as _i522;
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
    gh.factory<_i836.ApiService>(() => _i836.ApiService(gh<_i361.Dio>()));
    gh.factory<_i346.GetExamsDatasourcesContract>(
      () => _i806.GetExamsDatasourcesImpl(gh<_i836.ApiService>()),
    );
    gh.factory<_i820.ExamRepoContract>(
      () => _i827.ExamRepoImpl(gh<_i346.GetExamsDatasourcesContract>()),
    );
    gh.factory<_i709.GetExamsUsecase>(
      () =>
          _i709.GetExamsUsecase(examRepoContract: gh<_i820.ExamRepoContract>()),
    );
    gh.factory<_i522.GetExamsViewModel>(
      () => _i522.GetExamsViewModel(gh<_i709.GetExamsUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
