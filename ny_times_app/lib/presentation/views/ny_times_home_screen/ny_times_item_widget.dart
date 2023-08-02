import 'package:flutter/material.dart';
import 'package:ny_times_app/app/styles/colors.dart';
import 'package:ny_times_app/domain/entity/ny_times_entity.dart';
import 'package:ny_times_app/presentation/components/text_component/reusable_text.dart';
import 'package:ny_times_app/presentation/views/ny_times_details_screen/ny_times_details_screen.dart';

import '../../components/network_image/network_image_widget.dart';

class NyTimesItemWidget extends StatelessWidget {
  final NyTimesEntity nyTimeItem;

  const NyTimesItemWidget({Key? key, required this.nyTimeItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NyTimesDetailsScreen(
                nyTimeItem: nyTimeItem,
              ))),
      child: Row(
        children: [
          ClipOval(
            child: NetworkImageWidget(
              path: nyTimeItem.media.isEmpty
                  ? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930"
                  : nyTimeItem.media.first.mediaMetaData.first.url,
              width: 65.0,
              height: 58.0,
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableTextWidget(
                  text: nyTimeItem.title,
                  textStyle: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                ReusableTextWidget(
                  text: nyTimeItem.byline,
                  textStyle: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.date_range,
                        color: AppColors.greyColor, size: 21.0),
                    ReusableTextWidget(
                      text: nyTimeItem.publishedDate,
                      textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.greyColor,
            size: 28.0,
          )
        ],
      ),
    );
  }
}
