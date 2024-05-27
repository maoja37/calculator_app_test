import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    Key? key,
    required this.image,
    required this.firstBlueHighlightedText,
    required this.redHighlightedText,
    required this.secondBlueHighlightedText,
    required this.description,
    required this.screenHeight,
  }) : super(key: key);

  final String image;
  final double screenHeight;
  final String firstBlueHighlightedText;
  final String redHighlightedText;
  final String secondBlueHighlightedText;
  final String description;

  Widget verticalSpacing(double multiplyingValue) {
    return SizedBox(
      height: screenHeight * multiplyingValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PageIndexItemImage(image: image, screenHeight: screenHeight),
        verticalSpacing(0.045),
        RichText(
          text: TextSpan(
            text: firstBlueHighlightedText,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            children: [
              TextSpan(
                text: redHighlightedText,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'Stya',
                    ),
              ),
              TextSpan(
                text: secondBlueHighlightedText,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
        verticalSpacing(0.016),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                height: 1.3,
              ),
        )
      ],
    );
  }
}

/// Displays the large image at the center of each page.
class PageIndexItemImage extends StatelessWidget {
  const PageIndexItemImage({
    Key? key,
    required this.image,
    required this.screenHeight,
  }) : super(key: key);

  final String image;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.482,
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}
