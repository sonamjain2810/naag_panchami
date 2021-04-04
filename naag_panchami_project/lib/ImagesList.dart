import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'utils/SizeConfig.dart';
import 'ImageDetailPage.dart';

class ImagesList extends StatefulWidget {
  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  static final facebookAppEvents = FacebookAppEvents();

  var data = [
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/1.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/2.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/3.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/4.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/5.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/6.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/7.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/8.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/9.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/10.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/11.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/12.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/13.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/14.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/15.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/16.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/17.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/18.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/19.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/20.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/21.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/22.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/23.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/24.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/25.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/26.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/27.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/28.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/29.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/30.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/31.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/32.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/33.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/35.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/36.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/37.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/38.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/39.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/40.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/41.jpg",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_images/42.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Images",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: data != null
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Padding(
                        padding:
                            EdgeInsets.all(1.93 * SizeConfig.widthMultiplier),
                        child: ListTile(
                          title: CachedNetworkImage(
                            imageUrl: data[index],
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                                  
                                ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fadeOutDuration: const Duration(seconds: 1),
                            fadeInDuration: const Duration(seconds: 3),
                          ),
                          
                          
                          
                          
                        ),
                      ),
                      onTap: () {
                        print("Click on Image Grid item $index");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    ImageDetailPage(data[index], index)));

                        facebookAppEvents.logEvent(
                          name: "Image List",
                          parameters: {
                            'clicked_on_jpeg_image_index': '$index',
                          },
                        );
                      });
                },
                itemCount: data.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
