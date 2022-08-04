import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:woogoods/constants/style_data.dart';
import 'package:woogoods/models/response/parent_category_list.dart';
import 'package:woogoods/services/api/api_checker.dart';
import 'package:woogoods/services/repository/category_repo.dart';

class CategoryController extends GetxController {
  final CategoryRepo categoryRepo;
  CategoryController({required this.categoryRepo});
  //Init model
  List<ParentCategoryList> categoryList = [];
  List<ParentCategoryList> subCategoryList = [];
  List<ParentCategoryList> childCategoryList = [];
  //Init
  var isParentLoading = false.obs;
  var isSubCatLoading = false.obs;
  var isChildCatLoading = false.obs;

  ///Encapsulation
  List<ParentCategoryList> get categoriesList => categoryList;
  List<ParentCategoryList> get subCategoriesList => subCategoryList;
  List<ParentCategoryList> get childCategoriesList => childCategoryList;

  Future<void> fetchParentCatList({String parent = '0'}) async {
    try {
      isParentLoading(true);
      isSubCatLoading(true);
      log('=================>> category log');
      final response = await categoryRepo.getParentCategoryList(
        parent: '0',
      );
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<ParentCategoryList> posts = body
            .map(
              (dynamic item) => ParentCategoryList.fromJson(item),
            )
            .toList();
        log(response.body);
        if (body.isEmpty) {
          isParentLoading(false);
          showCustomSnackBar('No more categories');
        } else {
          categoryList.assignAll(posts);
        }
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isParentLoading(false);
    }
  }

  Future<void> fetchSubCatList(
      {required String parent, bool display = true}) async {
    try {
      isSubCatLoading(true);

      log('=================>>Sub-Category log');
      final response = await categoryRepo.getParentCategoryList(
        parent: parent,
        isSubCat: display,
      );
      if (subCategoryList.isNotEmpty) {
        subCategoryList.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<ParentCategoryList> posts = body
            .map(
              (dynamic item) => ParentCategoryList.fromJson(item),
            )
            .toList();
        log(response.body);
        if (body.isEmpty) {
          isSubCatLoading(false);
          showCustomSnackBar('No Sub-Categories');
        } else {
          subCategoryList.assignAll(posts);
        }
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isSubCatLoading(false);
    }
  }

  Future<void> fetchChildCatList(
      {required String parent, bool display = true}) async {
    try {
      isChildCatLoading(true);
      log('=================>>Child-Category log');
      final response = await categoryRepo.getParentCategoryList(
        parent: parent,
        isSubCat: display,
      );
      if (childCategoryList.isNotEmpty) {
        childCategoryList.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<ParentCategoryList> posts = body
            .map(
              (dynamic item) => ParentCategoryList.fromJson(item),
            )
            .toList();
        log(response.body);
        if (body.isEmpty) {
          isChildCatLoading(false);
          // showCustomSnackBar('No Sub-Categories');
        } else {
          childCategoryList.assignAll(posts);
        }
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isChildCatLoading(false);
    }
  }
}
