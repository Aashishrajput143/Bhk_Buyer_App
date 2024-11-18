import 'package:bhk_buyer_app/data/app_url/app_url.dart';
import 'package:bhk_buyer_app/data/network/network_api_services.dart';
import 'package:bhk_buyer_app/model/getcategorymodel.dart';

class CategoryRepository {
  final _apiServices = NetworkApiServices();

  Future<GetCategoryModel> getcategoryApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.getcategory);
    return GetCategoryModel.fromJson(response);
  }
}
