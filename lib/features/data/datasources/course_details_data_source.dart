import 'dart:convert';

import 'package:course_details/core/error/exceptions.dart';
import 'package:course_details/features/data/course_details_models/course_details_model.dart';
import 'package:http/http.dart' as http;

abstract interface class CourseDetailsRemoteDataSource {
  Future<CourseDetailsModel> getCourseDetails();
}

class CourseDetailsRemoteDataSourceImpl
    implements CourseDetailsRemoteDataSource {
  @override
  Future<CourseDetailsModel> getCourseDetails() async {
    try {
      final response = await http.get(
          Uri.parse(
              "https://getlearn-admin.getbuildfirst.com/api/course/details/1"),
          headers: {"Content-Type": "application/json"});
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return CourseDetailsModel.fromJson(jsonResponse["data"]);
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
