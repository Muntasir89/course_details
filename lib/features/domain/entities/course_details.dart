import 'package:course_details/features/domain/entities/lesson.dart';
import 'package:course_details/features/domain/entities/section.dart';

class CourseDetails {
  final int id;
  final String title;
  final String subtitle;
  final String categoryId;
  final double price;
  final List<String> learningTopics;
  final String lastUpdated;
  final List<Section> sectionsList;
  final String requirements;
  final String description;

  CourseDetails({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.categoryId,
    required this.price,
    required this.learningTopics,
    required this.lastUpdated,
    required this.sectionsList,
    required this.requirements,
    required this.description,
  });
}
