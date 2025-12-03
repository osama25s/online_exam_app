import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/sign_up/data/datasources/sign_up_remote_datasource_contract.dart';
import 'package:online_exam_app/features/sign_up/data/models/responses_models/sign_up_response_model.dart';
import 'package:online_exam_app/features/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:online_exam_app/features/sign_up/domian/repo/repo_sign_up_contract.dart';

@Injectable(as: RepoSignUpContract)
class RepoSignUpImpl implements RepoSignUpContract {
  final SignUpRemoteDataSourceContact signUpRemoteDataSourceContact;

  RepoSignUpImpl(this.signUpRemoteDataSourceContact);

  @override
  Future<BaseResponse<SignUpResponseModel>> signup(SignUpRequestModel requestModel) async {


 final response = await signUpRemoteDataSourceContact.signup(requestModel);

return response.map(success:(Success)=>BaseResponse.success(Success.data) ,
 failure: (failure)=>BaseResponse.failure(failure.errorhandeler));

}

}

