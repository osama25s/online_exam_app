import 'package:injectable/injectable.dart';
import 'package:online_exam_app/feature/sign_up/api/api_service/api_service.dart';
import 'package:online_exam_app/feature/sign_up/data/datasources/sign_up_remote_datasource_contract.dart';
import 'package:online_exam_app/feature/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:online_exam_app/feature/sign_up/data/models/responses_models/sign_up_response_model.dart';

@Injectable(as: SignUpRemoteDataSourceContact)
class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSourceContact {
  final ApiService _apiService;

  SignUpRemoteDataSourceImpl(this._apiService);

  @override
  Future<SignUpResponseModel> signup(SignUpRequestModel request) {
    return _apiService.signup(request);
  }
}