// Package Name : top.latest.birthday.wishes.shayari.quotes.messages.images.gif.videos.creator
import 'dart:async';
import 'dart:io';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:naag_panchami/widgets/CustomGridItemBook.dart';
import 'package:url_launcher/url_launcher.dart';
import 'utils/SizeConfig.dart';
import 'AboutUs.dart';
import 'GifsImages.dart';
import 'ImagesList.dart';
import 'MemeGenerator.dart';
import 'MessagesList.dart';
import 'MyDrawer.dart';
import 'NativeAdContainer.dart';
import 'ShayariList.dart';
import 'widgets/CustomFeatureCard.dart';
import 'widgets/CustomFullCard.dart';

// Height = 8.96
// Width = 4.14

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const String testDevice = 'c835aea0489176f272e2d174b8d921ca';
// const String testDevice = 'testDeviceId';

class _HomePageState extends State<HomePage> {
  static final facebookAppEvents = FacebookAppEvents();
  String interstitialTag = "";

// Native Ad Open
  static String _adUnitID = NativeAd.testAdUnitId;

  final _nativeAdController = NativeAdmobController();
  double _height = 0;

  StreamSubscription _subscription;

//Native Ad Close

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    //keywords: Keywords.adsKeywords,
    //contentUrl: 'http://foo.com/bar.html',
    childDirected: false,
    nonPersonalizedAds: true,
  );

  InterstitialAd _interstitialAd;

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
        if (event == MobileAdEvent.closed) {
          _interstitialAd = createInterstitialAd()..load();

          if (interstitialTag != null) {
            switch (interstitialTag) {
              case "message":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MessagesList()));
                break;
              case "gif":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => GifsImages()));
                break;

              case "image":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ImagesList()));
                break;

              case "shayari":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ShayariList()));
                break;

              case "meme":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MemeGenerator()));
                break;

              case "about":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs()));
                break;
              default:
            }
          }
        } else if (event == MobileAdEvent.failedToLoad) {
          if (interstitialTag != null) {
            switch (interstitialTag) {
              case "message":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MessagesList()));
                break;
              case "gif":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => GifsImages()));
                break;

              case "image":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ImagesList()));
                break;

              case "shayari":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ShayariList()));
                break;

              case "meme":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MemeGenerator()));
                break;

              case "about":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs()));
                break;
              default:
            }
          }
        } else {
          print(event.toString());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);

    _interstitialAd?.dispose();
    _interstitialAd = createInterstitialAd()..load();

    //Native Ad
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
    //
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    //Native Ad
    _subscription.cancel();
    _nativeAdController.dispose();
    super.dispose();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height = 36.83 * SizeConfig.heightMultiplier;
        });
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _top(),
            SizedBox(
              //8
              height: 0.90 * SizeConfig.heightMultiplier,
            ),
            Divider(),
            Padding(
              //16.0
              padding: EdgeInsets.all(3 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Select Any Option:",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.62*SizeConfig.widthMultiplier, top: 0.90*SizeConfig.heightMultiplier,bottom: 0.44*SizeConfig.heightMultiplier),
                    child: Text(
                      "Images Category",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(
                        top: 0.90*SizeConfig.heightMultiplier, left: 6.28 * SizeConfig.widthMultiplier, bottom: 6.70*SizeConfig.heightMultiplier, right: 6.28 * SizeConfig.widthMultiplier),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        CustomGridItemBook(
                          size: MediaQuery.of(context).size,
                          title: "Images",
                          subtitle: "Send special day wishes to loved ones.",
                          url:"http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/6.jpg",
                          rating: "4.9",
                          ontap: () {
                            print("Images Clicked");
                            interstitialTag = "image";
                            facebookAppEvents.logEvent(
                              name: "Image List",
                              parameters: {
                                'button_id': 'Image_button',
                              },
                            );

                            _interstitialAd.isLoaded() != null
                                ? _interstitialAd?.show()
                                : Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ImagesList()));
                          },
                        ),
                        SizedBox(
                          width: 6 * SizeConfig.heightMultiplier,
                        ),
                        CustomGridItemBook(
                          size: MediaQuery.of(context).size,
                          title: "Gifs",
                          subtitle: "Show your love to naag devta.",
                          url:"http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/7.gif",
                          rating: "5.0",
                          ontap: () {
                            print("Gifs Clicked");
                            interstitialTag = "gif";
                            facebookAppEvents.logEvent(
                              name: "GIF List",
                              parameters: {
                                'button_id': 'gif_button',
                              },
                            );
                            _interstitialAd.isLoaded() != null
                                ? _interstitialAd?.show()
                                : Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            GifsImages()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.62*SizeConfig.widthMultiplier, bottom: 1.33 * SizeConfig.heightMultiplier),
                    child: Text(
                      "Text Wishes",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    padding:
                        EdgeInsets.only(left: 6.28 * SizeConfig.widthMultiplier, bottom: 6.70*SizeConfig.heightMultiplier, right: 6.28 * SizeConfig.widthMultiplier),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        CustomGridItemBook(
                          size: MediaQuery.of(context).size,
                          title: "Messages",
                          subtitle: "May this day bring fortune for you luck, success and courage too",
                          url:"http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/2.jpg",
                          rating: "4.6",
                          ontap: () {
                            print("Messages Clicked");
                            interstitialTag = "message";
                            facebookAppEvents.logEvent(
                              name: "Message List",
                              parameters: {
                                'button_id': 'message_button',
                              },
                            );
                            _interstitialAd.isLoaded() != null
                                ? _interstitialAd?.show()
                                : Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MessagesList()));
                          },
                        ),
                        SizedBox(
                          width: 6 * SizeConfig.heightMultiplier,
                        ),
                        CustomGridItemBook(
                          size: MediaQuery.of(context).size,
                          title: "Shayari",
                          subtitle: "Latest shayari that will take your near lord Shiva.",
                          url:"http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/38.jpg",
                          rating: "4.8",
                          ontap: () {
                            print("Shayari Clicked");
                            interstitialTag = "shayari";
                            facebookAppEvents.logEvent(
                              name: "Shayari List",
                              parameters: {
                                'button_id': 'Shayari_button',
                              },
                            );
                            _interstitialAd.isLoaded() != null
                                ? _interstitialAd?.show()
                                : Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ShayariList()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  NativeAdContainer(
                      height: _height,
                      adUnitID: _adUnitID,
                      nativeAdController: _nativeAdController),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(left: 3.62*SizeConfig.widthMultiplier, bottom: 1.33 * SizeConfig.heightMultiplier),
                    child: Text(
                      "Create Own Wishes",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 6.28 * SizeConfig.widthMultiplier, bottom: 6.70*SizeConfig.heightMultiplier, right: 6.28 * SizeConfig.widthMultiplier),
                    child: CustomGridItemBook(
                      size: MediaQuery.of(context).size,
                      title: "Wish Creator",
                      subtitle: "Make your own wishes & rock social media.",
                      url:"http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/30.jpg",
                          rating: "5.0",
                      ontap: () {
                        print("Meme Clicked");
                        interstitialTag = "meme";
                        facebookAppEvents.logEvent(
                          name: "Meme Generator",
                          parameters: {
                            'button_id': 'meme_button',
                          },
                        );
                        _interstitialAd.isLoaded() != null
                            ? _interstitialAd?.show()
                            : Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MemeGenerator()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(3.86 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Have a Glance on Gifs:",
                    style: Theme.of(context).textTheme.headline1,
                  ),

                  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                                  child: Row(
                    children: <Widget>[
                      CustomFeatureCard(
                        size: MediaQuery.of(context).size,
                        imageUrl:
                           "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/2.gif",
    
                        ontap: () {},
                      ),
                      CustomFeatureCard(
                        size: MediaQuery.of(context).size,
                        imageUrl:
                            "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/10.gif",
    
                        ontap: () {},
                      ),
                      CustomFeatureCard(
                        size: MediaQuery.of(context).size,
                        imageUrl:
                            "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/8.gif",
                        ontap: () {},
                      ),
                      
                    ],
                  ),
                  onTap: (){
                    print("Gifs Clicked");
                            interstitialTag = "gif";
                            facebookAppEvents.logEvent(
                              name: "GIF List",
                              parameters: {
                                'button_id': 'gif_button',
                              },
                            );
                            _interstitialAd.isLoaded() != null
                                ? _interstitialAd?.show()
                                : Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            GifsImages()));
                  },
                ),
              ),
                ],
              ),

             

            ),
            Divider(),
            NativeAdContainer(
                height: _height,
                adUnitID: _adUnitID,
                nativeAdController: _nativeAdController),
            Divider(),
            Padding(
              padding: EdgeInsets.all(3.86 * SizeConfig.widthMultiplier),
              child: Row(
                children: <Widget>[
                  Text(
                    "Play Rakhi Shop Game:",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            CustomFullCard(
              size: MediaQuery.of(context).size,
              imageUrl: "assets/rakhi_game.jpeg",
              ontap: () {
                if (Platform.isAndroid) {
                  // Android-specific code
                  print("More Button Clicked");
                  launch(
                      "https://play.google.com/store/apps/developer?id=Festival+Messages+SMS");
                } else if (Platform.isIOS) {
                  // iOS-specific code
                  print("More Button Clicked");
                  launch("https://apps.apple.com/us/app/-/id1434054710");

                  facebookAppEvents.logEvent(
                    name: "Play Rakshabandhan Game",
                    parameters: {
                      'clicked_on_play_rakshabandhan_game': 'Yes',
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.only(
        top: 3 * SizeConfig.widthMultiplier,
        bottom: 10 * SizeConfig.widthMultiplier,
        left: 10 * SizeConfig.widthMultiplier,
        right: 10 * SizeConfig.widthMultiplier,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryVariant,
        borderRadius: BorderRadius.only(
          //30
          bottomLeft: Radius.circular(MediaQuery.of(context).size.width / 2),
          bottomRight: Radius.circular(MediaQuery.of(context).size.width / 2),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Happy Naag Panchami, User",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 1.93 * SizeConfig.widthMultiplier,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1158115409993691138/wABb5ZLe_400x400.jpg'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          ),
          Text(
            "Namaste, Have a look on Messages, Images, Shayari, Gifs & Wish Maker below for Your Love Ones.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}
