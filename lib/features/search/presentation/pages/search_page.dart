import 'package:barbar_shop/core/utils/app_colors/app_colors.dart';
import 'package:barbar_shop/core/utils/dummy_data/shops.dart';
import 'package:barbar_shop/core/utils/textstyles/app_textstyles.dart';
import 'package:barbar_shop/features/dashboard/presentation/viewmodels/dashboard_page_change_notifier/dashboard_page_change_notifier.dart';
import 'package:barbar_shop/features/search/presentation/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(dashboardPageChangeProvider);
    final searchController = useTextEditingController();

    // Initialize PageController using usePageController hook
    final pageController = usePageController(
      viewportFraction: 0.85, // Adjust this for how much of the next card is visible
      initialPage: 0,
    );

    // State to track the current page for scaling animations
    final currentPage = useState<int>(0);

    // Add a listener to the PageController to update currentPage state
    useEffect(() {
      void listener() {
        if (pageController.hasClients && pageController.position.haveDimensions) {
          int nextP = pageController.page!.round();
          if (currentPage.value != nextP) {
            currentPage.value = nextP;
          }
        }
      }

      pageController.addListener(listener);
      // Clean up the listener when the widget is disposed
      return () => pageController.removeListener(listener);
    }, [pageController]); // Dependency on pageController ensures listener is managed correctly

    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              // App Bar Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      nav.setIndex(0); // Navigate back, assuming index 0 is home
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.onSecondary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.onBackground,
                      ),
                    ),
                  ),
                  Text("Search Overview", style: AppTextStyles.heading2),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.onSecondary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      color: AppColors.onBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              // Search Bar Row
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: AppColors.onPrimary),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.onPrimary,
                        ),
                        // Added filled and fillColor to match the design
                        filled: true,
                        fillColor: AppColors.onSecondary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.r),
                          borderSide: BorderSide(color: AppColors.onSecondary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.r),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // Filter icon (SVG)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.onSecondary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: SvgPicture.asset(
                      "assets/ic_settings.svg", // Ensure this asset path is correct in pubspec.yaml
                      colorFilter: ColorFilter.mode(
                        AppColors.onBackground,
                        BlendMode.srcIn,
                      ),
                      width: 24.w, // Explicit width for SVG
                      height: 24.h, // Explicit height for SVG
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text("Popular Shops", style: AppTextStyles.heading2),
              SizedBox(height: 16.h),
              // Carousel Section: PageView.builder with a fixed height
              SizedBox(
                height: 300.h, // Fixed height for the carousel cards
                child: PageView.builder(
                  controller: pageController, // Use the hooked PageController
                  itemCount: shops.length, // Use the length of your provided shops list
                  itemBuilder: (context, index) {
                    final shop = shops[index];
                    // Calculate the page offset relative to the current center page
                    double pageOffset = 0;
                    if (pageController.hasClients && pageController.position.haveDimensions) {
                      pageOffset = pageController.page! - index;
                    }

                    // Define scale and translation based on the offset
                    // Cards further away will be smaller and more translated horizontally
                    double scale = 1.0;
                    double translateX = 0.0;
                    double rotateY = 0.0; // Added for a subtle 3D effect if desired

                    // Simple linear interpolation for scale and translation
                    // Adjust these values (e.g., 0.85, 30.w) to fine-tune the stacking effect
                    if (pageOffset > 0) { // Cards to the left of the center
                      scale = 1.0 - (pageOffset * 0.15); // Scale down
                      translateX = -pageOffset * 30.w; // Translate left
                      rotateY = pageOffset * 0.05; // Small rotation for perspective
                    } else if (pageOffset < 0) { // Cards to the right of the center
                      scale = 1.0 - (-pageOffset * 0.15); // Scale down
                      translateX = -pageOffset * 30.w; // Translate right
                      rotateY = pageOffset * 0.05; // Small rotation for perspective
                    }

                    // Clamp scale to prevent going below a minimum size
                    scale = scale.clamp(0.85, 1.0);


                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // Add perspective
                        ..rotateY(rotateY) // Apply Y-axis rotation
                        ..translate(translateX) // Apply horizontal translation
                        ..scale(scale), // Apply scaling
                      alignment: FractionalOffset.center,
                      child: ShopCard(
                        name: shop.name,
                        image: shop.image,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h), // Spacing below the carousel
              // The commented-out BarberShopCard section from your original code
              // can be uncommented and used if you want to display a list of shops
              // below the carousel.
              // Column(
              //   children: [
              //     BarberShopCard(
              //       name: "The Gents' Den",
              //       distance: "0.6 km",
              //       image: 'assets/img_barbershop_1.png',
              //     ),
              //     SizedBox(height: 16),
              //     BarberShopCard(
              //       name: "The Sharp Gentleman",
              //       distance: "1.2 km",
              //       image: 'assets/img_barbershop_2.png',
              //     ),
              //     SizedBox(height: 16),
              //     BarberShopCard(
              //       name: "The Crusty Crab",
              //       distance: "0.89 km",
              //       image: 'assets/img_barbershop_1.png',
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
