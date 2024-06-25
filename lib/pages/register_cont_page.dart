import 'package:flutter/material.dart';
import 'package:optiguard/components/box_logo.dart';
import 'package:optiguard/components/date_picker.dart';
import 'package:optiguard/components/logo.dart';
import 'package:optiguard/components/radio_gender.dart';
import 'package:optiguard/components/sponsor.dart';
import 'package:optiguard/components/text_input.dart';
import 'package:optiguard/pages/login_page.dart';
import 'package:optiguard/pages/role_selection.dart';

class RegisterContPage extends StatelessWidget {
  RegisterContPage({super.key});

  final birthController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> genderOptions = ['laki-laki', 'perempuan'];

    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 25),
                // sponsor
                const SponsorWidget(),

                const SizedBox(height: 15),

                // logo
                const LogoWidget(),

                const SizedBox(height: 10),

                // Remaining height container
                Container(
                  width: MediaQuery.of(context).size.width,
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
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // text
                      const Center(
                        // Center the text
                        child: Text(
                          'Isi Data Diri Anda',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // form
                      DatePicker(
                        controller: birthController,
                        labeltext: 'Tanggal Lahir',
                        hintText: 'Masukan tanggal lahir',
                        obscureText: false,
                      ),

                      const SizedBox(height: 15),

                      // form
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Jenis Kelamin',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            )),
                      ),
                      RadioGender(genderOptions: genderOptions),

                      const SizedBox(height: 15),

                      TextInput(
                        controller: cityController,
                        labelText: 'Kota/Kabupaten',
                        hintText: 'Masukan kota/kabupaten',
                        obscureText: false,
                      ),

                      const SizedBox(height: 15),

                      TextInput(
                        controller: addressController,
                        labelText: 'Alamat',
                        hintText: 'Masukan alamat',
                        obscureText: false,
                      ),

                      const SizedBox(height: 15),

                      // button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 35,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // Disable elevation
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RoleSelection(),
                                ),
                              );
                            },
                            child: const Text(
                              'Daftar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
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
                            'Sudah punya akun?',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
