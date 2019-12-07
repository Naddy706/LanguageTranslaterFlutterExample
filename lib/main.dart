import 'package:flutter/material.dart';
import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';

void main() {
  runApp(new AppL());
}

class AppL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String val = "";
  final languageTranslator = FirebaseLanguage.instance.languageTranslator(
      SupportedLanguages.English, SupportedLanguages.Chinese);
  @override
  void initState() {
    super.initState();
    
    FirebaseLanguage.instance
        .modelManager()
        .downloadModel(SupportedLanguages.Chinese)
        .then((res) => {
        print("success")
        
        });
  }


  Data(t) async {
    String translatedString =
        await languageTranslator.processText(t);
    setState(() {
    val = translatedString;
      
    });

  }
  //  Data(t) async{
  //     final translator = new GoogleTranslator();

  // translator.translate(t, from: 'en', to: 'zh-cn').then((s) {
  //   setState(() {
  //   val = s;

  //   });

  // });
  // // prints Hello. Are you okay?

  // // var translation = await translator.translate("Dart is very cool!", to: 'pl');
  // // print(translation);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English to Chineese '),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (t) => Data(t),
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'English Text'),
            ),
            TextField(
              controller: TextEditingController()..text = val,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Chinese Text'),
            ),
          ],
        ),
      ),
    );
  }
}