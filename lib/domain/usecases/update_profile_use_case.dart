import 'package:management_project/application/core/usecase/usecase.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase
    extends UseCase<BaseResponseModel<Map<String, dynamic>>, Map<String, dynamic>> {
  final ProfileRepository profileRepository;

  UpdateProfileUseCase(this.profileRepository);

  @override
  Future<BaseResponseModel<Map<String, dynamic>>> execute(Map<String, dynamic> params) async {
    return await profileRepository.updateProfile(params);
  }
}
