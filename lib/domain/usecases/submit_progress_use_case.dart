import 'package:management_project/application/core/usecase/usecase.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/domain/repositories/progress_repository.dart';

class SubmitProgressUseCase
    extends UseCase<BaseResponseModel<Map<String, dynamic>>, (int, int, Map<String, dynamic>)> {
  final ProgressRepository progressRepository;
  SubmitProgressUseCase(this.progressRepository);
  @override
  Future<BaseResponseModel<Map<String, dynamic>>> execute(
      (int, int, Map<String, dynamic>) params) async {
    return await progressRepository.submitProgress(params.$1, params.$2, params.$3);
  }
}
