import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget{
  const ForgotPasswordPage({Key? key}): super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>{
  final emailController = TextEditingController();


  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text('Password reset link sent! Check your email!'),
          );
        },
      );
    } on FirebaseAuthException catch (e){
      print(e);
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation:0,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter your Email and we will send you a password reset link',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize:20),),
          ),
        SizedBox(height: 20),
          Padding(
        padding: const EdgeInsets.only(left:0.0,right: 15.0,top:0,bottom: 0),
    //padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Enter valid email id as abc@gmail.com'),
          validator: (value) {
          if (value!.length == 0) {
          return "Email cannot be empty";
          }
          if (!RegExp(
          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
          return ("Please enter a valid email");
          } else {
          return null;
          }
          },
          onSaved: (value) {
          emailController.text = value!;
          },
          keyboardType: TextInputType.emailAddress,
          ),
         ),
          SizedBox(height:20),
          MaterialButton(onPressed: passwordReset,
           child: Text('Reset Password'),
          color: Colors.green,)
        ],
      ),
    );
  }
}