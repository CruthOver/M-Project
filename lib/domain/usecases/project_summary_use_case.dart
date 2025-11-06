import 'package:management_project/application/core/usecase/usecase_no_param.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/project/project_dashboard_model.dart';
import 'package:management_project/domain/repositories/project_repository.dart';

class ProjectSummaryUseCase extends UseCaseNoParam<BaseResponseModel<ProjectDashboardModel>> {
  final ProjectRepository projectRepository;

  ProjectSummaryUseCase(this.projectRepository);

  @override
  Future<BaseResponseModel<ProjectDashboardModel>> execute() {
    return projectRepository.getSummaryProject();
  }
}
