import 'package:management_project/application/core/usecase/usecase.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/progress/progress_model.dart';
import 'package:management_project/domain/repositories/progress_repository.dart';

class ProgressDetailUseCase
    extends UseCase<BaseResponseModel<ProgressModel>, Map<String, dynamic>> {
  final ProgressRepository progressRepository;

  ProgressDetailUseCase(this.progressRepository);
  @override
  Future<BaseResponseModel<ProgressModel>> execute(Map<String, dynamic> params) async {
    return await progressRepository.getDetailProgress(params);
  }
}
