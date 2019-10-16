import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';


class MobileLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 130.0),
            child: Image.asset(
                             'assets/images/person.jpg',
                             height: 55.0,
                             ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
            child: Text(
              "Enter your mobile number\nWe will send you the OTP to verify",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.indigo,
                decoration: TextDecoration.none,
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                fontFamily: "OpenSans",
              ),
            ),
          ),
         
         Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10)
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                        color: Colors.grey[200], style: BorderStyle.solid, width: 0.80),
                        ),
                          // padding: EdgeInsets.all(8.0),
                          // decoration: BoxDecoration(
                            // border: Border(bottom: BorderSide(color: Colors.grey[100])), 
                          // ),
                          child: CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IN') OR dial_code('+91')
                            initialSelection: 'IN',
                            favorite: ['+91','IN'],
                            
                            // optional. Shows only country name and flag
                            showCountryOnly: true,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: true,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                            ),
                        
                        ), 
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          // padding: EdgeInsets.all(8.0),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: TextField(
                              decoration: InputDecoration( 
                                border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey, width: 0.0),),
                                hintText: "Mobile Number",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                
                              ),
                            ),
                          ),
                        ), SizedBox(
                          height: 10,
                        ),
                        
                        SizedBox(
                height: 50,
                child: new RaisedButton(
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          new SizedBox(
                            width: 5,
                          ), 
                          new Text("Submit", 
                              style: new TextStyle(color: Colors.black)),
                        ],
                      ),
                  color: Colors.grey[300],
                  elevation: 15.0,
                  shape: StadiumBorder(),
                  splashColor: Colors.white54,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 15,
              )
                      ],
                    ),
                  ),
                  
                
                  
                  
                ],
              ),
            )
         
         
        ],
      ),
    );
  }
}