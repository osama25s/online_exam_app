import 'package:online_exam_app/feature/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:online_exam_app/feature/sign_up/data/models/responses_models/sign_up_response_model.dart';

abstract class SignUpRemoteDataSourceContact {
  Future<SignUpResponseModel> signup(SignUpRequestModel request);
}
