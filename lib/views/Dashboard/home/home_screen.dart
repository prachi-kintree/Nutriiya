import 'package:date_util_plus/date_util_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/extension/extension_sized_box.dart';
import 'package:nutriya/utils/utils.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/food_logger_viewmodel.dart';
import 'package:nutriya/viewmodel/dashboard/scanner/meal_search_screen_viewmodel.dart';
import 'package:nutriya/views/widget/bottom_sheets/common_bottomsheet.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.95, keepPage: true);

    List<Meals> meals = [
      // Meals(svgSandwich, "Breakfast", "Recommended : 481 kcal"),
      // Meals(svgPaneerCurry, "Lunch", "Recommended : 577 kcal"),
      // Meals(svgLoveFood, "Dinner", "Recommended : 577 kcal"),
      // Meals(svgTea, "Snack", "Recommended : 288 kcal"),
      Meals(
          icon: svgSandwich,
          title: "Breakfast",
          subtitle: "Recommended : 481 kcal"),
      Meals(
          icon: svgPaneerCurry,
          title: "Lunch",
          subtitle: "Recommended : 577 kcal"),
      Meals(
          icon: svgLoveFood,
          title: "Dinner",
          subtitle: "Recommended : 577 kcal"),
      Meals(icon: svgTea, title: "Snack", subtitle: "Recommended : 288 kcal"),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFFFFFF), Color(0xffEDEDED)],
                  begin: Alignment.topCenter)),
          child: Padding(
            // padding: EdgeInsets.all(15.0.w),
            padding: EdgeInsets.all(0.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.sBH,
                Padding(
                  padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
                  child: Row(
                    children: [
                      Text("${DateTime.now().getGreeting()} Raj",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 24.sp, color: Color(0xff09020F)),
                              outfitFont: OutfitFontStyle.bold)),
                      10.sBW,
                      SvgPicture.asset(
                        svgMorningIcon,
                        height: 24.h,
                      ),
                      const Spacer(),
                      Image.asset(pngProfileImg)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.w, left: 15.w, right: 15.w),
                  child: Row(
                    children: [
                      Text("Today, 27/06/2025",
                          style: AppTextStyle.outfitStyle(
                              withTextStyle: TextStyle(
                                  fontSize: 14.sp, color: Color(0xff09020F)),
                              outfitFont: OutfitFontStyle.regular)),
                      10.sBW,

                      // SvgPicture.asset(
                      //   svgCalenderIcon,
                      //   height: 14.h,
                      // ),
                    ],
                  ),
                ),
                20.sBH,
                SizedBox(
                  height: 180.h,
                  width: 1.sw,
                  child: PageView(
                    // allowImplicitScrolling: true,
                    controller: controller,

                    children: [
                      Container(
                        height: 180.h,
                        margin: EdgeInsets.only(left: 15.w, right: 15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0.r),
                          color: ThemeManagerPlus.of<AppTheme>(context)
                              .currentTheme
                              .leafGreen!
                              .withOpacity(0.4),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 140.h,
                              child: Stack(
                                fit: StackFit.loose,
                                children: [
                                  Positioned(
                                    top: -100,
                                    left: 20,
                                    right: 20,
                                    child: SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          showLabels: false,
                                          showTicks: false,
                                          startAngle: 160,
                                          endAngle: 20,
                                          radiusFactor: 0.7,
                                          canScaleToFit: true,
                                          axisLineStyle: AxisLineStyle(
                                            thickness: 0.2.w,
                                            color:
                                                ThemeManagerPlus.of<AppTheme>(
                                                        context)
                                                    .currentTheme
                                                    .leafGreen!,
                                            thicknessUnit: GaugeSizeUnit.factor,
                                            cornerStyle: CornerStyle.bothCurve,
                                          ),
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                                animationDuration: 4000,
                                                enableAnimation: true,
                                                color: ThemeManagerPlus.of<
                                                        AppTheme>(context)
                                                    .currentTheme
                                                    .primaryGreen,
                                                value: 80.0,
                                                width: 0.2.w,
                                                sizeUnit: GaugeSizeUnit.factor,
                                                cornerStyle:
                                                    CornerStyle.bothCurve)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -40,
                                    left: 20,
                                    right: 20,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        65.sBH,
                                        SvgPicture.asset(svgCaloriesBurn),
                                        5.sBH,
                                        Text("Calories",
                                            style: AppTextStyle.outfitStyle(
                                                withTextStyle: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.black),
                                                outfitFont:
                                                    OutfitFontStyle.medium)),
                                        5.sBH,
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: '539',
                                              style: AppTextStyle.outfitStyle(
                                                  withTextStyle: TextStyle(
                                                      fontSize: 32.sp,
                                                      color: Colors.black),
                                                  outfitFont:
                                                      OutfitFontStyle.medium)),
                                          TextSpan(
                                              text: 'kcal',
                                              style: AppTextStyle.outfitStyle(
                                                  withTextStyle: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black),
                                                  outfitFont:
                                                      OutfitFontStyle.medium))
                                        ])),
                                        Text("of 725 kcal",
                                            style: AppTextStyle.outfitStyle(
                                                withTextStyle: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.black),
                                                outfitFont:
                                                    OutfitFontStyle.medium)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: ThemeManagerPlus.of<AppTheme>(context)
                                  .currentTheme
                                  .primaryGreen,
                              height: 0.5.h,
                              indent: 20.w,
                              endIndent: 20.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  appNavigator
                                      .pushNamed(routeCaloriesIntakeScreen);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("View Details",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: ThemeManagerPlus.of<
                                                        AppTheme>(context)
                                                    .currentTheme
                                                    .primaryGreen),
                                            outfitFont:
                                                OutfitFontStyle.medium)),
                                    5.sBW,
                                    SvgPicture.asset(svgNextArrowGreen),
                                    20.sBW,
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 180.h,
                        margin: EdgeInsets.only(left: 15.w, right: 15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0.r),
                          color: Color(0xffFFEAD9),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 140.h,
                              child: Stack(
                                fit: StackFit.loose,
                                children: [
                                  Positioned(
                                    top: -100,
                                    left: 20,
                                    right: 20,
                                    child: SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          showLabels: false,
                                          showTicks: false,
                                          startAngle: 160,
                                          endAngle: 20,
                                          radiusFactor: 0.7,
                                          canScaleToFit: true,
                                          axisLineStyle: AxisLineStyle(
                                            thickness: 0.2.w,
                                            color: Color(0xffFFB173),
                                            thicknessUnit: GaugeSizeUnit.factor,
                                            cornerStyle: CornerStyle.bothCurve,
                                          ),
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                                enableAnimation: true,
                                                color: Color(0xffFF7300),
                                                value: 80.0,
                                                width: 0.2.w,
                                                sizeUnit: GaugeSizeUnit.factor,
                                                cornerStyle:
                                                    CornerStyle.bothCurve)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -30,
                                    left: 20,
                                    right: 20,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        65.sBH,
                                        SvgPicture.asset(svgCaloriesBurn),
                                        5.sBH,
                                        Text(" Burned Calories",
                                            style: AppTextStyle.outfitStyle(
                                                withTextStyle: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.black),
                                                outfitFont:
                                                    OutfitFontStyle.medium)),
                                        5.sBH,
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: '539',
                                              style: AppTextStyle.outfitStyle(
                                                  withTextStyle: TextStyle(
                                                      fontSize: 32.sp,
                                                      color: Colors.black),
                                                  outfitFont:
                                                      OutfitFontStyle.medium)),
                                          TextSpan(
                                              text: 'kcal',
                                              style: AppTextStyle.outfitStyle(
                                                  withTextStyle: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black),
                                                  outfitFont:
                                                      OutfitFontStyle.medium))
                                        ])),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xffFF7300),
                              height: 0.5.h,
                              indent: 20.w,
                              endIndent: 20.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  appNavigator.pushNamed(routeFitnessActivity);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("View Activity",
                                        style: AppTextStyle.outfitStyle(
                                            withTextStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: Color(0xffFF7300)),
                                            outfitFont:
                                                OutfitFontStyle.medium)),
                                    5.sBW,
                                    SvgPicture.asset(
                                      svgNextArrowGreen,
                                      color: Color(0xffFF7300),
                                    ),
                                    20.sBW,
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                5.sBH,
                Align(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 2,
                      effect: ExpandingDotsEffect(
                          dotHeight: 4.h,
                          dotWidth: 4.h,
                          activeDotColor: Color(0xff42A004)),
                    )),
                20.sBH,
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                  ),
                  child: Material(
                    elevation: 0.5,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0.r),
                        bottomLeft: Radius.circular(16.0.r)),
                    child: SizedBox(
                      height: 140.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: 16.w, top: 7.h, right: 16.w),
                          //   child: Text("Eaten",
                          //       style: AppTextStyle.outfitStyle(
                          //           withTextStyle: TextStyle(
                          //               fontSize: 16.sp,
                          //               color: Color(0xff09020F)),
                          //           outfitFont: OutfitFontStyle.medium)),
                          // ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ProgressIndicator(
                                    bgColor: Colors.grey[300]!,
                                    fgColor: Color(0xff4A90E2),
                                    limit: "100",
                                    current: "84",
                                    title: "Protein"),
                                ProgressIndicator(
                                    bgColor: Colors.grey[300]!,
                                    fgColor: Color(0xff7ED321),
                                    limit: "224",
                                    current: "178",
                                    title: "Carbs"),
                                ProgressIndicator(
                                    bgColor: Colors.grey[300]!,
                                    fgColor: Color(0xffF5A623),
                                    limit: "128",
                                    current: "70",
                                    title: "Fat"),
                                ProgressIndicator(
                                    bgColor: Colors.grey[300]!,
                                    fgColor: Color(0xffFFC600),
                                    limit: "8000",
                                    current: "5304",
                                    measurementValue: '',
                                    title: "Steps"),
                                ProgressIndicator(
                                    measurementValue: "G",
                                    bgColor: Colors.grey[300]!,
                                    fgColor: Color(0xff7FD3FF),
                                    limit: "10",
                                    current: "6",
                                    title: "Water"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                10.sBH,
                Container(
                  margin: EdgeInsets.only(left: 15.w, right: 15.w),
                  height: 220.h,
                  padding: EdgeInsets.only(
                    left: 15.w,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffD9ECCD),
                      borderRadius: BorderRadius.circular(16.0.r)),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: -4.h,
                          right: 10.w,
                          child: Image.asset(pngConnectWatchImage)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.sBH,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    appNavigator.goBack();
                                  },
                                  child: SvgPicture.asset(svgCancel)),
                              20.sBW
                            ],
                          ),
                          15.sBH,
                          Text("Sync your fitness watch \nto stay on track",
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 22.sp,
                                      color: Color(0xff09020F)),
                                  outfitFont: OutfitFontStyle.bold)),
                          20.sBH,
                          Text(
                              "Track steps, heart rate & workouts \nseamlessly in one place.",
                              style: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xff09020F)),
                                  outfitFont: OutfitFontStyle.bold)),
                          20.sBH,
                          CustomButton(
                              onPressed: (startLoading, stopLoading, btnState) {
                                appNavigator.pushNamed(routeConnectWatch);
                              },
                              buttonColor: Colors.white,
                              height: 40.h,
                              width: 145.w,
                              buttonTextStyle: AppTextStyle.outfitStyle(
                                  withTextStyle: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                  outfitFont: OutfitFontStyle.medium),
                              buttonText: 'Connect Your Watch'),
                        ],
                      )
                    ],
                  ),
                ),
                20.sBH,
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 15.w),
                  child: Text("Log your meals",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              fontSize: 20.sp, color: Color(0xff09020F)),
                          outfitFont: OutfitFontStyle.bold)),
                ),
                10.sBH,
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Consumer<MealSearchScreenViewmodel>(
                    builder: (context, value, child) {
                      return SizedBox(
                          // height: 330.h,
                          child:
                              //  ListView.builder(
                              //   padding: EdgeInsets.zero,
                              //   shrinkWrap: true,
                              //   itemCount: meals.length,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   itemBuilder: (context, index) {
                              //     return LogMealsWidget(
                              //         list:
                              //         icon: meals[index].icon!,
                              //         title: meals[index].title!,
                              //         subtitle: meals[index].subtitle!);
                              //   },
                              // ),
                              ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          LogMealsWidget(
                            onAddTap: () {
                              openBottomSheet(
                                  context: context,
                                  title: "Log your meal",
                                  subTitle:
                                      "Choose how you want to log today’s meal",
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          appNavigator.goBack();
                                          context
                                              .read<FoodLoggerViewmodel>()
                                              .navigateToDesireMeal(meals[0]);
                                        },
                                        child: Container(
                                          height: 135.h,
                                          width: 158.w,
                                          padding: EdgeInsets.only(
                                              left: 10.w, right: 5.w),
                                          decoration: BoxDecoration(
                                              color: Color(0xffD9ECCD),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12.0.r)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: SvgPicture.asset(
                                                      svgLogFood)),
                                              10.sBH,
                                              Text('Describe',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      AppTextStyle.outfitStyle(
                                                          withTextStyle:
                                                              TextStyle(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: Colors
                                                                      .black),
                                                          outfitFont:
                                                              OutfitFontStyle
                                                                  .regular)),
                                              Text(
                                                  "Write down what you ate— quick and easy tracking.",
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      AppTextStyle.outfitStyle(
                                                          withTextStyle:
                                                              TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black),
                                                          outfitFont:
                                                              OutfitFontStyle
                                                                  .light)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      20.sBW,
                                      InkWell(
                                        onTap: () {
                                          appNavigator.goBack();
                                          appNavigator
                                              .pushNamed(routeMealCameraScreen);
                                          // context
                                          //     .read<FoodLoggerViewmodel>()
                                          //     .navigateToDesireMeal(meals[0]);
                                        },
                                        child: Container(
                                          height: 135.h,
                                          width: 158.w,
                                          padding: EdgeInsets.only(
                                              left: 10.w, right: 5.w),
                                          decoration: BoxDecoration(
                                              color: Color(0xffD9ECCD),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12.0.r)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: SvgPicture.asset(
                                                      svgScanFood)),
                                              20.sBH,
                                              Text('Capture',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      AppTextStyle.outfitStyle(
                                                          withTextStyle:
                                                              TextStyle(
                                                                  fontSize:
                                                                      16.sp,
                                                                  color: Colors
                                                                      .black),
                                                          outfitFont:
                                                              OutfitFontStyle
                                                                  .regular)),
                                              Text(
                                                  "Snap a photo of your meal for visual logging.",
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      AppTextStyle.outfitStyle(
                                                          withTextStyle:
                                                              TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: Colors
                                                                      .black),
                                                          outfitFont:
                                                              OutfitFontStyle
                                                                  .light)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                            },
                            list: value.breakfastList,
                            icon: meals[0].icon!,
                            title: meals[0].title!,
                            // subtitle: meals[0].subtitle
                          ),
                          LogMealsWidget(
                            onAddTap: () {
                              context
                                  .read<FoodLoggerViewmodel>()
                                  .navigateToDesireMeal(meals[1]);
                            },
                            list: value.lunchList,
                            icon: meals[1].icon!,
                            title: meals[1].title!,
                            // subtitle: meals[1].subtitle!
                          ),
                          LogMealsWidget(
                            onAddTap: () {
                              context
                                  .read<FoodLoggerViewmodel>()
                                  .navigateToDesireMeal(meals[2]);
                            },
                            list: value.dinnerList,
                            icon: meals[2].icon!,
                            title: meals[2].title!,
                            // subtitle: meals[2].subtitle!
                          ),
                          LogMealsWidget(
                            onAddTap: () {
                              context
                                  .read<FoodLoggerViewmodel>()
                                  .navigateToDesireMeal(meals[3]);
                            },
                            list: value.snackList,
                            icon: meals[3].icon!,
                            title: meals[3].title!,
                            // subtitle: meals[3].subtitle!
                          ),
                        ],
                      ));
                    },
                  ),
                ),
                10.sBH,
                Padding(
                  padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
                  child: Text("Water",
                      style: AppTextStyle.outfitStyle(
                          withTextStyle: TextStyle(
                              fontSize: 20.sp, color: Color(0xff09020F)),
                          outfitFont: OutfitFontStyle.bold)),
                ),
                10.sBH,
                Padding(
                  padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
                  child: const WaterTracker(),
                ),
                20.sBH
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogMealsWidget extends StatelessWidget {
  const LogMealsWidget(
      {super.key,
      required this.icon,
      required this.title,
      // required this.subtitle,
      this.list = const [],
      required this.onAddTap});
  final String icon;
  final String title;
  // final String subtitle;
  final List<SuggestedFood> list;
  final VoidCallback onAddTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(12.0.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            // height: 70.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(icon),
                    20.sBW,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: AppTextStyle.outfitStyle(
                                withTextStyle: TextStyle(
                                    fontSize: 18.sp, color: Color(0xff09020F)),
                                outfitFont: OutfitFontStyle.regular)),
                        // 5.sBH,
                        // Text(subtitle,
                        //     style: AppTextStyle.outfitStyle(
                        //         withTextStyle: TextStyle(
                        //             fontSize: 14.sp, color: Color(0xff09020F)),
                        //         outfitFont: OutfitFontStyle.regular)),
                      ],
                    ),
                    // Text(title,
                    //     style: AppTextStyle.outfitStyle(
                    //         withTextStyle: TextStyle(
                    //             fontSize: 18.sp, color: Color(0xff09020F)),
                    //         outfitFont: OutfitFontStyle.regular)),
                    const Spacer(),
                    InkWell(
                        onTap: onAddTap,
                        child: SvgPicture.asset(svgAddButtonCircle))
                  ],
                ),
                5.sBH,
                (list.isNotEmpty)
                    ? SizedBox(
                        height: 20.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Text(' ${list[index].foodname} ,',
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 15.sp,
                                        color: Color(0xff09020F)),
                                    outfitFont: OutfitFontStyle.regular));
                          },
                        ))
                    : const SizedBox(),
                (list.isNotEmpty) ? 5.sBH : 0.sBH,
                list.isNotEmpty
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child:
                            // CustomButton(
                            //     onPressed: (startLoading, stopLoading, btnState) {
                            //       appNavigator.pushNamed(routeMealDetailScreen);
                            //     },
                            //     // padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                            //     buttonTextStyle: AppTextStyle.outfitStyle(
                            //         withTextStyle: TextStyle(fontSize: 16.sp),
                            //         outfitFont: OutfitFontStyle.medium),
                            //     width: 100.w,
                            //     height: 30.h,
                            //     buttonText: 'Details'),
                            InkWell(
                          onTap: () {
                            appNavigator.pushNamed(routeMealDetailScreen);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("View Details",
                                  style: AppTextStyle.outfitStyle(
                                      withTextStyle: TextStyle(
                                          fontSize: 14.sp,
                                          color: ThemeManagerPlus.of<AppTheme>(
                                                  context)
                                              .currentTheme
                                              .primaryGreen),
                                      outfitFont: OutfitFontStyle.medium)),
                              5.sBW,
                              SvgPicture.asset(svgNextArrowGreen),
                              10.sBW,
                            ],
                          ),
                        ))
                    : const SizedBox(),
                (list.isNotEmpty) ? 10.sBH : 0.sBH
              ],
            ),
          )),
    );
  }
}

// class WaterTracker extends StatelessWidget {
//   const WaterTracker({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(16.0.r),
//       child: Container(
//         height: 100.h,
//         width: 700.w,
//         padding: EdgeInsets.symmetric(horizontal: 10.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset(svgFilledGlass),
//                 SvgPicture.asset(svgFilledGlass),
//                 SvgPicture.asset(svgAddEmptyGlass),
//                 SvgPicture.asset(svgEmptyGlass),
//                 SvgPicture.asset(svgEmptyGlass),
//                 SvgPicture.asset(svgEmptyGlass),
//               ],
//             ),
//             10.sBH,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("857 / 2000ml",
//                     style: AppTextStyle.outfitStyle(
//                         withTextStyle: TextStyle(
//                             fontSize: 14.sp, color: Color(0xff09020F)),
//                         outfitFont: OutfitFontStyle.regular)),
//                 Text("40%",
//                     style: AppTextStyle.outfitStyle(
//                         withTextStyle: TextStyle(
//                             fontSize: 14.sp, color: Color(0xff09020F)),
//                         outfitFont: OutfitFontStyle.regular)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  _WaterTrackerState createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  final int totalMl = 2000;
  final int glassMl = 250;
  int consumedMl = 0;
  // int consumedMl = 857;

  List<String> getGlassList() {
    int fullGlasses = consumedMl ~/ glassMl;
    int totalGlasses = totalMl ~/ glassMl;
    List<String> glasses = [];

    for (int i = 0; i < totalGlasses; i++) {
      if (i < fullGlasses) {
        glasses.add(svgFilledGlass);
      } else {
        glasses.add(svgEmptyGlass);
      }
    }

    // Replace the first empty glass with the Add button
    int addIndex = fullGlasses;
    if (addIndex < glasses.length) {
      glasses[addIndex] = svgAddEmptyGlass;
    }

    return glasses;
  }

  void onAddGlass() {
    setState(() {
      if (consumedMl + glassMl <= totalMl) {
        consumedMl += glassMl;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> glasses = getGlassList();

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16.0.r),
      child: Container(
        height: 100.h,
        width: 700.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(glasses.length, (index) {
                if (glasses[index] == svgAddEmptyGlass) {
                  return GestureDetector(
                    onTap: onAddGlass,
                    child: SvgPicture.asset(
                      svgAddEmptyGlass,
                      height: 40.h,
                    ),
                  );
                } else {
                  return SvgPicture.asset(glasses[index], height: 40.h);
                }
              }),
            ),
            10.sBH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$consumedMl / $totalMl ml",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp, color: Color(0xff09020F)),
                        outfitFont: OutfitFontStyle.regular)),
                Text("${((consumedMl / totalMl) * 100).toStringAsFixed(0)}%",
                    style: AppTextStyle.outfitStyle(
                        withTextStyle: TextStyle(
                            fontSize: 14.sp, color: Color(0xff09020F)),
                        outfitFont: OutfitFontStyle.regular)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.limit,
    required this.current,
    required this.title,
    this.measurementValue = 'g',
  });
  final Color bgColor;
  final Color fgColor;
  final String limit;
  final String current;
  final String title;
  final String measurementValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(2),
          height: 100.w,
          width: 100.w,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                  showLabels: false,
                  showTicks: false,
                  minimum: 0,
                  maximum: double.parse(limit),
                  startAngle: 270.0,
                  endAngle: 270.0,
                  radiusFactor: 0.9,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.12.w,
                    color: bgColor,
                    thicknessUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.startCurve,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                        animationDuration: 4000,
                        enableAnimation: true,
                        color: fgColor,
                        value: double.parse(current),
                        width: 0.12.w,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.endCurve)
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(current,
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 20.sp,
                                        color: Color(0xff09020F)),
                                    outfitFont: OutfitFontStyle.medium)),
                            Text("/ $limit $measurementValue",
                                style: AppTextStyle.outfitStyle(
                                    withTextStyle: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff09020F)),
                                    outfitFont: OutfitFontStyle.medium)),
                            10.sBH,
                          ],
                        ))
                  ])
            ],
          ),
        ),
        Text(title,
            style: AppTextStyle.outfitStyle(
                withTextStyle:
                    TextStyle(fontSize: 14.sp, color: Color(0xff09020F)),
                outfitFont: OutfitFontStyle.medium))
      ],
    );
  }
}

// class Meals {
//   final String? icon;
//   final String? title;
//   final String? subtitle;

//   Meals(this.icon, this.title, this.subtitle);
// }
