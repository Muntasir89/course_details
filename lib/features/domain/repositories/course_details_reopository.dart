import 'package:course_details/core/error/failures.dart';
import 'package:course_details/features/domain/entities/course_details.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CourseDetailsRepository {
  Future<Either<Failure, CourseDetails>> getCourseDetails();
}
