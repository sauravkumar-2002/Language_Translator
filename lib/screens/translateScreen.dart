import 'dart:async';


import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';
import 'package:your_translator/db/crud.dart';
import 'package:your_translator/db/model.dart';

import '../db/database.dart';

var  from_text_controller=TextEditingController();
var  to_text_controller=TextEditingController();
late UserDatabase database;
 List<Data_t>data=[];
class TranslateScreen extends StatefulWidget{




  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
   List<Item>_data=[];
//blue --313586
//orange-- DE6739


  var myopacity = 0.0;
  var  from_text_controller=TextEditingController();
  var  to_text_controller=TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  String dropdownValue="en";

 static const Map<String, String> languageList = {
    'auto': 'Automatic',
    'af': 'Afrikaans',
    'sq': 'Albanian',
    'am': 'Amharic',
    'ar': 'Arabic',
    'hy': 'Armenian',
    'az': 'Azerbaijani',
    'eu': 'Basque',
    'be': 'Belarusian',
    'bn': 'Bengali',
    'bs': 'Bosnian',
    'bg': 'Bulgarian',
    'ca': 'Catalan',
    'ceb': 'Cebuano',
    'ny': 'Chichewa',
    'zh-cn': 'Chinese Simplified',
    'zh-tw': 'Chinese Traditional',
    'co': 'Corsican',
    'hr': 'Croatian',
    'cs': 'Czech',
    'da': 'Danish',
    'nl': 'Dutch',
    'en': 'English',
    'eo': 'Esperanto',
    'et': 'Estonian',
    'tl': 'Filipino',
    'fi': 'Finnish',
    'fr': 'French',
    'fy': 'Frisian',
    'gl': 'Galician',
    'ka': 'Georgian',
    'de': 'German',
    'el': 'Greek',
    'gu': 'Gujarati',
    'ht': 'Haitian Creole',
    'ha': 'Hausa',
    'haw': 'Hawaiian',
    'iw': 'Hebrew',
    'hi': 'Hindi',
    'hmn': 'Hmong',
    'hu': 'Hungarian',
    'is': 'Icelandic',
    'ig': 'Igbo',
    'id': 'Indonesian',
    'ga': 'Irish',
    'it': 'Italian',
    'ja': 'Japanese',
    'jw': 'Javanese',
    'kn': 'Kannada',
    'kk': 'Kazakh',
    'km': 'Khmer',
    'ko': 'Korean',
    'ku': 'Kurdish (Kurmanji)',
    'ky': 'Kyrgyz',
    'lo': 'Lao',
    'la': 'Latin',
    'lv': 'Latvian',
    'lt': 'Lithuanian',
    'lb': 'Luxembourgish',
    'mk': 'Macedonian',
    'mg': 'Malagasy',
    'ms': 'Malay',
    'ml': 'Malayalam',
    'mt': 'Maltese',
    'mi': 'Maori',
    'mr': 'Marathi',
    'mn': 'Mongolian',
    'my': 'Myanmar (Burmese)',
    'ne': 'Nepali',
    'no': 'Norwegian',
    'ps': 'Pashto',
    'fa': 'Persian',
    'pl': 'Polish',
    'pt': 'Portuguese',
    'pa': 'Punjabi',
    'ro': 'Romanian',
    'ru': 'Russian',
    'sm': 'Samoan',
    'gd': 'Scots Gaelic',
    'sr': 'Serbian',
    'st': 'Sesotho',
    'sn': 'Shona',
    'sd': 'Sindhi',
    'si': 'Sinhala',
    'sk': 'Slovak',
    'sl': 'Slovenian',
    'so': 'Somali',
    'es': 'Spanish',
    'su': 'Sundanese',
    'sw': 'Swahili',
    'sv': 'Swedish',
    'tg': 'Tajik',
    'ta': 'Tamil',
    'te': 'Telugu',
    'th': 'Thai',
    'tr': 'Turkish',
    'uk': 'Ukrainian',
    'ur': 'Urdu',
    'uz': 'Uzbek',
    'ug': 'Uyghur',
    'vi': 'Vietnamese',
    'cy': 'Welsh',
    'xh': 'Xhosa',
    'yi': 'Yiddish',
    'yo': 'Yoruba',
    'zu': 'Zulu'
  };







  @override
  void initState() {
    Timer(Duration(milliseconds: 950), () {
      setState(() {
        myopacity = 1.0;
      });
    });
    super.initState();
    setdb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: AnimatedOpacity(
            opacity: myopacity,
            duration: Duration(seconds: 1),
            child: Container(


              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 8,),
                  Center(

                    child: Hero(
                        tag: "logo",
                        child: Image.asset(
                          'assets/images/trans.png', width: 130, height: 130,)),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 21, bottom: 42),
                      child: Text("Your Translator",style: TextStyle(color: Colors.red,fontWeight:FontWeight.bold,fontSize: 24),)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 9.0),
                    child: Container(
                        color: Color(0xfff8eeee),
                      child: TextField(
                        decoration: _inputDecoration_("Enter Your Text Here.."),
                        minLines: 1,
                        maxLines: 10,
                        controller: from_text_controller,
                        obscureText: false,
                        //decoration: inputDecoration_Email(emailText),
                        keyboardType: TextInputType.emailAddress,
                        //onChanged: (text) => setState(() =>_email_textfield_error_text=errorText(emailText, "email")
                        ),
                    ),



                    ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged:(val){
                          setState(() {
                            dropdownValue=val!;
                          });
                        },
                        items: languageList
                            .map((string, value) {
                          return MapEntry(
                            string,
                            DropdownMenuItem<String>(
                              value: string,
                              child: Text(value),
                            ),
                          );
                        })
                            .values
                            .toList(),
                      ),

                      Container(
                        /*child: InkWell(
                          onTap: exchange(),
                          child: Image.asset(
                          'assets/images/exc.png', width: 30, height: 30,),
                        ),*/
                        child: OutlinedButton(
                          onPressed: () {
                            exchange();

                          },
                          style: OutlinedButton.styleFrom(//<-- SEE HERE
                              side: BorderSide(width: 0,color: Colors.white),

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),


                          ),



                          child: Image.asset(
                            'assets/images/exc.png', width: 30, height: 30,),
                          //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 9.0),
                    child: Container(
                      color: Color(0xfff9fbf8),
                    child: TextField(
                      enableInteractiveSelection: false,
                      focusNode: FocusNode(),

                      decoration: _inputDecoration_("Your Converted Text.."),
                      minLines: 1,
                      maxLines: 10,
                      controller: to_text_controller,
                      obscureText: false,
                      //decoration: inputDecoration_Email(emailText),
                      keyboardType: TextInputType.emailAddress,
                      //onChanged: (text) => setState(() =>_email_textfield_error_text=errorText(emailText, "email")
                    ),
                    )


                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: OutlinedButton(
                      onPressed: () {
                        translate_text();

                      },
                      style: OutlinedButton.styleFrom(//<-- SEE HERE
                          side: BorderSide(width: 1.4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),

                          backgroundColor: Color(0xffF8EBEBFF)
                      ),



                      child: Text(' Translate ',
                        style:TextStyle(fontSize: 17,color: Color(0Xff313586),fontWeight: FontWeight.bold),
                      ),
                      //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                    ),
                  ),
                SizedBox(height: 28,),
                 _buildList(),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void translate_text() {
    translator.translate(from_text_controller.text,to:"$dropdownValue").then((value){
      setState(() {
        to_text_controller.text=value.toString();
        print(value);
        saveToDatabase();
        //https://medium.flutterdevs.com/multi-language-translator-in-flutter-14b927a0e777
      });

    });
  }

  exchange() {
    String s=to_text_controller.text.toString();
    setState(() {
      to_text_controller.text=from_text_controller.text.toString();
      from_text_controller.text=s;
    });

  }
  InputDecoration _inputDecoration_(String s){
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Color(0xffDE6739),
            width: 2,
          )
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Color(0xff313586),
            width: 2,
          )
      ),
      labelText: s,
      labelStyle: TextStyle(color: Color(0Xff313586),),
      suffixIcon: IconButton(
        onPressed: () {
          if(s=="Enter Your Text Here..") {
            Clipboard.setData( ClipboardData(text: from_text_controller.text.toString())).then((result){
              // show toast or snackbar after successfully save


            }); } else {
            Clipboard.setData(ClipboardData(text: to_text_controller.text.toString()));
          }
          Fluttertoast.showToast(msg: "copied");
        },
        icon:Icon(Icons.copy,color: Color(0Xff313586),),
      ),
    );
  }

  void saveToDatabase() async{
    addUsers(database, from_text_controller.text.toString(), to_text_controller.text.toString());
    data= await retrieveUserr(database);
    data=data.reversed.toList();
    setState(() {
      _data=generateItems(data.length, data);
    });
  }

  Future<void> setdb() async {
    database = await $FloorUserDatabase.databaseBuilder('app_database.db').build();
    data= await retrieveUserr(database);
    data=data.reversed.toList();
    print("fff");
    print(data[0].to_string);
    print(data[0].date);
    setState(() {
      _data=generateItems(data.length, data);
    });


  }



  Widget _buildList() {
    return ExpansionPanelList(
      expansionCallback: (int index,bool isExpanded){
        setState(() {
          print("object");
          print(index);
          _data[index].isExpanded=!isExpanded;
        });
      },
      children:_data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
            headerBuilder:(BuildContext context,bool isExpanded){
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: _body_for_expanded_list_view(item),
            isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }

  Widget _body_for_expanded_list_view(Item item){
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('FROM:- ',style: TextStyle(fontWeight:FontWeight.bold)),

                Text(data[item.index].from_string)
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text('TO:- ',style: TextStyle(fontWeight:FontWeight.bold)),

                Text(data[item.index].to_string)
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(data[item.index].date),

                InkWell(
                    onTap: () async {
                     print("ontap");
                    // delete_(item);
                     deleteuser(database, data[item.index].id!);
                     data= await retrieveUserr(database);
                     setState(() {

                       data=data.reversed.toList();
                       _data=generateItems(data.length, data);
                     });

                    },
                    child: Icon(Icons.delete_forever)),
              ],
            ),

          ]
      ),
    );
  }

  void delete_(Item item){
    print("delete");
    //Data_t? x=await deleteuser(database, data[item.index].id!);
    setState(() {

      print("eeeeeeeeeeeeeee");


    });
  }






}


class Item{
  String expandedValue;
  String headerValue;
  bool isExpanded;
  int index;

  Item({required this.expandedValue,required this.headerValue,this.isExpanded=false,required this.index});

}

List<Item> generateItems(int numberofItems,List<Data_t>data) {
  print(numberofItems);
  print(data.length);
  print(data.toString());
  return List.generate(numberofItems, (index) {
    return Item(expandedValue: "Di desc",
        headerValue: data[index].from_string,
        index: index);
  });
}
