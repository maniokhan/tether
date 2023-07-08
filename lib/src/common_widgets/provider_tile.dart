import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:newtetherpets/src/common_widgets/common_card.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

class ProviderTile extends StatelessWidget {
  const ProviderTile({
    required this.providerImage,
    required this.providerName,
    required this.providerStatus,
    required this.rating,
    required this.noOfReviews,
    this.isFavorite = false,
    super.key,
  });
  final String providerName;
  final String providerStatus;
  final double rating;
  final int noOfReviews;
  final String providerImage;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CommonCard(
        height: 95,
        child: Row(
          children: [
            Container(
              height: 75,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(providerImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            gapW12,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.58,
                  child: Row(
                    children: [
                      AppText.paragraphS14(providerName),
                      const Spacer(),
                      if (isFavorite)
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      else
                        const Icon(
                          Icons.favorite,
                          color: Colors.transparent,
                        ),
                      gapH20
                    ],
                  ),
                ),
                AppText.paragraphI14(
                  providerStatus,
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  children: [
                    AppText.paragraphI10('$rating'),
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      allowHalfRating: true,
                      itemSize: 12,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (BuildContext context, int index) =>
                          const Icon(
                        Icons.star,
                        color: ConfigColors.primary,
                      ),
                      onRatingUpdate: print,
                    ),
                    gapW32,
                    AppText.paragraphI12(
                      '$noOfReviews Reviews',
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
