// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:founder_app/common/constants/api/apiconfig.dart';
import 'package:founder_app/model/article/article_model.dart';
import 'package:founder_app/utils/error-popup/snackbar.dart';
import 'package:founder_app/utils/exceptions/exceptions.dart';

class ArticleService {
  var dio = Dio();
  // String path = ApiConfig().baseUrl + ApiConfig().getArticleapi;
  Future<List<Article>?> getArticleService(BuildContext context) async {
    try {
      Response response =
          await dio.get(ApiConfig().baseUrl + ApiConfig().getArticleapi);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['articles'];
        final res = data.map((e) => Article.fromJson(e)).toList();
        log(res.toString(), name: 'article');
        return res;
      } else if (response.statusCode == 501) {
        SnackbarPopUps.popUpB("Could not Retrieve data", context);
        // return false;
      }
    } on DioError catch (e) {
      DioException().dioError(e, context);
      log(e.toString());
    }
    log("null");
    return null;
  }
}
