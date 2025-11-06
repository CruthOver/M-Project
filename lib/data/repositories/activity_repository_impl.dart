import 'package:management_project/data/models/activity/activity_model.dart';
import 'package:management_project/data/models/base/base_response_model.dart';
import 'package:management_project/data/remotes/services/activity_service.dart';
import 'package:management_project/domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl extends ActivityRepository {
  @override
  Future<BaseResponseModel<List<ActivityModel>>> getListActivity() async {
    final response = await ActivityService().getListActivity();
    List<ActivityModel> model = List.from(response.data.map((e) => ActivityModel.fromJson(e)));
    return BaseResponseModel(
      data: model,
      meta: response.meta,
      success: response.success,
    );
  }
}
