import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_smena/layers/models/schemes.dart';
import 'package:test_smena/layers/repositories/repository.dart';

class CategoriesRepository extends ApiRepository {
  Future<ApiResponse<List<Category>?>> getCategories() async {
    return ApiErrorHandler(() async {
      final Response<String> data = await client.get('');
      final items =
          (jsonDecode(data.data ?? '[]') as List).map((e) => Category.fromJson(e)).toList();

      return ApiResponse(body: items, status: data.statusCode!);
    }).result;
  }
}