import 'package:bhk_buyer_app/data/app_url/app_url.dart';
import 'package:bhk_buyer_app/data/network/network_api_services.dart';
import 'package:bhk_buyer_app/model/getproductmodel.dart';
import 'package:bhk_buyer_app/model/productdetailsmodel.dart';

class ProductRepository {
  final _apiServices = NetworkApiServices();

  Future<GetProductModel> getproductApi() async {
    dynamic response =
        await _apiServices.getApi("${AppUrl.getproductlisting}?isSeller=true");
    return GetProductModel.fromJson(response);
  }

  Future<ProductDetailsModel> getproductdetailsApi(productId) async {
    dynamic response =
        await _apiServices.getApi("${AppUrl.getproduct}$productId");
    return ProductDetailsModel.fromJson(response);
  }
}
