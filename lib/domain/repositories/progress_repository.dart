import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/models/progress/progress_model.dart';

abstract class ProgressRepository {
  Future<BaseResponseModel<ProgressModel>> getDetailProgress(Map<String, dynamic> params);
  Future<BaseResponseModel<Map<String, dynamic>>> submitProgress(
      int projectId, int progressId, Map<String, dynamic> data);
}
