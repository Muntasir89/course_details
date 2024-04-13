import 'package:course_details/features/domain/entities/lesson.dart';

class Section {
  final int id;
  final String topic;
  final List<Lesson> lessonsList;

  Section({
    required this.id,
    required this.topic,
    required this.lessonsList,
  });
}
