import 'package:management_project/application/core/usecase/usecase_no_param.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/domain/repositories/activity_repository.dart';

class GetActivityUseCase extends UseCaseNoParam<BaseResponseModel> {
  final ActivityRepository activityRepository;

  GetActivityUseCase(this.activityRepository);

  @override
  Future<BaseResponseModel> execute() async {
    return await activityRepository.getListActivity();
  }
}
