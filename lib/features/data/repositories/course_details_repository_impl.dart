// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course_details/core/error/exceptions.dart';
import 'package:course_details/features/data/datasources/course_details_data_source.dart';
import 'package:fpdart/src/either.dart';

import 'package:course_details/core/error/failures.dart';
import 'package:course_details/features/domain/entities/course_details.dart';
import 'package:course_details/features/domain/repositories/course_details_reopository.dart';

class CourseDetailsRepositoryImpl implements CourseDetailsRepository {
  final CourseDetailsRemoteDataSource courseDetailsRemoteDataSource;
  CourseDetailsRepositoryImpl(this.courseDetailsRemoteDataSource);

  @override
  Future<Either<Failure, CourseDetails>> getCourseDetails() async {
    try {
      final courseDetails =
          await courseDetailsRemoteDataSource.getCourseDetails();
      return right(courseDetails);
    } on ServerException catch (error) {
      return left(Failure(error.message));
    }
  }
}
