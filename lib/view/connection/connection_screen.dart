// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:founder_app/common/constants/constants.dart';
import 'package:founder_app/common/widgets/widgetswelcome.dart';
import 'package:founder_app/controller/provider/connection-provider/connection_provider.dart';
import 'package:founder_app/view/home/homescreen/homescreen.dart';
import 'package:founder_app/view/profile-matching_profile/profile_matching.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class ConnectionScreen extends StatelessWidget {
   ConnectionScreen({super.key});
  String? userId;
  @override
  Widget build(BuildContext context) {
    getId();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: appBarLogo(context, 0.3),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text("Home", style: textStyle)),
          wBox
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [textNormalHeading("Connections")],
              ),
              hBox,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
                child: Consumer<ConnectionProvider>(
                  builder: (context, value, child) {
                    if (value.alltheConnection == null ||
                        value.alltheConnection!.isEmpty) {
                      return const Center(
                        child: Text(
                          "You dont have any connections",
                          style: textStyle,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.alltheConnection!.length,
                        itemBuilder: (context, index) {
                          final data = value.alltheConnection![index];
                          return Card(
                            color: backgroundColorConst,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor:
                                       Colors.transparent,
                                    backgroundImage: data.profilePhoto == null
                                        ? Image.asset(
                                                'assets/images/event-image.png')
                                            .image
                                        : Image.network(data.profilePhoto!)
                                            .image),
                              ),
                              title: Text(
                                data.userName ?? 'username',
                                style: textStyle,
                              ),
                              subtitle: Text(
                                data.location == null
                                    ? 'country'
                                    : 'Country:${data.location!.country}',
                                style: textStyle,
                              ),
                              trailing: const Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Text(
                                  "view profile",
                                  style: textStyle,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfileMatched(
                                          profileId: data.id!,
                                          userName: data.userName!,
                                          location: "${data.location!.country!}, ${data.location!.state!}",
                                          email: data.email!,
                                          about: data.intro!,
                                          accomplishment: data.accomplishments!,
                                          education: data.education!,
                                          technical: data.isTechnical == 1
                                              ? 'yes'
                                              : 'no',
                                          idea: data.haveIdea == 'definiteIdea'
                                              ? 'Yes'
                                              : data.haveIdea ==
                                                      'readyToExplore'
                                                  ? 'No'
                                                  : 'don\'t have any idea',
                                          interests: data.interests!,
                                          responsibilities:
                                              data.responsibilities!,
                                          profileImage: data.profilePhoto?? 'null',
                                          userId: userId,
                                        )));
                                value.buttonFuction(data.id!);
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   void getId() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();

    String? checkLogin = await storage.read(key: "token");
    Map<String, dynamic> decodedtoken =
        JwtDecoder.decode(checkLogin.toString());
    final idUser = decodedtoken["userId"];
    userId = idUser;
  }
}
