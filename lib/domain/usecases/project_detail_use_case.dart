import 'package:management_project/application/core/usecase/usecase.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/project/project_detail_model.dart';
import 'package:management_project/domain/repositories/project_repository.dart';

class ProjectDetailUseCase extends UseCase<BaseResponseModel<ProjectDetailModel>, String> {
  final ProjectRepository projectRepository;

  ProjectDetailUseCase(this.projectRepository);

  @override
  Future<BaseResponseModel<ProjectDetailModel>> execute(String params) async {
    return await projectRepository.getDetailProject(params);
  }
}
