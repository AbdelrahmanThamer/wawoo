import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/models/response/product_details.dart';
import 'package:woogoods/services/api/api_checker.dart';
import 'package:woogoods/services/repository/product_details_repo.dart';

class ProductDetailsController extends GetxController {
  final ProductDetailsRepo productDetailsRepo;
  ProductDetailsController({
    required this.productDetailsRepo,
  });
  //Init model
  ProductDetails? _details;
  List<String> attr = [];
  //Init
  var isLoading = false.obs;

  ///Encapsulation
  ProductDetails? get product => _details;

  Future<void> fetchProductDetails({
    required String id,
  }) async {
    try {
      isLoading(true);
      log('=================>>product-details log');
      final response = await productDetailsRepo.getProductDetails(
        id: id,
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        ProductDetails posts = ProductDetails.fromJson(body);
        log(response.body);
        if (body.isEmpty) {
          isLoading(false);
          showCustomSnackBar('Details not found');
        }
        if (_details != null) {
          _details = null;
        } else {
          _details = posts;
          getAttribute();
        }
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isLoading(false);
    }
  }

  getAttribute() {
    for (int i = 0; i < product!.attributes!.length; i++) {
      if (product?.attributes![i].name == 'color') {
        attr.assignAll(product!.attributes![i].options!);
      }
    }
    log(attr.toString());
  }
}
