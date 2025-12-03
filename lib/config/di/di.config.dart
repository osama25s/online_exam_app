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

import '../../feature/sign_up/api/api_service/api_service.dart' as _i695;
import '../../feature/sign_up/api/datasources/sign_up_remote_datasources_impl.dart'
    as _i257;
import '../../feature/sign_up/data/datasources/sign_up_remote_datasource_contract.dart'
    as _i799;
import '../../feature/sign_up/data/repo/repo_sign_up_impl.dart' as _i295;
import '../../feature/sign_up/domian/repo/repo_sign_up_contract.dart' as _i33;
import '../../feature/sign_up/domian/usecase/call_sign_up_usecase.dart'
    as _i1041;
import '../../feature/sign_up/domian/usecase/do_sign_up_usecase.dart' as _i47;
import '../../feature/sign_up/presentation/view/screen/sign_up_screen.dart'
    as _i547;
import '../../feature/sign_up/presentation/view/view_model/sign_up_cubit.dart'
    as _i674;
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
import '../dio_module/dio_module.dart' as _i773;
import '../shared_preferences_module/shared_preferences_module.dart' as _i354;
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
    gh.lazySingletonAsync<_i354.CacheHelper>(() => _i354.CacheHelper.create());
    gh.factory<_i547.SignUpScreen>(
      () => _i547.SignUpScreen(key: gh<_i409.Key>()),
    );
    gh.factory<_i695.ApiService>(() => _i695.ApiService(gh<_i361.Dio>()));
    gh.factory<_i799.SignUpRemoteDataSourceContact>(
      () => _i257.SignUpRemoteDataSourceImpl(gh<_i695.ApiService>()),
    );
    gh.factory<_i33.RepoSignUpContract>(
      () => _i295.RepoSignUpImpl(gh<_i799.SignUpRemoteDataSourceContact>()),
    );
    gh.factory<_i47.DoSignUpUsecase>(
      () => _i47.DoSignUpUsecase(gh<_i33.RepoSignUpContract>()),
    );
    gh.factory<_i674.SignUpCubit>(
      () => _i674.SignUpCubit(gh<_i47.DoSignUpUsecase>()),
    );
    gh.factory<_i1041.CallSignUpUseCase>(
      () => _i1041.CallSignUpUseCase(gh<_i33.RepoSignUpContract>()),
    );
    gh.lazySingleton<_i354.CacheHelper>(
      () => _i354.CacheHelper(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i411.ApiService>(() => _i411.ApiService(gh<_i361.Dio>()));
    gh.factory<_i510.LoginDatasourceContract>(
      () => _i1072.LoginDatasourceImpl(gh<_i411.ApiService>()),
    );
    gh.factory<_i909.LoginRepoContract>(
      () => _i937.LoginRepoImpl(gh<_i510.LoginDatasourceContract>()),
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
