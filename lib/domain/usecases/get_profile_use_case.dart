import 'package:management_project/application/core/usecase/usecase_no_param.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/user/user_model.dart';
import 'package:management_project/domain/repositories/profile_repository.dart';

class GetProfileUseCase extends UseCaseNoParam<BaseResponseModel<UserModel>> {
  final ProfileRepository profileRepository;
  GetProfileUseCase(this.profileRepository);
  @override
  Future<BaseResponseModel<UserModel>> execute() async {
    return await profileRepository.getProfile();
  }
}
