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

import '../../features/forget_password/api/api_service/api_service.dart'
    as _i533;
import '../../features/forget_password/api/datasources/datasources_impl.dart'
    as _i110;
import '../../features/forget_password/data/datasources/forget_password_datasources_contract.dart'
    as _i108;
import '../../features/forget_password/data/repo/forget_password_repo_imp.dart'
    as _i32;
import '../../features/forget_password/domain/repo/forget_password_repo_contract.dart'
    as _i665;
import '../../features/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i535;
import '../../features/forget_password/domain/usecases/reset_password_usecase.dart'
    as _i966;
import '../../features/forget_password/domain/usecases/verify_reset_code_usecase.dart'
    as _i302;
import '../../features/forget_password/presentation/view_models/forget_password/forget_password_view_model.dart'
    as _i223;
import '../../features/forget_password/presentation/view_models/reset_password/reset_password_view_model.dart'
    as _i402;
import '../../features/forget_password/presentation/view_models/verify_code/verify_code_view_model.dart'
    as _i42;
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
    gh.lazySingleton<_i533.ApiService>(() => _i533.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i108.ForgetPasswordDataSourcesContract>(
      () => _i110.DatasourcesImpl(gh<_i533.ApiService>()),
    );
    gh.lazySingleton<_i665.ForgetPasswordRepoContract>(
      () => _i32.ForgetPasswordRepoImp(
        gh<_i108.ForgetPasswordDataSourcesContract>(),
      ),
    );
    gh.factory<_i535.ForgetPasswordUsecase>(
      () => _i535.ForgetPasswordUsecase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i966.ResetPasswordUsecase>(
      () => _i966.ResetPasswordUsecase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i302.VerifyResetCodeUsecase>(
      () =>
          _i302.VerifyResetCodeUsecase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i402.ResetPasswordViewModel>(
      () => _i402.ResetPasswordViewModel(gh<_i966.ResetPasswordUsecase>()),
    );
    gh.factory<_i42.VerifyCodeViewModel>(
      () => _i42.VerifyCodeViewModel(
        gh<_i302.VerifyResetCodeUsecase>(),
        gh<_i535.ForgetPasswordUsecase>(),
      ),
    );
    gh.factory<_i223.ForgetPasswordViewModel>(
      () => _i223.ForgetPasswordViewModel(gh<_i535.ForgetPasswordUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
