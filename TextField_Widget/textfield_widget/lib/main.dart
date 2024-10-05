import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String? myName;
  String? myPass;

  /// Boolean to toggle password visibility
  bool _obscurePassword = true;


  ///this empty list makes the ListView Dynamic and
  List<String> playerList = [];

  ///creating the object of TextEditingController
  TextEditingController nameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  ///with the help of TextEditingController constrolls the Textfield

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TextField_Dynamic ListView",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                ///controller linking as namecontroller
                controller: nameController,

                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  ///je input gheto keyboard kadun tyala decorate karne
                  hintText: "Enter Name",
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20))), //outline border
                ),

                onChanged: (String val) {
                  ///js jsa chnage hoel tsa onchange dakhavto
                  print("value: $val");
                },
                onEditingComplete: () {
                  ///jevha input deun hoel theva editing complete la call jato
                  print("Editing complete");
                },
                onSubmitted: (value) {
                  print("Value Submitted: $value");
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                ///controller linking as namecontroller
                controller: PasswordController,

                style: const TextStyle(fontSize: 20),
                obscureText: _obscurePassword, // To toggle password visibility///to hide the password in the input textfield,
                
                decoration:  InputDecoration(
                  ///je input gheto keyboard kadun tyala decorate karne
                  hintText: "Password",
                  hintStyle:const  TextStyle(fontSize: 20, color: Colors.grey),
                   // Lock icon at the start of the text field
                  prefixIcon: const Icon(Icons.lock),
                  
                  // Eye icon at the end of the text field to toggle visibility
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword; // Toggle visibility
                      });
                    },
                  ),
                  
                   
                 
                  
                  border:const OutlineInputBorder(
                    
                      borderRadius: BorderRadius.all(
                          Radius.circular(20),
                          ),
                          
                          ), //outline border
                ),
              ),
            ),

            //container used as button with help of gesturedectector
            GestureDetector(
              onTap: () {
                print("ADD DATA");

                ///in myName variable inputtext is stored as nameController.Text gives the value in the textField and trim() is used for removing the whiteSpaces in the inputString
                myName = nameController.text.trim();
                myPass = PasswordController.text.trim();
                print("MyName:$myName");

                if (myName != "" && myPass != " ") {
                  ///adding the input values in list

                  playerList.add(
                      myName!); //mybe in inputstring the value is null also
                  //playerList.add(myPass!);
                  print("Playerlist length :${playerList.length}");

                  nameController.clear();
                  PasswordController.clear();

                  ///after inputstring is entering and press enter or add data then Textfield is empty or clear
                  setState(() {});

                  ///after adding input string in listview and clearing the Textfield call the setstate()
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Text(
                  "Add Data",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListView.builder(
                itemCount: playerList.length,
                shrinkWrap: true,

                ///ListView Column Chy aat yet asel tr karan Listview builder ha infinite ahe ani kami karnyasathi shrinkwrap use karatat
                ///or error yete vertical Unbounded height

                ///as per this dynamic List length makes ListView Builder Dynamic
                itemBuilder: (context, index) {
                  return Text(
                    "Name :${playerList[index]}",
                    
                    style: const TextStyle(fontSize: 30),
                  );
                })
          ],
        ),
      ),
    );
  }
}
