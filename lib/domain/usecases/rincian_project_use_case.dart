import 'package:management_project/application/core/usecase/usecase.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/project/project_item_detail_model.dart';
import 'package:management_project/domain/repositories/project_repository.dart';

class RincianProjectUseCase extends UseCase<BaseResponseModel<ProjectItemDetailModel>, String> {
  final ProjectRepository projectRepository;

  RincianProjectUseCase(this.projectRepository);

  @override
  Future<BaseResponseModel<ProjectItemDetailModel>> execute(String params) async {
    return await projectRepository.getRincianProject(params);
  }
}
