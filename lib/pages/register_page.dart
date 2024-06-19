import 'package:flutter/material.dart';
import 'package:optiguard/components/box_logo.dart';
import 'package:optiguard/components/logo.dart';
import 'package:optiguard/components/sponsor.dart';
import 'package:optiguard/components/text_input.dart';
import 'package:optiguard/pages/login_page.dart';
import 'package:optiguard/pages/register_cont_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                // Top part (Sponsor and Logo)
                const Column(
                  children: [
                    SizedBox(height: 25),
                    // sponsor
                    SponsorWidget(),

                    SizedBox(height: 15),

                    // logo
                    LogoWidget(),

                    SizedBox(height: 10),
                  ],
                ),

                // Scrollable Container
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // text
                        const Text(
                          'Daftarkan diri Anda',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),

                        const SizedBox(height: 15),

                        // form
                        TextInput(
                          controller: nameController,
                          labelText: 'Nama',
                          hintText: 'Masukan nama Anda',
                          obscureText: false,
                        ),

                        const SizedBox(height: 15),

                        // form
                        TextInput(
                          controller: emailController,
                          labelText: 'Email',
                          hintText: 'Masukan email Anda',
                          obscureText: false,
                        ),

                        const SizedBox(height: 15),

                        TextInput(
                          controller: passwordController,
                          labelText: 'Kata sandi',
                          hintText: 'Masukan kata sandi Anda',
                          obscureText: true,
                        ),

                        const SizedBox(height: 15),

                        TextInput(
                          controller: confirmPasswordController,
                          labelText: 'Ulangi kata sandi',
                          hintText: 'Masukan kembali kata sandi Anda',
                          obscureText: true,
                        ),

                        const SizedBox(height: 15),

                        // // button
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterContPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // other methods
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'atau masuk dengan',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // other methods(googles)
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BoxLogo(imagePath: 'assets/logo/google-logo.webp'),
                            SizedBox(width: 10),
                            BoxLogo(imagePath: 'assets/logo/apple-logo.png')
                          ],
                        ),

                        const SizedBox(height: 15),

                        // register
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Belum punya akun?',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Masuk',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
