







import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/login/data/models/responses_models/user_model.dart';
import 'package:online_exam_app/features/profile/data/models/request_models/edit_profile_request_model.dart';
import 'package:online_exam_app/features/profile/data/models/response_models/get_user_response_model.dart';
import 'package:online_exam_app/features/profile/data/models/response_models/user_response_model.dart';
import 'package:online_exam_app/features/profile/domain/entitys/edit_user_profile_entity.dart';
import 'package:online_exam_app/features/profile/domain/entitys/get_profile_entity.dart';

@injectable
class UserModelMapper {
  /// ----------------------------
  /// Convert API Response → Entity
  /// ----------------------------
  EditUserProfileEntity mapToEntity(dynamic response) {
    if (response is UserResponseModel) {
      return _mapFromUserModel(response.user);
    }


    if (response is UserResponseModel) {
      return _mapFromUserModel(response.user);
    }

    if (response is GetUserResponseModel) {
      return _mapFromUserModel(response.user);
    }

    throw Exception("Unknown response type in UserModelMapper");
  }






// في UserModelMapper
GetProfileEntity mapToGetProfileEntity(dynamic response) {
  if (response is UserResponseModel) {
    return _mapToGetProfile(response.user);
  }
  
  if (response is GetUserResponseModel) {
    return _mapToGetProfile(response.user);
  }
  
  throw Exception("Unknown response type");
}




  /// ----------------------------
  /// Convert UserModel → Entity
  /// ----------------------------
  EditUserProfileEntity _mapFromUserModel(UserModel? user) {
    if (user == null) {
      throw Exception("User is null in API response");
    }

    return EditUserProfileEntity(
      id: user.id,
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      phone: user.phone,
      role: user.role,
      isVerified: user.isVerified,
      createdAt: DateTime.tryParse(user.createdAt),
    );
  }

  /// ----------------------------
  /// Convert Entity → EditProfile Request
  /// ----------------------------
  EditProfileRequestModel mapToRequest(EditUserProfileEntity entity) {
    return EditProfileRequestModel(
      username: entity.username,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phone: entity.phone,
    );
  }
}



GetProfileEntity _mapToGetProfile(UserModel? user) {
  if (user == null) {
    throw Exception("User is null in API response");
  }
  
  return GetProfileEntity(
    username: user.username,
    firstName: user.firstName,
    lastName: user.lastName,
    email: user.email,
    phone: user.phone,
  );
}



// import 'package:injectable/injectable.dart';
// import 'package:online_exam_app/feature/data/models/request_models/edit_profile_request_model.dart';
// import 'package:online_exam_app/feature/data/models/response_models/edit_profile_response_model.dart';
// import 'package:online_exam_app/feature/data/models/response_models/get_profile_response_model.dart';
// import 'package:online_exam_app/feature/domain/entitys/user_profile_entity.dart';

// @injectable
// class UserModelMapper {
//   // Map from EditProfile Response to Entity
//   UserProfileEntity mapToEntity(dynamic response) {
//     if (response is EditProfileResponseModel) {
//       return _mapFromEditProfile(response);
//     } else if (response is GetProfileResponseModel) {
//       return _mapFromGetProfile(response);
//     }
//     throw Exception('Unknown response type');
//   }

//   UserProfileEntity _mapFromEditProfile(EditProfileResponseModel response) {
//     if (response.user == null) {
//       throw Exception('User data is null in response');
//     }

//     final user = response.user!;
//     return _createEntity(user);
//   }

//   UserProfileEntity _mapFromGetProfile(GetProfileResponseModel response) {
//     if (response.user == null) {
//       throw Exception('User data is null in response');
//     }

//     final user = response.user!;
//     return _createEntity(user);
//   }

//   UserProfileEntity _createEntity(user) {
//     return UserProfileEntity(
//       id: user.id,
//       username: user.username,
//       firstName: user.firstName,
//       lastName: user.lastName,
//       email: user.email,
//       phone: user.phone,
//       role: user.role,
//       isVerified: user.isVerified,
//       createdAt: user.createdAt != null 
//           ? DateTime.tryParse(user.createdAt!)
//           : null,
//     );
//   }

//   EditProfileRequestModel mapToRequest(UserProfileEntity entity) {
//     return EditProfileRequestModel(
//       username: entity.username,
//       firstName: entity.firstName,
//       lastName: entity.lastName,
//       email: entity.email,
//       phone: entity.phone,
//     );
//   }
// }