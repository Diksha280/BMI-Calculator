import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.blue.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.line_weight),
                    label: Text('Enter Your Weight (in kgs)'),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.height),
                    label: Text('Enter Your Height (in feets)'),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.height),
                    label: Text('Enter Your Height (in inches)'),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                    onPressed: () {

                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if(wt!="" && ft!="" && inch!=""){

                        // BMI Calculation
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt*12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm/100 ;

                        var bmi = iWt/(tM*tM) ;
                        var msg = "";

                        if(bmi>25){
                          msg = "You're Overweight!!";
                          bgColor = Colors.orange.shade200;
                        } else if (bmi<18){
                          msg = "You're Underweight!!";
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = "You're Healthy!!";
                          bgColor = Colors.green.shade200;
                        }

                         setState(() {
                           result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)} ";
                         });

                      }else{
                        setState(() {
                          result = "Please Fill All The Required Blanks!!";
                        });
                      }
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )),
                const SizedBox(height: 18,),
                Text(result, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
