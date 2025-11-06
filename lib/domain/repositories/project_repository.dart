import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/project/get_project_home_model.dart';
import 'package:management_project/data/models/project/project_dashboard_model.dart';
import 'package:management_project/data/models/project/project_detail_model.dart';
import 'package:management_project/data/models/project/project_item_detail_model.dart';

abstract class ProjectRepository {
  Future<BaseResponseModel<ProjectDashboardModel>> getSummaryProject();
  Future<BaseResponseModel<GetProjectHomeModel>> getListProject(Map<String, dynamic> data);
  Future<BaseResponseModel<ProjectDetailModel>> getDetailProject(String projectId);
  Future<BaseResponseModel<ProjectItemDetailModel>> getRincianProject(String projectId);
}
