// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/src/either.dart';

import 'package:course_details/core/error/failures.dart';
import 'package:course_details/core/usecase/usecase.dart';
import 'package:course_details/features/domain/entities/course_details.dart';
import 'package:course_details/features/domain/repositories/course_details_reopository.dart';

class GetCourseDetailsUsecase implements UseCase<CourseDetails, NoParams> {
  final CourseDetailsRepository courseDetailsRepository;
  GetCourseDetailsUsecase(this.courseDetailsRepository);

  @override
  Future<Either<Failure, CourseDetails>> call(NoParams params) async {
    return await courseDetailsRepository.getCourseDetails();
  }
}
