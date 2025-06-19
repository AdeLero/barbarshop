import 'package:barbar_shop/core/utils/app_colors/app_colors.dart';
import 'package:barbar_shop/core/utils/textstyles/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopCard extends StatelessWidget {
  final String name;
  final String image;
  const ShopCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Margin for spacing between cards in the carousel
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r), // Apply responsive rounded corners
        child: Stack(
          children: [
            // Background image for the shop card
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: 1.sw, // Take full width of the screen (within viewportFraction)
              height: 600.h, // Fixed height for the card, adjust as needed
              errorBuilder: (context, error, stackTrace) => Container(
                color: AppColors.onSecondary, // Fallback color on error
                child: Center(child: Text('Image Error', style: AppTextStyles.body)),
              ),
            ),
            // Gradient overlay for better text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            // Shop name text positioned at the top left
            Positioned(
              top: 20.h, // Responsive top padding
              left: 20.w, // Responsive left padding
              child: Text(
                name,
                style: AppTextStyles.heading1.copyWith( // Using AppTextStyles for consistency
                  color: Colors.white,
                  fontSize: 28.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Bottom section with "Book Now" button and circular arrow button
            Positioned(
              bottom: 20.h, // Responsive bottom padding
              left: 20.w, // Responsive left padding
              right: 20.w, // Responsive right padding
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle "Book Now" action
                        print('Book Now tapped for $name');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.onBackground, // White background as in the image
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r), // Responsive rounded corners
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15.h), // Responsive vertical padding
                      ),
                      child: Text(
                        'Book Now',
                        style: AppTextStyles.body, // Black text
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w), // Responsive horizontal spacing
                  Container(
                    width: 50.w, // Responsive width
                    height: 50.h, // Responsive height
                    decoration: BoxDecoration(
                      color: AppColors.primary, // Yellow button color
                      shape: BoxShape.circle, // Circular shape
                    ),
                    child: Icon(Icons.arrow_forward_ios, color: AppColors.onSecondary), // Black icon
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}