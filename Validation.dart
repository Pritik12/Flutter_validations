import 'package:flutter/material.dart';

class Validations extends StatefulWidget {
  const Validations({super.key});

  @override
  State<Validations> createState() => _ValidationsState();
}

class _ValidationsState extends State<Validations> {
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  bool _emailvalid = true;
  bool _passwordvalid = true;

  @override
  void dispose() {
    super.dispose();
    _EmailController.dispose();
    _PasswordController.dispose();
  }

  void validateinputs() {
    setState(() {
      _emailvalid = _EmailController.text.isNotEmpty;
      _passwordvalid = _PasswordController.text.isNotEmpty;
      if (_emailvalid && _passwordvalid) {
        String email = _EmailController.text;
        String password = _PasswordController.text;
        if (email == "Pratik@gmail" && password == "Pratik") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Valid ID & Password",
            style: TextStyle(color: Colors.green),
          )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Please Enter Valid Input",
            style: TextStyle(color: Colors.red),
          )));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[400],
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 240,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    color: Colors.blue),
                child: Container(
                  margin: EdgeInsets.only(top: 160, left: 30),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 42,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 616.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    // border: Border.all(),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    color: Colors.grey[400]),
                child: Column(
                  children: [
                    Container(
                      width: 365,
                      margin: EdgeInsets.only(top: 45),
                      child: TextField(
                        controller: _EmailController,
                        decoration: InputDecoration(
                            hintText: "Login",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                            errorText: _emailvalid ? null : "Invalid try Again",
                            errorStyle: TextStyle(color: Colors.red)),
                      ),
                    ),
                    Container(
                      width: 365,
                      margin: EdgeInsets.only(top: 25),
                      child: TextField(
                        controller: _PasswordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                            errorText:
                                _passwordvalid ? null : "Invalid try Again",
                            errorStyle: TextStyle(color: Colors.red)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ElevatedButton(
                          onPressed: validateinputs,
                          child: Text("Login"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
