import 'package:course_details/features/data/course_details_models/section_model.dart';
import 'package:course_details/features/domain/entities/course_details.dart';
import 'package:course_details/features/domain/entities/section.dart';

class CourseDetailsModel extends CourseDetails {
  CourseDetailsModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.categoryId,
    required super.price,
    required super.learningTopics,
    required super.lastUpdated,
    required super.sectionsList,
    required super.requirements,
    required super.description,
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    List<SectionModel> sectionsList = <SectionModel>[];
    if (json["sections"] != null) {
      json["sections"].forEach(
          (section) => sectionsList.add(SectionModel.fromJson(section)));
    }
    print("sectionsList length: ${sectionsList.length}");
    return CourseDetailsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      subtitle: json['sub_title'] ?? '',
      categoryId: json['category_id'] ?? '',
      price: json['price'] ?? 0.0,
      learningTopics: (json['learning_topic'] != null)
          ? json["learning_topic"].cast<String>()
          : <String>[],
      lastUpdated: json['updated_at'] ?? '',
      sectionsList: sectionsList,
      requirements: json['requirements'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
