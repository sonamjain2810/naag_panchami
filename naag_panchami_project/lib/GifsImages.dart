import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'utils/SizeConfig.dart';
import 'GifDetailPage.dart';

class GifsImages extends StatefulWidget {
  @override
  _GifsImagesState createState() => _GifsImagesState();
}

class _GifsImagesState extends State<GifsImages> {
  static final facebookAppEvents = FacebookAppEvents();

  var data = [
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/1.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/2.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/3.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/4.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/5.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/6.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/7.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/8.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/9.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/10.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/11.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/12.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/13.gif",
    "http://www.andiwiniosapps.in/nag_panchami_message/nag_panchami_gifs/14.gif",
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gif Images",
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
                      //8.0
                      padding:
                          EdgeInsets.all(1.93 * SizeConfig.widthMultiplier),

                      child: ListTile(
                        title: CachedNetworkImage(
                          imageUrl: data[index],
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fadeOutDuration: const Duration(seconds: 1),
                          fadeInDuration: const Duration(seconds: 3),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("Click on Gif Grid item $index");
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  GifDetailPage(data[index], index)));

                      facebookAppEvents.logEvent(
                        name: "GIF List",
                        parameters: {
                          'clicked_on_gif_image_index': '$index',
                        },
                      );
                    },
                  );
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
