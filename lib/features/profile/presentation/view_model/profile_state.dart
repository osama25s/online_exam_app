import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/profile/domain/entitys/edit_user_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/entitys/get_profile_entity.dart';

class ProfileState {
  // State for Get Profile
  final BaseState<GetProfileEntity> getProfileState;
  
  // State for Edit Profile
  final BaseState<EditUserProfileEntity> editProfileState;

  ProfileState({
    BaseState<GetProfileEntity>? getProfileState,
    BaseState<EditUserProfileEntity>? editProfileState,
  })  : getProfileState = getProfileState ?? BaseState<GetProfileEntity>(),
        editProfileState = editProfileState ?? BaseState<EditUserProfileEntity>();

  ProfileState copyWith({
    BaseState<GetProfileEntity>? getProfileState,
    BaseState<EditUserProfileEntity>? editProfileState,
  }) {
    return ProfileState(
      getProfileState: getProfileState ?? this.getProfileState,
      editProfileState: editProfileState ?? this.editProfileState,
    );
  }
}