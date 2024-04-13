import 'dart:math';
import 'package:course_details/core/util/getFirst200Char.dart';
import 'package:course_details/features/presentation/controllers/expand_shrink_controller.dart';
import 'package:intl/intl.dart';

import 'package:course_details/core/theme/app_color.dart';
import 'package:course_details/core/values/app_assets.dart';
import 'package:course_details/core/values/app_strings.dart';
import 'package:course_details/core/values/text_styles.dart';
import 'package:course_details/core/values/values.dart';
import 'package:course_details/features/presentation/controllers/course_details_controller.dart';
import 'package:course_details/features/presentation/widgets/primary_button.dart';
import 'package:course_details/features/presentation/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetailsPage extends StatefulWidget {
  CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  final controller = Get.find<CourseDetailsController>();
  final expandShrinkController = Get.find<ExpandShrinkController>();
  @override
  void initState() {
    super.initState();
    controller.getCourseDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
          size: size25,
          color: whiteColor,
        ),
        title: Text(
          app_title,
          style: appbar_title_font,
        ),
        centerTitle: true,
        actions: [
          const Icon(
            Icons.shopping_cart_rounded,
            size: size25,
            color: whiteColor,
          ),
          gap_h10,
        ],
      ),
      backgroundColor: primaryColor,
      body: Container(
        padding: all15,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(r20),
            topRight: Radius.circular(r20),
          ),
          color: whiteBackgroundColor,
        ),
        child: Obx(
          // ignore: unrelated_type_equality_checks
          () => controller.loading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(r10)),
                              color: primaryColor,
                            ),
                            height: 160,
                          ),
                          SvgPicture.asset(
                            playIcon,
                            color: whiteColor,
                            width: size40,
                            height: size40,
                          ),
                        ],
                      ),
                      gap_v20,
                      // Course Title
                      Text(
                        controller.courseDetails.value.title,
                        style: style_black_w500_16,
                      ),
                      gap_v10,
                      Text(
                        controller.courseDetails.value.subtitle,
                        style: style_secondary_w400_12,
                      ),
                      gap_v5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "5.0",
                            style: style_black_bold_12,
                          ),
                          gap_h5,
                          Icon(
                            Icons.star,
                            color: goldenColor,
                            size: size15,
                          ),
                          Icon(
                            Icons.star,
                            color: goldenColor,
                            size: size15,
                          ),
                          Icon(
                            Icons.star,
                            color: goldenColor,
                            size: size15,
                          ),
                          Icon(
                            Icons.star,
                            color: goldenColor,
                            size: size15,
                          ),
                          Icon(
                            Icons.star,
                            color: goldenColor,
                            size: size15,
                          ),
                          gap_h5,
                          Text(
                            '(25,00)',
                            style: style_secondaryLight_w400_10,
                          ),
                        ],
                      ),
                      gap_v5,
                      Text('9591 students', style: style_secondary_w400_10),
                      gap_v20,
                      Row(
                        children: [
                          Text('Mentor ', style: style_secondary_w400_12),
                          Text('Ashutosh Pawar', style: style_primary_w400_12),
                        ],
                      ),
                      gap_v5,
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_sharp,
                            size: 12,
                          ),
                          Text(
                              "Last update ${DateFormat('MM/yyyy').format(DateTime.parse(controller.courseDetails.value.lastUpdated).toLocal())}",
                              style: style_secondary_w400_10),
                        ],
                      ),
                      gap_v5,
                      Row(
                        children: [
                          Icon(
                            Icons.language,
                            size: 12,
                          ),
                          Text("English", style: style_secondary_w400_10),
                        ],
                      ),
                      gap_v20,
                      Text(
                        "BDT ${controller.courseDetails.value.price}",
                        style: style_secondary_bold_20,
                      ),
                      gap_v10,
                      PrimaryButton(title: buy_now),
                      gap_v10,
                      Row(
                        children: [
                          SecondaryButton(title: add_to_cart),
                          gap_h10,
                          SecondaryButton(title: add_to_wishlist),
                        ],
                      ),
                      gap_v10,
                      const Text(what_you_will_learn,
                          style: style_black_bold_14),
                      gap_v10,
                      Column(
                        children: [
                          for (int i = 0;
                              i <
                                  controller.courseDetails.value.learningTopics
                                      .length;
                              ++i)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5, left: 5),
                                  child: Icon(
                                    Icons.circle,
                                    size: size10,
                                  ),
                                ),
                                gap_h5,
                                Expanded(
                                  child: Text(
                                    controller
                                        .courseDetails.value.learningTopics[i],
                                    style: style_secondary_w400_14,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      gap_v20,
                      const Text(course_curriculum, style: style_black_bold_14),
                      gap_v10,
                      Column(
                        children: [
                          for (int sectionIndex = 0;
                              sectionIndex <
                                  controller
                                      .courseDetails.value.sectionsList.length;
                              ++sectionIndex)
                            Padding(
                              padding: only_t10,
                              child: ExpansionTile(
                                childrenPadding: symmetric_v5,
                                backgroundColor: whiteColor,
                                collapsedBackgroundColor: whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                collapsedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                textColor: primaryColor,
                                title: Text(
                                  "Section ${sectionIndex + 1} - ${controller.courseDetails.value.sectionsList[sectionIndex].topic}",
                                  // style: style_black_bold_12,
                                ),
                                children: [
                                  for (int lessonIndex = 0;
                                      lessonIndex <
                                          controller
                                              .courseDetails
                                              .value
                                              .sectionsList[sectionIndex]
                                              .lessonsList
                                              .length;
                                      ++lessonIndex)
                                    Padding(
                                      padding: only_b10,
                                      child: Row(
                                        children: [
                                          gap_h10,
                                          (controller
                                                  .courseDetails
                                                  .value
                                                  .sectionsList[sectionIndex]
                                                  .lessonsList[lessonIndex]
                                                  .isVideoLecture)
                                              ? const Icon(
                                                  Icons.play_arrow_outlined,
                                                  color: primaryColor,
                                                  size: size18,
                                                )
                                              : Transform.rotate(
                                                  angle: pi,
                                                  child: const Icon(
                                                    Icons.article_outlined,
                                                    color: secondaryColor,
                                                    size: size15,
                                                  ),
                                                ),
                                          gap_h5,
                                          Text(
                                            controller
                                                .courseDetails
                                                .value
                                                .sectionsList[sectionIndex]
                                                .lessonsList[lessonIndex]
                                                .lectureTitle,
                                            style: style_secondary_w400_12,
                                          )
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      gap_v20,
                      Row(
                        children: [
                          SecondaryButton(title: "16 more sections"),
                        ],
                      ),
                      gap_v10,
                      const Text(course_includes, style: style_black_bold_14),
                      gap_v10,
                      Row(
                        children: [
                          SvgPicture.asset(
                            youtubeIcon,
                            width: size15,
                            height: size15,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ),
                          gap_h10,
                          Text(
                              "Last update ${DateFormat('MM/yyyy').format(DateTime.parse(controller.courseDetails.value.lastUpdated).toLocal())}",
                              style: style_black_w400_12),
                        ],
                      ),
                      gap_v10,
                      Row(
                        children: [
                          SvgPicture.asset(
                            fileIcon,
                            width: size15,
                            height: size15,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ),
                          gap_h10,
                          Text("Support Files", style: style_black_w400_12),
                        ],
                      ),
                      gap_v10,
                      Row(
                        children: [
                          SvgPicture.asset(
                            articleIcon,
                            width: size15,
                            height: size15,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ),
                          gap_h10,
                          Text("10 Articles", style: style_black_w400_12),
                        ],
                      ),
                      gap_v10,
                      Row(
                        children: [
                          SvgPicture.asset(
                            lifetimeIcon,
                            width: size15,
                            height: size15,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ),
                          gap_h10,
                          Text("Full lifetime access",
                              style: style_black_w400_12),
                        ],
                      ),
                      gap_v10,
                      Row(
                        children: [
                          SvgPicture.asset(
                            smartphoneIcon,
                            width: size15,
                            height: size15,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ),
                          gap_h10,
                          Text(
                            "Access on mobile, desktop, and TV",
                            style: style_black_w400_12,
                          ),
                        ],
                      ),
                      gap_v10,
                      Row(
                        children: [
                          SvgPicture.asset(
                            certificateIcon,
                            width: size15,
                            height: size15,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ),
                          gap_h10,
                          Text(
                            "Certificate of Completion",
                            style: style_black_w400_12,
                          ),
                        ],
                      ),
                      gap_v40,
                      const Text(requirements, style: style_black_bold_14),
                      gap_v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: only_t5,
                            child: Icon(
                              Icons.circle,
                              size: size8,
                            ),
                          ),
                          gap_h5,
                          Expanded(
                            child: Text(
                              controller.courseDetails.value.requirements,
                              style: style_black_w400_12,
                            ),
                          ),
                        ],
                      ),
                      gap_v20,
                      const Text(description, style: style_black_bold_14),
                      gap_v10,
                      Text(
                        (expandShrinkController
                                    .isDescriptionTextExpanded.value ==
                                false)
                            ? getFirst200Chars(
                                controller.courseDetails.value.description)
                            : controller.courseDetails.value.description,
                        style: style_secondary_w400_14,
                      ),
                      if (controller.courseDetails.value.description.length >
                          200)
                        InkWell(
                          onTap: () {
                            expandShrinkController
                                .changeDescriptionTextExpansion();
                          },
                          child: Padding(
                            padding: symmetric_v5,
                            child: Text(
                              expandShrinkController
                                          .isDescriptionTextExpanded.value ==
                                      false
                                  ? show_more
                                  : show_less,
                              style: style_primary_w400_14,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  List<Widget> _getLearningTopicList(List<String> learningTopicList) {
    List<Widget> learningTopicWidgetList = <Widget>[];
    for (int i = 0; i < learningTopicList.length; ++i) {
      learningTopicWidgetList.add(
        Column(children: [
          Text("data"),
          gap_v5,
        ]),
      );
    }
    return learningTopicWidgetList;
  }
}
