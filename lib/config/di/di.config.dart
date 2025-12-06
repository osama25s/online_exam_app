// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/login/api/api_service/api_service.dart' as _i411;
import '../../features/login/api/datasources_impl/login_datasource_impl.dart'
    as _i1072;
import '../../features/login/data/datasources/login_datasource_contract.dart'
    as _i510;
import '../../features/login/data/repos/login_repo_impl.dart' as _i937;
import '../../features/login/domain/repos/login_repo_contract.dart' as _i909;
import '../../features/login/domain/usecases/do_login_usecase.dart' as _i197;
import '../../features/login/presentation/view_model/cubit/login_cubit.dart'
    as _i753;
import '../../features/sign_up/api/api_service/api_service.dart' as _i62;
import '../../features/sign_up/api/datasources/sign_up_remote_datasources_impl.dart'
    as _i853;
import '../../features/sign_up/data/datasources/sign_up_remote_datasource_contract.dart'
    as _i331;
import '../../features/sign_up/data/repo/repo_sign_up_impl.dart' as _i804;
import '../../features/sign_up/domian/repo/repo_sign_up_contract.dart' as _i498;
import '../../features/sign_up/domian/usecase/call_sign_up_usecase.dart'
    as _i462;
import '../../features/sign_up/domian/usecase/do_sign_up_usecase.dart' as _i934;
import '../../features/sign_up/presentation/view/screen/sign_up_screen.dart'
    as _i389;
import '../../features/sign_up/presentation/view/view_model/sign_up_cubit.dart'
    as _i755;
import '../dio_module/dio_module.dart' as _i773;
import '../shared_preferences_module/shared_preferences_module.dart' as _i354;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i354.CacheHelper>(
      () => _i354.CacheHelper(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i389.SignUpScreen>(
      () => _i389.SignUpScreen(key: gh<_i409.Key>()),
    );
    gh.lazySingleton<_i411.ApiService>(() => _i411.ApiService(gh<_i361.Dio>()));
    gh.factory<_i62.ApiService>(() => _i62.ApiService(gh<_i361.Dio>()));
    gh.factory<_i331.SignUpRemoteDataSourceContact>(
      () => _i853.SignUpRemoteDataSourceImpl(gh<_i62.ApiService>()),
    );
    gh.factory<_i510.LoginDatasourceContract>(
      () => _i1072.LoginDatasourceImpl(gh<_i411.ApiService>()),
    );
    gh.factory<_i498.RepoSignUpContract>(
      () => _i804.RepoSignUpImpl(gh<_i331.SignUpRemoteDataSourceContact>()),
    );
    gh.factory<_i934.DoSignUpUsecase>(
      () => _i934.DoSignUpUsecase(gh<_i498.RepoSignUpContract>()),
    );
    gh.factory<_i909.LoginRepoContract>(
      () => _i937.LoginRepoImpl(gh<_i510.LoginDatasourceContract>()),
    );
    gh.factory<_i462.CallSignUpUseCase>(
      () => _i462.CallSignUpUseCase(gh<_i498.RepoSignUpContract>()),
    );
    gh.factory<_i755.SignUpCubit>(
      () => _i755.SignUpCubit(gh<_i934.DoSignUpUsecase>()),
    );
    gh.factory<_i197.DoLoginUsecase>(
      () => _i197.DoLoginUsecase(gh<_i909.LoginRepoContract>()),
    );
    gh.factory<_i753.LoginCubit>(
      () =>
          _i753.LoginCubit(gh<_i197.DoLoginUsecase>(), gh<_i354.CacheHelper>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i354.SharedPreferencesModule {}

class _$DioModule extends _i773.DioModule {}
