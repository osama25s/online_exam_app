import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';
import 'package:online_exam_app/features/profile/domain/entitys/edit_user_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/entitys/get_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/usecase/edit_profile_usecase.dart';
import 'package:online_exam_app/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/profile_event.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileViewModel(
    this._getProfileUseCase,
    this._editProfileUseCase,
  ) : super(ProfileState());

  final GetProfileUseCase _getProfileUseCase;
  final EditProfileUseCase _editProfileUseCase;

  void doIntent(ProfileEvents event) {
    switch (event) {
      case GetProfileEvent():
        _getProfile();
      case EditProfileEvent():
        _editProfile(event.request);
    }
  }

  /// Get Profile Method
  Future<void> _getProfile() async {
    // Emit Loading State
    emit(
      state.copyWith(
        getProfileState: BaseState<GetProfileEntity>(isLoading: true),
      ),
    );

    // Call Use Case
    BaseResponse<GetProfileEntity> response = await _getProfileUseCase.call();

    // Handle Response
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            getProfileState: BaseState<GetProfileEntity>(
              isLoading: false,
              data: data,
            ),
          ),
        );
      },
      failure: (error) {
       // String errorMessage = "error from function _getProfile in file view model ";
        
        emit(
          state.copyWith(
            getProfileState: BaseState<GetProfileEntity>(
              isLoading: false,
              errorMessage: error.apiErrorModel.message,
            ),
          ),
        );
      },
    );
  }

  /// Edit Profile Method
  Future<void> _editProfile(EditProfileRequestModel request) async {
    // Emit Loading State
    emit(
      state.copyWith(
        editProfileState: BaseState<EditUserProfileEntity>(isLoading: true),
      ),
    );

    // Call Use Case
    BaseResponse<EditUserProfileEntity> response =
        await _editProfileUseCase.call(request);

    // Handle Response
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            editProfileState: BaseState<EditUserProfileEntity>(
              isLoading: false,
              data: data,
            ),
          ),
        );
      },
      failure: (error) {
           String errorMessage = "error from function _editProfile in file view model ";

        emit(
          state.copyWith(
            editProfileState: BaseState<EditUserProfileEntity>(
              isLoading: false,
              errorMessage: errorMessage,
            ),
          ),
        );
      },
    );
  }
}