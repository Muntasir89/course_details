import 'package:course_details/core/error/exceptions.dart';
import 'package:course_details/core/usecase/usecase.dart';
import 'package:course_details/features/domain/entities/course_details.dart';
import 'package:course_details/features/domain/repositories/course_details_reopository.dart';
import 'package:course_details/features/domain/usecases/get_course_details.dart';
import 'package:get/get.dart';

class CourseDetailsController extends GetxController {
  final GetCourseDetailsUsecase getCourseDetailsUseCase;

  CourseDetailsController(this.getCourseDetailsUseCase);
  final message = RxString("");
  final loading = RxBool(false);
  final courseDetails = Rx<CourseDetails>(
    CourseDetails(
        id: 0,
        title: "",
        subtitle: "",
        categoryId: "",
        price: 0.0,
        learningTopics: <String>[],
        lastUpdated: "",
        sectionsList: [],
        requirements: "",
        description: ""),
  );
  Future<void> getCourseDetails() async {
    loading.value = true;
    final res = await getCourseDetailsUseCase.call(NoParams());
    loading.value = false;
    res.fold((l) {
      message.value = l.message;
      print(l.message);
    }, (r) {
      courseDetails.value = r;
      print(courseDetails);
    });
  }
}
