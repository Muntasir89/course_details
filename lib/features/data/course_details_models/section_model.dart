import 'package:course_details/features/data/course_details_models/lesson_model.dart';
import 'package:course_details/features/domain/entities/section.dart';

class SectionModel extends Section {
  SectionModel({
    required super.id,
    required super.topic,
    required super.lessonsList,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    List<LessonModel> lessonsList = <LessonModel>[];
    if (json['lessons'] != null) {
      json['lessons']
          .forEach((lesson) => lessonsList.add(LessonModel.fromJson(lesson)));
    }
    print("lessonsList length: ${lessonsList.length}");
    return SectionModel(
      id: json["id"] ?? 0,
      topic: json['topic'] ?? "",
      lessonsList: lessonsList,
    );
  }
}
