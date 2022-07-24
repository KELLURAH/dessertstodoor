import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/components/widgetFunctinos.dart';
import '../../../../core/utils/Colors.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String email;

  const ProfilePage({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bool showPassword = false;

  // final DatabaseService _db = DatabaseService();
  final imagePicker = ImagePicker();
  File? _image;
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    // ignore: missing_return
    setState(() {
      _image = File(image!.path);
    });
    return _image;
  }

  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController usernameCon = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void clearAll() {
    emailCon.clear();
    passwordCon.clear();
    phoneCon.clear();
    nameCon.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(false, title: 'Profile Settings'),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red[100]),
                onPressed: () {
                  clearAll();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'CANCEL',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.red[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  primary: SECOND_COLOR, //!elevatedButton background
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
                child: Text(
                  'UPDATE',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      body: Scrollbar(
        thickness: 6,
        radius: const Radius.circular(25),
        child: Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 10,
          ),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: <Widget>[
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.5,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 12,
                              spreadRadius: 4,
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 15),
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://randomuser.me/api/portraits/men/30.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            color: Colors.black,
                            onPressed: getImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                addVertical(MediaQuery.of(context).size.height * 0.075),
                Row(
                  children: [
                    const Icon(
                      Icons.info_outlined,
                      color: Colors.amber,
                    ),
                    addHorizontal(10),
                    Text(
                      'Edit your details below. Please make sure'
                      '\nto provide us with the correct information.',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        letterSpacing: .25,
                        color: SECOND_COLOR,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                buildTextField(
                  'Username',
                  widget.name,
                  false,
                  false,
                  usernameCon,
                ),
                buildTextField(
                  'Full Name',
                  'Eg: Kofi Kyei',
                  false,
                  false,
                  nameCon,
                ),
                buildTextField(
                  'E-mail',
                  widget.email,
                  false,
                  true,
                  emailCon,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 35,
                    right: 35,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    obscureText: false,
                    maxLength: 10,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      labelText: 'Phone Number',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '020 xxx xxxx',
                      hintStyle: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      labelStyle: GoogleFonts.raleway(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: .25,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black54,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 'value',
                            groupValue: 'Sex',
                            onChanged: (check) {},
                          ),
                          Text(
                            'Male',
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'value',
                            groupValue: 'Sex',
                            onChanged: (check) {},
                          ),
                          Text(
                            'Female',
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: buildTextField(
                          'Blood Group',
                          'Eg: O+',
                          false,
                          false,
                          usernameCon,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: buildTextField(
                          'Blood Group',
                          'Eg: 98/13',
                          false,
                          false,
                          heightController,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: buildTextField(
                          'Height',
                          'Eg: 567cm',
                          false,
                          false,
                          weightController,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: buildTextField(
                          'Weight',
                          'Eg: 56.7kg',
                          false,
                          false,
                          heightController,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
  String labelText,
  String placeholder,
  bool isPasswordTextField,
  bool uneditable,
  TextEditingController controller, {
  bool showPassword = false,
  bool isContact = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, left: 35, right: 35, bottom: 10),
    child: TextFormField(
      readOnly: uneditable ? true : false,
      obscureText: isPasswordTextField ? true : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton(
                onPressed: () {
                  showPassword = !showPassword;
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.red[200],
                ),
              )
            : null, // * This makes the icon appear only for the password field
        contentPadding: const EdgeInsets.only(left: 15),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        labelStyle: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: .25,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black54, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}
