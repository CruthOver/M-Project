import 'package:flutter/material.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/project/get_project_home_model.dart';
import 'package:management_project/data/models/project/project_dashboard_model.dart';
import 'package:management_project/data/models/project/project_detail_model.dart';
import 'package:management_project/data/models/project/project_item_detail_model.dart';
import 'package:management_project/data/remotes/services/project_service.dart';
import 'package:management_project/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  @override
  Future<BaseResponseModel<ProjectDashboardModel>> getSummaryProject() async {
    final response = await ProjectService().getSummaryProject();
    debugPrint("Response : ${response.data}");
    ProjectDashboardModel model = ProjectDashboardModel.fromJson(response.data);
    return BaseResponseModel(
      data: model,
      meta: response.meta,
      success: response.success,
    );
  }

  @override
  Future<BaseResponseModel<GetProjectHomeModel>> getListProject(Map<String, dynamic> data) async {
    final response = await ProjectService().getProjectList(data);
    GetProjectHomeModel model = GetProjectHomeModel.fromJson(response.data);
    return BaseResponseModel(
      data: model,
      meta: response.meta,
      success: response.success,
    );
  }

  @override
  Future<BaseResponseModel<ProjectDetailModel>> getDetailProject(String projectId) async {
    final response = await ProjectService().getProjectDetail(projectId);
    ProjectDetailModel model = ProjectDetailModel.fromJson(response.data);
    return BaseResponseModel(
      data: model,
      meta: response.meta,
      success: response.success,
    );
  }

  @override
  Future<BaseResponseModel<ProjectItemDetailModel>> getRincianProject(String projectId) async {
    final response = await ProjectService().getRincianProject(projectId);
    ProjectItemDetailModel model = ProjectItemDetailModel.fromJson(response.data);
    return BaseResponseModel(
      data: model,
      meta: response.meta,
      success: response.success,
    );
  }
}
