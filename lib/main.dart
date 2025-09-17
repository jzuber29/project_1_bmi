import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: BmiApp(),
    ),
  );
}

class BmiApp extends StatefulWidget {
  const BmiApp({super.key});

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {

  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();

  var result="";
  var bgColor=Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
      title: Text('your BMI'),
     ),
     body: Container(
      color: bgColor,
       child: Center(
         child: Container(
         
          width: 300,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BMI', style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w700
              ),),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter your wt in kgs'),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(height: 11),
                TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text('Enter your height in ft'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(height: 11),
                TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Text('Enter your height in inch'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(height: 11),
              ElevatedButton(
                onPressed: (){
                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inController.text.toString();
                  if (wt!=""&&ft!=""&&inch!=""){
                    var iWt=int.parse(wt);
                    var iFt=int.parse(ft);
                    var iInch=int.parse(inch);
       
                    var tInch=(iFt*12)+iInch;
                    var tCm=tInch*2.54;
                    var tM=tCm/100;
       
                    var bmi=iWt/(tM*tM);

                    var msg='';


                    if (bmi>25){
                      msg='You are overweight';
                      bgColor=Colors.orange.shade200;

                    }else if(bmi<18){
                      msg='You are Underweight';
                      bgColor=Colors.red.shade200;

                    }else {
                      msg='You are Healthy';
                      bgColor=Colors.green.shade200;

                    }
       
                    setState(() {
                      result='$msg \n BMI is : ${bmi.toStringAsFixed(2)}';
                    });
       
                    
       
       
                  }else{
                    setState(() {
                      result='Please fill all required blanks!!';
                      
       
                    });
       
                  }
       
                },
                
                 child: Text('Calculate'),
                 ),
                 SizedBox(height: 11),
                 Text(result, style: TextStyle(fontSize: 17),
                 ),
           
            ],
           ),
         ),
       ),
     ),
      
    );
  }
}
