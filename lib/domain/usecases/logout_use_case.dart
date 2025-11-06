import 'package:management_project/application/core/usecase/usecase_no_param.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/domain/repositories/auth_repository.dart';

class LogoutUseCase extends UseCaseNoParam<BaseResponseModel<Map<String, dynamic>>> {
  final AuthRepository authRepository;
  LogoutUseCase(this.authRepository);
  @override
  Future<BaseResponseModel<Map<String, dynamic>>> execute() async {
    return authRepository.logout();
  }
}
