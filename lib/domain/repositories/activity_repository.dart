import 'package:management_project/data/models/activity/activity_model.dart';
import 'package:management_project/data/models/base/base_response_model.dart';

abstract class ActivityRepository {
  Future<BaseResponseModel<List<ActivityModel>>> getListActivity();
}
