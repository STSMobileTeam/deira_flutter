import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:deira_flutter/Helper/Colors.dart';
import 'package:deira_flutter/View/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Helper/size_config.dart';
import '../../router.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

final List<String> imgList = [
  'https://sarvtoday.com//admin/bestoffersimages/1/thumbnail/a1.jpg',
  'https://i.imgur.com/yfT7XCY.jpg',
  'https://ae.akbartravels.com/Content/Staticpages/AKAE/Static/images/amazing-discount-flight.jpg',
  'https://vanphongvemaybay.vn/wp-content/uploads/air-asia-office-banner.jpg',
  ];

final List<Widget> imageSliders = imgList.map((item) =>
    Container(child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0)
          ],
        )),
  ),
    )).toList();

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    int _current = 0;
    final CarouselController _controller = CarouselController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.blockSizeVertical!* 17,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: primary_blue,
                boxShadow: [
                  new BoxShadow(blurRadius: 2.0)
                ],
                borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.elliptical(
                        25.0, 25.0)),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom : SizeConfig.blockSizeVertical!*3),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'assets/images/logo_white.svg',
                    width: 44.0,
                    height: 44.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.blockSizeVertical!* 2,right: SizeConfig.blockSizeVertical!* 2),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Container(
                  height: SizeConfig.blockSizeVertical!* 11.5,
                  alignment: Alignment.center,
                  child: Image.network('https://static.vscdn.net/images/careers/demo/booking/1648625147::HeroCampaign_Motion_v2.gif')
                  // child: CachedNetworkImage(
                  // child: CachedNetworkImage(
                  //   progressIndicatorBuilder: (context, url, progress) => Container(
                  //     child: CircularProgressIndicator(
                  //       value: progress.progress,
                  //     ),
                  //   ),
                  //   imageUrl:
                  //   'https://www.bigbreaks.com/Content/Images/offers/Flights/bigbreaks-banners_1360_400_wed400.png',
                  // ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.flightSearch);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 3,
                        child: SvgPicture.asset(
                          'assets/images/flight.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                      CustomText(text: 'Flight',size: 14)
                    ],
                  ),
                )),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 3,
                      child: SvgPicture.asset(
                        'assets/images/hotel.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                    CustomText(text: 'Hotel',size: 14,)
                  ],
                )),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 3,
                      child: SvgPicture.asset(
                        'assets/images/insurance.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                    CustomText(text: 'Insurance',size: 14,)
                  ],
                )),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 3,
                      child: SvgPicture.asset(
                        'assets/images/holiday.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                    CustomText(text: 'Holiday',size: 14,)
                  ],
                ))
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(5),
                      child:SvgPicture.asset(
                        'assets/images/promotion.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                    CustomText(text: 'Promotion',size: 14,)
                  ],
                )),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 3,
                      child: SvgPicture.asset(
                        'assets/images/car.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                    CustomText(text: 'Car',size: 14,)
                  ],
                )),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 3,
                      child: SvgPicture.asset(
                        'assets/images/cruise.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                    CustomText(text: 'Cruise',size: 14,)
                  ],
                )),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 3,
                      child: SvgPicture.asset(
                        'assets/images/visa.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                    CustomText(text: 'Visa',size: 14,)
                  ],
                ))
              ],
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Divider(height: 1,color: Colors.grey,),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: CustomText(text: 'Latest Updates',weight: FontWeight.normal,),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
            CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  height: 120,
                  aspectRatio: 2,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: CustomText(text: 'Quik Menu',weight: FontWeight.normal,),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal!* 25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Material(
                                elevation: 3,
                                child: SvgPicture.asset(
                                  'assets/images/mybooking.svg',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                          Expanded(
                            flex: 1,
                              child: Center(child: CustomText(text: 'My Booking',size: 14,)))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal!* 25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Material(
                                elevation: 3,
                                child: SvgPicture.asset(
                                  'assets/images/upcomingtrips.svg',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                          Expanded(child: Center(child: CustomText(text: 'Upcoming Trip',size: 14,)))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal!* 25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Material(
                                elevation: 3,
                                child: SvgPicture.asset(
                                  'assets/images/myprofile.svg',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                          Expanded(
                            flex: 1,
                              child: Center(child: CustomText(text: 'My profile',size: 14,)))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal!* 25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Material(
                                elevation: 3,
                                child: SvgPicture.asset(
                                  'assets/images/viewcancellation.svg',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                            ),
                          ),
                          //SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text('View Cancellation', maxLines: 2,
                                textAlign: TextAlign.center,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal!* 25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Material(
                                elevation: 3,
                                child: SvgPicture.asset(
                                  'assets/images/support.svg',
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                          Expanded(child: Center(child: CustomText(text: 'Support',size: 14,)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Divider(height: 1,color: Colors.grey,),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
            Container(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*1.5),
              color: litblue,
              child: Row(
                children: [
                  Expanded(flex:1, child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Share the App',size:16,color: Colors.blueAccent,weight: FontWeight.bold,),
                        SizedBox(height: SizeConfig.blockSizeVertical!*1,),
                        CustomText(text: 'Spread the Love',size: 16,color: Colors.blueAccent,weight: FontWeight.bold,),
                        SizedBox(height: SizeConfig.blockSizeVertical!*2,),
                        MaterialButton(
                          minWidth: SizeConfig.blockSizeHorizontal! * 14,
                          height: SizeConfig.blockSizeVertical! * 2,
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 14, bottom: 14),
                          child: const Text(
                            'Share',
                            style: TextStyle(fontSize: 12),
                          ),
                          color: primary_blue,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {

                          },
                        )
                      ],
                    ),
                  )),
                  Expanded(flex:1, child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical! * 15,
                        child: Image(
                            image: AssetImage('assets/images/output.gif'),
                            fit:BoxFit.cover
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
            Container(
              color: ashblue,
              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!*1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: SizeConfig.blockSizeHorizontal! * 4,
                    height: SizeConfig.blockSizeVertical! * 5,
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 14, bottom: 14),
                    child: SvgPicture.asset(
                      'assets/images/fb.svg',
                      width: 20,
                      height: 20,
                      color: greyash,
                    ),
                    color: greyblue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {

                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: MaterialButton(
                      minWidth: SizeConfig.blockSizeHorizontal! * 5,
                      height: SizeConfig.blockSizeVertical! * 5,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 14, bottom: 14),
                      child: SvgPicture.asset(
                        'assets/images/ig.svg',
                        width: 20,
                        height: 20,
                        color: greyash,
                      ),
                      color: greyblue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {

                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*2,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Copyrights 2022 https://deiratravel.com/',
                    size: 12,
                  ),
                  CustomText(
                    text: 'All Rights Reserved',
                    size: 12,
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical!*3,),
          ]
      ),
    ));
  }
}
