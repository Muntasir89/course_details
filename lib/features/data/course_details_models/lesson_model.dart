import 'package:course_details/features/domain/entities/lesson.dart';

class LessonModel extends Lesson {
  LessonModel({
    required super.id,
    required super.lectureTitle,
    required super.isVideoLecture,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] ?? '',
      lectureTitle: json['lecture_title'] ?? "",
      isVideoLecture: json.containsKey('video_link_path'),
    );
  }
}
