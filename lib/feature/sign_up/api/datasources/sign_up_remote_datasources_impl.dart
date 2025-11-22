import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/config/error_handler/error_handler.dart';
import 'package:online_exam_app/feature/sign_up/api/api_service/api_service.dart';
import 'package:online_exam_app/feature/sign_up/data/datasources/sign_up_remote_datasource_contract.dart';
import 'package:online_exam_app/feature/sign_up/data/models/requests_models/sign_up_request_model.dart';
import 'package:online_exam_app/feature/sign_up/data/models/responses_models/sign_up_response_model.dart';
@Injectable(as: SignUpRemoteDataSourceContact)
class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSourceContact {
  final ApiService _apiService;

  SignUpRemoteDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<SignUpResponseModel>> signup(SignUpRequestModel request) async {
    try {
      final response = await _apiService.signup(request);

    
      return BaseResponse.success(response);
    } catch (e) {
      
      //final errorHandler = ErrorHandler.handle(e);
      return BaseResponse.failure(ErrorHandler.handle(e));
    }
  }
}
