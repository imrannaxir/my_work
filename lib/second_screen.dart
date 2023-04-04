import 'package:flutter/material.dart';
import 'package:my_work/route_names.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'my_clipper.dart';

class SecondScreen extends StatefulWidget {
  dynamic data;
  SecondScreen({required this.data, Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isValid = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.black,
                height: size.height * 0.3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromTop(
                        duration: const Duration(
                          seconds: 2,
                        ),
                      ),
                      atRestEffect: WidgetRestingEffects.bounce(
                        duration: const Duration(
                          seconds: 10,
                        ),
                      ),
                      child: Container(
                        height: size.height * 0.18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/jagu.jpg',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.65,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        child: TextFormField(
                          controller: mailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: widget.data['name'],
                            hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            // labelText: 'Email',
                            // labelStyle: TextStyle(
                            //   color: Colors.black,
                            //   fontSize: 16,
                            //   fontStyle: FontStyle.italic,
                            // ),
                            //  icon: Icon(Icons.email),
                            prefixIcon: const Icon(Icons.mail),
                            enabledBorder: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Give Your Password';
                            } else if (value.length < 6) {
                              return 'Should Be At Least 6 Characters';
                            } else if (value.length > 15) {
                              return 'Should Not Be More Than 15 Characters';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: widget.data['rollNo'].toString(),
                            hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            // labelText: 'Password',
                            // labelStyle: TextStyle(),
                            //  icon: Icon(Icons.password),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: const Icon(Icons.remove_red_eye),
                            enabledBorder: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 180,
                      ),
                      child: WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromRight(
                          duration: const Duration(
                            seconds: 3,
                          ),
                        ),
                        atRestEffect: WidgetRestingEffects.dangle(
                          duration: const Duration(
                            seconds: 2,
                          ),
                        ),
                        child: const Text(
                          'FORGOT PASSWORD ?',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: size.height * 0.085,
                        width: size.width * 0.8,
                        child: WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromLeft(
                            duration: const Duration(
                              seconds: 3,
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteNames.thirdScreen,
                                  arguments: {
                                    'mail': 'imrannazeer2015804@gmail.com',
                                    'password': '123456789',
                                  });
                              // if (mailController.text.isEmpty &&
                              //     passwordController.text.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         '',
                              //       ),
                              //     ),
                              //   );
                              //   return;
                              // }
                              // isValid = formKey.currentState!.validate();
                              // if (!isValid) {
                              //   return;
                              // } else {
                              //   print("E_Mail: ${mailController.text}");
                              //   print("Password: ${passwordController.text}");
                              //   mailController.clear();
                              //   passwordController.clear();
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //         'Data Has Been Entered Successfully',
                              //       ),
                              //     ),
                              //   );
                              //   print(
                              //     'Well Done \n Keep it up !!!',
                              //   );
                              // }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                            child: WidgetAnimator(
                              atRestEffect: WidgetRestingEffects.dangle(
                                duration: const Duration(
                                  seconds: 5,
                                ),
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.black,
                            width: 100,
                            height: 1,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          WidgetAnimator(
                            incomingEffect:
                                WidgetTransitionEffects.incomingSlideInFromTop(
                              duration: const Duration(
                                seconds: 3,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.dangle(
                              duration: const Duration(
                                seconds: 2,
                              ),
                            ),
                            child: const Text(
                              'Social Login',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.black,
                            width: 100,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: WidgetAnimator(
                        // incomingEffect:
                        //     WidgetTransitionEffects.incomingSlideInFromLeft(
                        //   duration: const Duration(
                        //     seconds: 3,
                        //   ),
                        // ),
                        atRestEffect: WidgetRestingEffects.swing(
                          duration: const Duration(
                            seconds: 5,
                          ),
                        ),
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width * 0.4,
                          decoration: const BoxDecoration(
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/google.png',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WidgetAnimator(
                            incomingEffect:
                                WidgetTransitionEffects.incomingSlideInFromLeft(
                              duration: const Duration(
                                seconds: 3,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.dangle(
                              duration: const Duration(
                                seconds: 2,
                              ),
                            ),
                            child: const Text(
                              'New User ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromRight(
                              duration: const Duration(
                                seconds: 3,
                              ),
                            ),
                            atRestEffect: WidgetRestingEffects.dangle(
                              duration: const Duration(
                                seconds: 2,
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
