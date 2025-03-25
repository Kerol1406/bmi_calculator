import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiApp(),
    );
  }
}
class BmiApp extends StatefulWidget {
  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  double _sliderValue = 150.0;
  String? _selectionGenre;
  int _age = 0;
  int _poids = 0;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI calculator',
            style: TextStyle(
              color: Colors.blue
            ),
          ),
        ) 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap:() {
                      setState(() {
                        _selectionGenre = "male";
                      });
                      print("Click male");
                    },
                    child : SizedBox(
                      width: 180,
                      height: 200,
                      child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: _selectionGenre == "male"
                          ? BorderSide(color: const Color.fromRGBO(229, 144, 174, 1), width: 3.0)
                          : BorderSide.none,
                      ),
                        margin: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 18
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:() {
                      setState(() {
                        _selectionGenre = "female";
                      });
                      print("Click female");
                    },
                    child: SizedBox(
                      width: 180,
                      height: 200,
                      child: Card(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: _selectionGenre == "female"
                            ? BorderSide(color: const Color.fromRGBO(229, 144, 174, 1), width: 3.0)
                            : BorderSide.none,
                        ),
                        margin: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),  
                      ),
                    ),
                  ), 
                ]
              ),
            ),
            const SizedBox(height: 10,),
            // Hauteur
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child : Column(
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      'Height', // Afficher la valeur du slider
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white  
                      ),
                    ),
                    Text(
                      '${_sliderValue.toStringAsFixed(1)}', // Afficher la valeur du slider
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white  
                      ),
                    ),
                    SizedBox(height: 10,),
                    Slider(
                      value: _sliderValue, // Valeur initiale 
                      min: 100,
                      max: 220,
                      divisions: 120, // Division dans le slider
                      label: _sliderValue.round().toString(), // Afficher au dessus du curseur
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value; // MEts à jour à chaque fois la valeur du value
                        });
                      },
                    )
                  ],
                )
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              flex: 1,
              child:
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      height: 200,
                      child:   Card(
                        color: Colors.blue,
                        child: Center(
                          child: Column(
                          children: [
                            SizedBox(height: 10,),
                            const Text(
                              "Age",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "$_age",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _age++;
                                      });
                                      print("Click add age");
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink[100],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      )
                                    ),
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.pink,
                                    )
                                  ),
                                  SizedBox(width: 10,),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (_age > 0) {
                                          _age--;
                                        }
                                      });
                                      //print("Click minus age");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink[100],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                      )
                                    ),
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.pink,
                                    )
                                  ),
                                ],
                              ), 
                            ),
                          ],
                        ),
                        )
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 200,
                      child: Card(
                        color: Colors.blue,
                        child: Column(
                            children: [
                              SizedBox(height: 10,),
                              const Text(
                                "Weight",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "$_poids",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _poids++;
                                        });
                                        print("Click add weight");
                                      }, 
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.pink[100],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        )
                                      ),
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.pink,
                                      )
                                    ),
                                    SizedBox(width: 10,),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_poids > 0) {
                                            _poids--;
                                          }
                                        });
                                        print("Click minus weight");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pink[100],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0)
                                          )
                                      ),
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.pink,
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ),
                    )
                      
                  ],
                ),
              )
              
            ),
              
          ],
        ),
      ),
      bottomNavigationBar:
        InkWell(
          onTap: () {
            double taille = _sliderValue/100;
            int erreur = 0;
            if (_poids == 0 || taille == 0 || _selectionGenre == null) {
              erreur = 1;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    title: Text(
                      "Erreur",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      "Veuillez entrer une taille et un poids valides ou sélectionner un genre",
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Corriger",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      )
                    ],
                  );
                }
              );
            }
            if (taille == 0) {
              return;
            }
            double bmi = _poids / (taille*taille);
            String resultat;
            String message = "";
            if (bmi < 18.5) {
              resultat = "Poids insuffisant";
              message = _selectionGenre == "male"
              ? "Les hommes avec un IMC bas peuvent manquer de masse circulaire."
              : "Les femmes avec IMC bas peuvent être à rique de carence";

            } else if (bmi < 25) {
              resultat = "Poids normal";
              message = "Vous êtes dans la plage normale";
            }
            else if (bmi < 30) {
             resultat = "Surpoids";
             message = _selectionGenre == "male"
              ? "Vous pouvez effectuer un entraîmenment musculaire."
              : "Les femmes en surpoids peuvent envisager une activité cardio";
            }
            else {
              resultat = "Obésité";
              message = "Veillez consulter un médécin pour des conseils";
            }
            if (erreur == 0) {
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    title: Text(
                      "Votre IMC",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "IMC: ${bmi.toStringAsFixed(1)}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          resultat,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          message,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        }, 
                        child: Text(
                          "Fermer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  );
                }
              );
            }
          },
          child: 
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 2.0,
              color: Colors.pink[100],
              child: Padding(
                padding: EdgeInsets.all(10),
                child:  const Text(
                  'CALCULATE',
                  textAlign: TextAlign.center,
                  
                ),
              ),
            ),
          ),
        ),
    );
  }
}