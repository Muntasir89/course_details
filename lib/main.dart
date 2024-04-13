import 'package:course_details/features/data/datasources/course_details_data_source.dart';
import 'package:course_details/features/data/repositories/course_details_repository_impl.dart';
import 'package:course_details/features/domain/repositories/course_details_reopository.dart';
import 'package:course_details/features/domain/usecases/get_course_details.dart';
import 'package:course_details/features/presentation/controllers/course_details_controller.dart';
import 'package:course_details/features/presentation/controllers/expand_shrink_controller.dart';
import 'package:course_details/features/presentation/controllers/media_player_controller.dart';
import 'package:course_details/features/presentation/pages/course_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeBinding();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Details',
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => CourseDetailsPage(),
        )
      ],
    );
  }
}

void initializeBinding() {
  Get.lazyPut<CourseDetailsRemoteDataSource>(
      () => CourseDetailsRemoteDataSourceImpl());
  Get.lazyPut<CourseDetailsRepository>(
      () => CourseDetailsRepositoryImpl(Get.find()));
  Get.lazyPut(() => GetCourseDetailsUsecase(Get.find()));
  Get.lazyPut(() => CourseDetailsController(Get.find()));
  Get.lazyPut(() => ExpandShrinkController());
  Get.lazyPut(() => MediaPlayerController());
}
