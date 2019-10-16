import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'FadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'ProfileScreen.dart';




class LoginOptions extends StatefulWidget {
  @override
  _LoginOptionsState createState() => _LoginOptionsState();}



class _LoginOptionsState extends State<LoginOptions> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

Future<FirebaseUser> _signIn(BuildContext context) async {
  
   Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text('Sign in'),
        ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

  FirebaseUser userDetails = await _firebaseAuth.signInWithCredential(credential);
  ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
        userDetails.providerId,
        userDetails.displayName,
        userDetails.photoUrl,
        userDetails.email,
        providerData,
);
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new ProfileScreen(detailsUser: details),
      ),
    );
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
        Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill
                )
              ),
              child: Stack(
                children: <Widget>[
                
                  Positioned(
                    child: FadeAnimation(2, Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Center(
                        child: Text("Fitness Tracker", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                      ),
                    )),
                  )
                ],
              ),
            ),  

            SizedBox(
              height: 60,
            ),

          Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              
              SizedBox(
                height: 50,
                child: new RaisedButton(
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            FontAwesomeIcons.mobile,
                            color: Colors.blue,
                            size: 20,
                          ),
                          new SizedBox(
                            width: 5,
                          ), 
                          new Text("Mobile Number", 
                              style: new TextStyle(color: Colors.indigo)),
                        ],
                      ),
                  color: Colors.white,
                  elevation: 15.0,
                  shape: StadiumBorder(),
                  splashColor: Colors.white54,
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                ),
              ),

              SizedBox(
                height: 20,
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
                          Image.asset(
                             'assets/images/google.png',
                             height: 25.0,
                             ),
                          new Text(" Google",
                              style: new TextStyle(color: Colors.indigo)),
                        ],
                      ),
                  color: Colors.white,
                  elevation: 15.0,
                  shape: StadiumBorder(),
                  splashColor: Colors.white54,
                  onPressed: () => _signIn(context)
                              .then((FirebaseUser user) => print(user))
                              .catchError((e) => print(e)),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                child: new RaisedButton(
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon( 
                            FontAwesomeIcons.facebookF,
                            color: Colors.blue,
                            size: 20,
                          ),
                          new SizedBox(
                            width: 5,
                          ),
                          new Text("Facebook",
                              style: new TextStyle(color: Colors.indigo)),
                        ],
                      ),
                  color: Colors.white,
                  elevation: 15.0,
                  shape: StadiumBorder(),
                  splashColor: Colors.white54,
                  onPressed: () {},
                ),
              ),

              SizedBox(
                height: 20,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("By continuing up you agree to ", style: TextStyle(color: Colors.indigo, fontSize: 10),),
                  new GestureDetector(
                      child: Text("Terms of Use",
                          style: TextStyle(color: Colors.indigo,
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () {})
                ],
              ),              
            ],
          ),
        ), 
          ],
        ),
      ),
      ],
     ),
    ),

    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}