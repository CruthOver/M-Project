import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/remotes/base_services.dart';
import 'package:management_project/data/remotes/endpoint.dart';

class ProgressService extends BaseServices {
  Future<BaseResponseModel> getProgressDetail(Map<String, dynamic> params) async {
    return await getData(EndPoint.endPointDetailProgress
        .replaceAll("{proyek_id}", params['project_id'])
        .replaceAll("{progress_id}", params['progress_id']));
  }

  Future<BaseResponseModel> submitProgress(
      {required int projectId, required int progressId, required Map<String, dynamic> data}) async {
    return await postData(
        EndPoint.endPointSubmitProgress
            .replaceAll("{proyek_id}", projectId.toString())
            .replaceAll("{progress_id}", progressId.toString()),
        data,
        isExistFile: true,
        isFormData: true);
  }
}
