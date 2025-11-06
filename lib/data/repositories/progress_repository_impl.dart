import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/progress/progress_model.dart';
import 'package:management_project/data/remotes/services/progress_service.dart';
import 'package:management_project/domain/repositories/progress_repository.dart';

class ProgressRepositoryImpl extends ProgressRepository {
  @override
  Future<BaseResponseModel<ProgressModel>> getDetailProgress(Map<String, dynamic> params) async {
    final response = await ProgressService().getProgressDetail(params);
    ProgressModel model = ProgressModel.fromJson(response.data);
    return BaseResponseModel(
      data: model,
      success: response.success,
      meta: response.meta,
    );
  }

  @override
  Future<BaseResponseModel<Map<String, dynamic>>> submitProgress(
      int projectId, int progressId, Map<String, dynamic> data) async {
    final response = await ProgressService()
        .submitProgress(projectId: projectId, progressId: progressId, data: data);
    // ProgressModel model = ProgressModel.fromJson(response.data);
    return BaseResponseModel(
      data: response.data,
      success: response.success,
      meta: response.meta,
    );
  }
}
