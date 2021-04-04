import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/material.dart';

import 'utils/SizeConfig.dart';
import 'MessageDetailPage.dart';

class MessagesList extends StatefulWidget {
  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  static final facebookAppEvents = FacebookAppEvents();
  var data = [
    "“May Lord Shiva is always there to bless you and your loved ones with happiness and prosperity in life…. Warm wishes on Nag Panchami.”",
    "“May Nag Devta is always there to protect you from all the negativities in life and bless you with success and growth…. Wishing you a very Happy Nag Panchami.”",
    "“May the auspicious occasion of Nag Panchami bring along positivity in your life…. May Lord Shiva shower you with His choicest blessings and love.”",
    "“Let us celebrate the special occasion of Nag Panchami by offering prayers and milk to Nag Devta to seek forgiveness and blessings…. Happy Nag Panchami.”",
    "“Wishing a very Happy Nag Panchami to you…. May the goodness of this festival fill your heart and home with eternal happiness and joy!!”",
    "“Don’t forget to offer milk to Nag Devta and prayers to Lord Shiva on the auspicious occasion of Nag Panchami…. Warm greetings to you on this special day!!!”",
    "“Nag Panchami always reminds us of the importance of Nag Devta in our lives and also gives us an opportunity to offer our prayers to them…. Happy Nag Panchami.”",
    "“May Nag Devta is always there to bless you, to protect you from the bad and guide you towards the good…. Wishing a very Happy Nag Panchami to you.”",
    "“May the auspicious occasion of Nag Panchami be full of celebrations and spirituality for you and your loved ones…. Warm wishes on this pious day.”",
    "“May all your wishes are granted by Lord Shiva on the auspicious day of Nag Panchami…. May you walk the path of success and growth with his choicest blessings.”",
    "“A very blessed and Happy Nag Panchami to you…. May the positivity and blessings of Lord Shiva help you prosper in your life.”",
    "“Wishing you the best of celebrations and festivities on Nag Panchami… May you enjoy this day with your loved ones by offering prayers to Nag Devta and Lord Shiva.”",
    "“Today is the day to seek blessings and love of Lord Shiva….. Today is the day to offer him prayers… Today is the day to wish everyone Happy Nag Panchami.”",
    "“Let us bow our heads in prayer to Nag Devta to seek blessings and also forgiveness for our wrong deeds…. Warm wishes on Nag Panchami!!!”",
    "“The auspicious occasion of Nag Panchami is here and I wish that you and your loved ones are showered with happiness, health and prosperity.”",
    "आपके जीवन में आये,\nसुख, शांति और लक्ष्मी,\nमुबारक हो आपको इस साल की नागपंचमी\nशुभ नाग पंचमी",
    "भोले नाथ के प्यारे हैं नाग देवता, करते हैं सभी पूरी मनोकामना, होंगे सब काम पूरे आप सबके, अगर रहे आपकी शुद्ध भावना!!\nनागपंचमी की हार्दिक शुभकामनाएं",
    "सावन का आया भक्‍तों महीना है, नाग पंचमी का त्‍योहार है, जो दिल से बाबा का नाम जपे हरदम, उसका होता हमेशा बेड़ापार है.\nनागपंचमी की हार्दिक शुभकामनाएं",
    "हर-हर हो महादेव शिव का, हर पल नाम तुम्हारा जपे, नाग-पंचमी का आया त्योहार, शिव को करते हम नमन बारम्बार, शिव बाबा करें बेड़ा पार.\nनागपंचमी की हार्दिक शुभकामनाएं",
    "नाग देवता करें आपकी रक्षा, पिलाएं दूध उन्हें मीठा मीठा, हो आपके घर में धन की बरसात.\nनागपंचमी की हार्दिक शुभकामनाएं",
    "आओ सब मिलकर नाग-पंचमी मनाएं,\nअपने घर आंगन को फूलों से सजाएँ,\nहोंगे खुश महादेव हम भक्तों से,\nआपको नाग-पंचमी की बधाई हो दिल से.\nनागपंचमी की हार्दिक शुभकामनाएं",
    "इस नाग पंचमी पर ईश्वर का शुभ आशीर्वाद सदैव आप पर बना रहे!\nशुभ नाग पंचमी!",
    "नाग पंचमी की शुभकामनाये\nदेवादिपति महादेव का है आभूषण\nश्री विष्णु भगवान का है शेष नाग सिंहासन\nअपने फन पर जिसने पृथ्वी उठाई\nऐसे नाग देवता को मेरा वंदन.",
    "Es Nag Panchami par Ishwar Ke Shubh\nAashirvad sadaiv aap par bane rahe !\nNag Panchami Mangalmay Ho !!!!!",
    "आज नागपंचमी है\nसमाज के सभी नागों को प्रणाम.",
    "इस नागपंचमी\nहम सब आस्तीनों के सापों को दूध ना पिला उन्हें कुचलने का प्रण लें.\nशुभ नागपंचमी",
    "आस्तीन के सांपों को भी नागपंचमी की अनंत बधाई और शुभकामनाएँ.",
    "आज धूमधाम से नागपंचमी मनाया जा रहा है.\nआप सभी को नागपंचमी की हार्दिक शुभकामनाएँ.\nसभी आस्तीन को दूध पीने का निमंत्रण है जी.",
    "जंगल के नाग,खेतो और झाड़ियो के नाग\nशहरी नागो तथा,गावो के नागो समेत\nदेश में छुपे आस्तीन के विषैले नागो को भी\nनागपंचमी की शुभकामना",
    "Shivji Ke gale Me sawar, Apne Fan Par Lekar Prithvi ko liya Hai Taar. Aise Nag Devata Ko\nHamara Koti Koti Pranam! Happy Nag Panchami",
    "नाग देवता करे आपकी रक्षा\nपिलाये दूध उन्हें मीठा मीठा,\nहो आपके घर में धन की बरसात,\nऐसी शुभ हो नाग पंचमी की सौगात|",
    "Har har Mahadev, Aapko aur aapke pariwar ko Nag Panchami ke is shubh tyohar par bahut bahut shubhkamnaayein.",
    "Shiv ke sakti swaroopa, Sab loko me vyapt, Tino lok me mil jate he tumhare darshnarth!\nHappy Nag Panchami",
    "“Har Har Mahadev…. Nag Panchami ka yeh paavan parv aapke aur aapke parivar ke liye dher saari khushiyan saath le kar aaye…. Nag Panchami ki shubh kamnayein!!!”",
    "“Shub ho aapke liye Nag Panchami ka yeh paavan din…. Sheesh nivakar samarpit karein apne aapko Nag Devta ke charno mein is din…. Nag Panchami hi hardik badhai.”",
    "“Shiv ki shakti aur aapki bhakti se sanwar jaaye aapka jeevan…. Nag Panchami ka tyohar aapke liye sang le kar aaye sukh aur samridhi…. Nag Panchami mangalmay ho!!!”",
    "“Shiv ki bhakti mein ho jayein leen…. Prarthna aur archana se jeet lein unka mann…. Nag Panchami ka tyohar ho aapke liye bahut ki khaas.”",
    "“Naag devta ko dudh chadha kar, shiv ji ki archana karke manayein Nag Panchami ka yeh tyohar…. Awayam ko samarpit kar dein shiv ke charno mein har baar.”"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages List",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  MessageDetailPage(data[index], index)));

                      facebookAppEvents.logEvent(
                        name: "Message List",
                        parameters: {
                          'clicked_on_message_index': '$index',
                        },
                      );
                    },
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
                                    // 40 /8.98 = 4.46
                                    BorderRadius.all(Radius.circular(
                                        4.46 * SizeConfig.widthMultiplier))),
                            child: ListTile(
                              leading: Icon(Icons.brightness_1,
                                  color: Theme.of(context).primaryIconTheme.color),
                              title: Text(
                                data[index],
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color:
                                      Theme.of(context).primaryIconTheme.color),
                            ),
                          ),
                        ],
                      ),
                    ),
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
