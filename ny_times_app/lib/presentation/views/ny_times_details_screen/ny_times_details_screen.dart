import 'package:flutter/material.dart';
import 'package:ny_times_app/domain/entity/ny_times_entity.dart';
import 'package:ny_times_app/presentation/components/network_image/network_image_widget.dart';

import '../../../app/styles/colors.dart';
import '../../components/app_bar/app_bar_widget.dart';
import '../../components/text_component/reusable_text.dart';

class NyTimesDetailsScreen extends StatelessWidget {
  final NyTimesEntity nyTimeItem;

  const NyTimesDetailsScreen({Key? key, required this.nyTimeItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarForNyNewsDetailsScreen(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableTextWidget(
                text: nyTimeItem.title,
                textStyle: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ReusableTextWidget(
                text: nyTimeItem.abstractAboutNews,
                textStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableTextWidget(
                    text: nyTimeItem.byline,
                    textStyle: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ReusableTextWidget(
                    text: nyTimeItem.publishedDate,
                    textStyle: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: NetworkImageWidget(
                    path: nyTimeItem.media.isEmpty
                        ? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930"
                        : nyTimeItem.media.first.mediaMetaData.first.url,
                    width: 370.0,
                    height: 265.0,
                  ),
                ),
              ),
              Center(
                child: ReusableTextWidget(
                  text: 'Source: ${nyTimeItem.source}',
                  textStyle: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const ReusableTextWidget(
                text:
                    '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                textStyle: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
