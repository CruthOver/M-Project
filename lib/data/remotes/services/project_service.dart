import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/remotes/base_services.dart';
import 'package:management_project/data/remotes/endpoint.dart';

class ProjectService extends BaseServices {
  Future<BaseResponseModel> getSummaryProject() async {
    return await getData(EndPoint.endPointProjectSummary);
  }

  Future<BaseResponseModel> getProjectList(Map<String, dynamic> query) async {
    return await getData(EndPoint.endPointProject, query: query);
  }

  Future<BaseResponseModel> getProjectDetail(String projectId) async {
    return await getData(EndPoint.endPointDetailProject.replaceAll("{proyek_id}", projectId));
  }

  Future<BaseResponseModel> getRincianProject(String projectId) async {
    return await getData(EndPoint.endPointRincianProject.replaceAll("{proyek_id}", projectId));
  }
}
