import 'dart:convert';
import 'package:vaccine_slot/slots.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter/src/material/material_state.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.teal,
        primaryColor: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pincode_controller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();
  String dropdownValue='01';
  List slots = [];
  //-----------------------------------------------------

    fetchSlots()async{
      await http.get(Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode='
          + pincode_controller.text+'&date='
          +daycontroller.text+'%2F' + dropdownValue+'%2F2021')).then((value)
      {
        Map result = jsonDecode(value.body);
        setState(() {
          slots = result['sessions'];
        });
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Slot(slots: slots)));
      }
      ) ;
  }


  //-----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Vaccination Slots'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 250,
                margin: const EdgeInsets.all(20),
                child:Image.network('https://media.istockphoto.com/photos/vaccination-record-card-for-covid19-with-vials-and-syringe-hand-in-picture-id1289491114'
            ,
                height: 320,
                  width: 320,
                ) ,
              ),
              TextField(
                controller: pincode_controller,
                keyboardType: TextInputType.number,
                maxLength: 6 ,
                decoration: const InputDecoration(
                  hintText: 'Enter pincode',
                ),

              ),
              Row(
                children: [
                  Expanded(
                      child:Container (
                        height: 60,
                          child:TextField(
                          controller: daycontroller,
                          decoration: const InputDecoration(
                            hintText: 'Enter Date',
                          ),
                          )
                      ),
                  ),
                  Expanded(
                      child:Container(
                        height:52 ,
                        child:DropdownButton<String>(
                        isExpanded:true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          '01','02','03',
                          '04','05','06',
                          '07','08','09',
                          '10','11','12'
                        ]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                  onPressed: () {
                    fetchSlots();
                  },
                  child: const Text('Find Slots'),
                  ),


                ),
            ],
          ),
        ),
      ),
    );
  }
  // '01','02','03',
  // '04','05','06',
  // '07','08','09',
  // '10','11','12'
}

