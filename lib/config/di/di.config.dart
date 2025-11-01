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

import '../../feature/sign_up/api/api/api_service.dart' as _i979;
import '../../feature/sign_up/api/datasources/sign_up_remote_datasources_impl.dart'
    as _i257;
import '../../feature/sign_up/data/datasources/sign_up_remote_datasource_contract.dart'
    as _i213;
import '../../feature/sign_up/data/repo/repo_sign_up_impl.dart' as _i295;
import '../../feature/sign_up/domian/repo/repo_sign_up_contract.dart' as _i33;
import '../../feature/sign_up/domian/usecase/call_sign_up_usecase.dart'
    as _i1041;
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
    gh.factory<_i979.ApiService>(() => _i979.ApiService(gh<_i361.Dio>()));
    gh.factory<_i33.RepoSignUpContract>(
      () => _i295.RepoSignUpImpl(gh<_i979.ApiService>()),
    );
    gh.factory<_i213.SignUpRemoteDataSourceContact>(
      () => _i257.SignUpRemoteDataSourceImpl(gh<_i979.ApiService>()),
    );
    gh.factory<_i1041.CallSignUpUseCase>(
      () => _i1041.CallSignUpUseCase(gh<_i33.RepoSignUpContract>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
