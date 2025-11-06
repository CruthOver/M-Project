import 'package:management_project/application/core/usecase/usecase.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/user/user_model.dart';
import 'package:management_project/domain/repositories/auth_repository.dart';

class LoginUseCase extends UseCase<BaseResponseModel<UserModel>, Map<String, dynamic>> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);
  @override
  Future<BaseResponseModel<UserModel>> execute(Map<String, dynamic> params) async {
    return await authRepository.signIn(params);
  }
}
