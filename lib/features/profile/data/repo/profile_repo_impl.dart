import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/features/profile/data/datasource/profile_datasource_contract.dart';
import 'package:online_exam_app/features/profile/data/mapper/user_model_mapper.dart';
import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';
import 'package:online_exam_app/features/profile/domain/entitys/edit_user_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/entitys/get_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/repo/profile_repo_contract.dart';

@LazySingleton(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  final ProfileDatasourceContract _profileDatasourceContract;
  final UserModelMapper _mapper;
  ProfileRepoImpl(this._profileDatasourceContract, this._mapper);
  @override
  Future<BaseResponse<EditUserProfileEntity>> editProfile(
    EditProfileRequestModel request,
  ) async {
    try {
      final response = await _profileDatasourceContract.editProfile(request);

      return response.when(
        success: (data) {
          final entity = _mapper.mapToEntity(data);
          return BaseResponse.success(entity);
        },
        failure: (error) {
          return BaseResponse.failure(error);
        },
      );
    } catch (error) {
      return BaseResponse.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<BaseResponse<GetProfileEntity>> getProfile() async {
    final response = await _profileDatasourceContract.getProfile();
    return response.when(
      success: (data) {
        final entity = _mapper.mapToGetProfileEntity(data);
        return BaseResponse.success(entity);
      },
      failure: (error) {
        return BaseResponse.failure(ErrorHandler.handle(error));
      },
    );
  }
}
