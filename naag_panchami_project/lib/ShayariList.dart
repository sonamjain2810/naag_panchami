import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';
import 'utils/SizeConfig.dart';
import 'ShayariDetailPage.dart';

class ShayariList extends StatefulWidget {
  @override
  _ShayariListState createState() => _ShayariListState();
}

class _ShayariListState extends State<ShayariList> {
  static final facebookAppEvents = FacebookAppEvents();
  var data = [
    "करो भक्तों नाग की पूजा दिल से\nहोंगे भोले बाबा बहुत खुश आप से\nनाग देवता को पिलाओ दूध पंचमी पर आप\nशिव देंगे वरदान और दूर होंगे सारे पाप\nआपका जीवन सुखमय हो",
    "आओ सब मिलकर नाग-पंचमी मनाएं,\nअपने घर आंगन को फूलों से सजाएँ,\nहोंगे खुश महादेव हम भक्तों से,\nआपको नाग-पंचमी की बधाई हो दिल से.",
    "देवादिपति महादेव का है आभूषण,\nश्री विष्णु भगवान का है शेष नाग सिंहासन.,\nअपने फन पर जिसने पृथ्वी उठाई.,\nऐसे नाग देवता को मेरा वंदन.\nनाग पंचमी की शुभकामनाएँ",
    "हर हर महादेव\nआपको और आपके परिवार को\nनाग पंचमी के इस शुभ त्यौहार\nपर बहुत बहुत शुभकामनाएँ",
    "आदमी कितना बावरा पंचमी पर नाग को पूजन जाए.\nघर की नागिन को ना पूजे जिससे रोज़ वो डसा जाए.\nनाग पंचमी की हार्दिक शुभकामनाएँ.",
    "गले में शिव बाबा के विराजे नाग,\nअपने फन पर रखे है पृथ्वी को,\nऐसे हैं शक्तिशाली देवता हमारे नाग,\nइनके चरणों में हमारा कोटि-कोटि प्रणाम\nनाग पंचमी की हार्दिक शुभकामनाएँ",
    "हर-हर हो महादेव शिव का\nहर पल नाम तुम्हारा जपें\nनाग-पंचमी का आया त्यौहार\nशिव को करते हम नमन बारम्बार\nशिव बाबा करें बेड़ा पार\nहैप्पी नाग पंचमी",
    "भगवान शिव सावन की पावन,\nमास में आप लोगों के पूरे,\nपरिवार की रक्षा करें.\nनाग पंचमी की हार्दिक शुभकामनाएँ",
    "सावन के महीने में नाग पंचमी का त्यौहार हैं,\nभगवान् शिव के गले में सापों का हार हैं,\nजो पिलाए दूध सच्चे दिल से सापों को,\nउसका बेड़ा पार हैं.\nनागपंचमी पर ढेर सारी शुभकामनाएँ",
    "इस नाग पंचमी पर नाग देवता का आर्शीवाद सदैव बना रहे,\nजन-जन के जीवन में खुशियों का आवागमन सदैव लगा रहे.\nहैप्पी नागपंचमी",
    "सापों को दूध पिलाने का रस्म आप भी निभाएँ.\nनाग पंचमी की आपको ढेर सारी शुभकामनाएँ.\nशुभ नाग पंचमी",
    "नाग देवता करे आपकी रक्षा\nपिलाये दूध उन्हें मीठा मीठा,\nहो आपके घर में धन की बरसात,\nऐसी शुभ हो नाग पंचमी की सौगात.",
    "नाग पंचमी की शुभकामनाएँ\nदेवादिपति महादेव का है आभूषण\nश्री विष्णु भगवान का है शेष नाग सिंहासन\nअपने फन पर जिसने पृथ्वी उठाई\nऐसे नाग देवता को मेरा वंदन.",
    "सावन का महीना है,\nनाग पंचमी का त्यौहार है,\nशिव भोले की कृपा है सब पर,\nजो जापे नाम शिव का उसका बेड़ा पार है.",
    "आपके जीवन में आये,\nसुख, शांति और लक्ष्मी,\nमुबारक हो आपको इस साल की नागपंचमी\nशुभ नाग पंचमी",
    "सावन के महीने में नाग पंचमी का त्यौहार हैं,\nभगवान शिव के गले में सापों का हार हैं,\nजो पिलाए दूध सच्चे दिल से सापों को\nउसका बेड़ा पार हैं.\nनागपंचमी पर ढेर सारी शुभकामनाएँ",
    "शिव बाबा के प्यारे हैं नाग-देवता,\nकरते हम सबकी पूरी मनोकामना,\nहोंगे सब काम पूरे आप सबके,\nअगर रहे आप सबकी शुद्ध भावना.\nनाग पंचमी मुबारक हो",
    "शिवजी के गले में स्वर,\nअपने फन पर लेकर पृथ्वी को,\nलिया है तार,\nऐसे नाग देवता को,\nहमारा कोटि कोटि प्रणाम.",
    "आई है सावन के महीने में,\nनाग-पंचमी की पावन बेला,\nआओ सब मिलकर इसे मनाएं,\nऔर साथ में जाएँ देखने मेला,\nबधाई हो नाग-पंचमी की"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shayari List",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding:
                          EdgeInsets.all(1.93 * SizeConfig.widthMultiplier),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primaryVariant,
                                ),
                                borderRadius:
                                    // 40 / 8.96 = 4.46
                                    BorderRadius.all(Radius.circular(
                                        4.46 * SizeConfig.widthMultiplier))),
                            child: ListTile(
                              leading: Icon(
                                Icons.brightness_1,
                                color: Theme.of(context).primaryIconTheme.color,
                              ),
                              title: Text(
                                data[index],
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                              color: Theme.of(context).primaryIconTheme.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  ShayariDetailPage(data[index], index)));

                      facebookAppEvents.logEvent(
                        name: "Shayari List",
                        parameters: {
                          'clicked_on_shayari_index': '$index',
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
