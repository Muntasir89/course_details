import 'package:get/get.dart';

class ExpandShrinkController extends GetxController {
  final isDescriptionTextExpanded = RxBool(false);

  void changeDescriptionTextExpansion() {
    isDescriptionTextExpanded.value = !isDescriptionTextExpanded.value;
  }
}
