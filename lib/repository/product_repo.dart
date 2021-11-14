import 'package:v_room_app/models/product_model.dart';
import 'package:v_room_app/network/networkCallback/NetworkCallback.dart';
import 'package:v_room_app/utils/Enums.dart';

class ProductRepository {
  Future<ProductModel> productRequest() async {
    return ProductModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'v3/1243be15-efd5-4132-9bd0-eeb33f325f51',
      method: HttpMethod.GET,
    ));
  }
}
