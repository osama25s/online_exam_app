import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';

sealed class ProfileEvents {}

class GetProfileEvent extends ProfileEvents {}
class EditProfileEvent extends ProfileEvents {
  final EditProfileRequestModel request;
    EditProfileEvent(this.request);
}