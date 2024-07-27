import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mvvm_getx_pattern/app/providers/base_provider.dart';

class DashboardProvider extends BaseProvider {
  Future<Response> getDashboard() async {
    return await post('/dashboard/count', {});
  }
}
