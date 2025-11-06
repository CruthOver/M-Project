import 'package:management_project/application/core/usecase/usecase.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/project/get_project_home_model.dart';
import 'package:management_project/domain/repositories/project_repository.dart';

class ProjectListUseCase
    extends UseCase<BaseResponseModel<GetProjectHomeModel>, Map<String, dynamic>> {
  final ProjectRepository projectRepository;

  ProjectListUseCase(this.projectRepository);

  @override
  Future<BaseResponseModel<GetProjectHomeModel>> execute(Map<String, dynamic> params) async {
    return await projectRepository.getListProject(params);
  }
}
