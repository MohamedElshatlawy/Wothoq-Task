import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share/share.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/tabs_screen.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_clippath.dart';
import 'package:v_room_app/screens/widgets/custom_listTile.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:v_room_app/viewModel/locale/localizationProvider.dart';
import 'package:v_room_app/viewModel/product_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    var viewProductProvider = watch(productProvider);
    var locProvider = watch(localProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leadingRaduis: BorderRadius.only(
          bottomLeft: locProvider.appLocal == Locale('ar')
              ? Radius.circular(50)
              : Radius.zero,
          bottomRight: locProvider.appLocal == Locale('en')
              ? Radius.circular(50)
              : Radius.zero,
          topLeft: locProvider.appLocal == Locale('ar')
              ? Radius.circular(50)
              : Radius.zero,
          topRight: locProvider.appLocal == Locale('en')
              ? Radius.circular(50)
              : Radius.zero,
        ),
        leadingIcon: Icon(
          Icons.arrow_back,
          color: ColorsUtils.blackColor,
        ),
        traillingIcons: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ColorsUtils.whiteColor),
            child: InkWell(
              child: Icon(Icons.share, color: ColorsUtils.blackColor),
              onTap: () => Share.share(
                  'https://stackoverflow.com/questions/50573933/how-to-implement-a-share-button-in-flutter-app'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ColorsUtils.whiteColor),
            child: InkWell(
              child: Icon(Icons.favorite_border, color: ColorsUtils.blackColor),
              onTap: () => locProvider.appLocal == Locale('ar')
                  ? locProvider.changeLanguage(Locale('en'))
                  : locProvider.changeLanguage(Locale('ar')),
            ),
          ),
        ],
      ),
      body: viewProductProvider.fetchDate != null
          ? SizedBox(
              height: 400.h,
              child: Carousel(
                images: List.generate(
                    viewProductProvider.fetchDate.images.length,
                    (index) => NetworkImage(
                          viewProductProvider.fetchDate.images[index].img,
                        )),
                dotBgColor: Colors.transparent,
                dotSize: 5.0,
                dotSpacing: 15.0,
                dotColor: ColorsUtils.darkGreyTextColor,
                indicatorBgPadding: 100.h,
              ))
          : null,
      bottomSheet: Container(
        height: 600.h,
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: ColorsUtils.whiteColor,
        ),
        child: viewProductProvider.fetchDate != null
            ? ListView(
                shrinkWrap: true,
                children: [
                  CustomText(text: viewProductProvider.fetchDate.name),
                  CustomListTile(
                    title: [
                      CustomText(
                          text: viewProductProvider.fetchDate.salePrice
                                  .toString() +
                              ' ' +
                              'SAR'),
                      CustomText(
                          text: viewProductProvider.fetchDate.regularPrice
                                  .toString() +
                              ' ' +
                              'SAR',
                          decoration: TextDecoration.lineThrough,
                          textColor: ColorsUtils.greyTextColor,
                          fontSize: 17.sp),
                      CustomText(
                          text: viewProductProvider.fetchDate.onSale.toString(),
                          fontSize: 17.sp,
                          textColor: ColorsUtils.primaryYellow)
                    ],
                    trailing: [
                      RatingBar.builder(
                        initialRating: viewProductProvider
                            .fetchDate.numUsersRate
                            .toDouble(),
                        // minRating: 1,
                        itemSize: 20.sp,
                        ignoreGestures:
                            viewProductProvider.fetchDate.isFavourite,
                        direction: Axis.horizontal,
                        itemCount: viewProductProvider.fetchDate.rate,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                          text:
                              "[${viewProductProvider.fetchDate.numUsersRate.toString()}]",
                          textColor: ColorsUtils.greyTextColor),
                    ],
                  ),
                  Divider(color: ColorsUtils.darkBlueGreyTextColor),
                  CustomListTile(
                    title: [
                      CustomText(text: viewProductProvider.fetchDate.store.name)
                    ],
                    subtitle: [
                      Icon(Icons.location_on_outlined,
                          color: ColorsUtils.primaryYellow),
                      CustomText(
                          text: viewProductProvider.fetchDate.store.fullAddress)
                    ],
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          viewProductProvider.fetchDate.store.logo),
                    ),
                  ),
                  Divider(color: ColorsUtils.darkBlueGreyTextColor),
                  CustomText(text: viewProductProvider.fetchDate.desc),
                  Divider(color: ColorsUtils.darkBlueGreyTextColor),
                  CustomTabs(),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorsUtils.blackColor),
                      child: CustomListTile(
                        title: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                                backgroundColor: ColorsUtils.whiteColor,
                                child: IconButton(
                                  onPressed: () =>
                                      viewProductProvider.decrement(),
                                  icon: Icon(Icons.remove,
                                      color: ColorsUtils.blackColor),
                                )),
                          ),
                          SizedBox(width: 10.w),
                          CustomText(
                              text: viewProductProvider.counter.toString(),
                              textColor: ColorsUtils.whiteColor,
                              fontSize: 20.sp),
                          SizedBox(width: 10.w),
                          CircleAvatar(
                              backgroundColor: ColorsUtils.whiteColor,
                              child: IconButton(
                                onPressed: () =>
                                    viewProductProvider.increment(),
                                icon: Icon(Icons.add,
                                    color: ColorsUtils.blackColor),
                              )),
                        ],
                        trailing: [
                          ClipPath(
                            clipper: locProvider.appLocal == Locale('ar')
                                ? MyClipper()
                                : MyClipperEnglish(),
                            child: CustomRoundedButton(
                              width: 170.w,
                              borderRaduis: BorderRadius.only(
                                bottomLeft: locProvider.appLocal == Locale('ar')
                                    ? Radius.circular(50)
                                    : Radius.zero,
                                bottomRight:
                                    locProvider.appLocal == Locale('en')
                                        ? Radius.circular(50)
                                        : Radius.zero,
                                topLeft: locProvider.appLocal == Locale('ar')
                                    ? Radius.circular(50)
                                    : Radius.zero,
                                topRight: locProvider.appLocal == Locale('en')
                                    ? Radius.circular(50)
                                    : Radius.zero,
                              ),
                              text: S.current.addToCart,
                              textColor: ColorsUtils.whiteColor,
                              pressed: () =>
                                  viewProductProvider.successDialog(context),
                              backgroundColor: ColorsUtils.primaryYellow,
                            ),
                          ),
                        ],
                      ))
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
