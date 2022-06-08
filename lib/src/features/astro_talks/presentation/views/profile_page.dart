import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/common_utils.dart';
import '../widgets/my_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  initState(){
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
              padding: const EdgeInsets.all(8),
              height: 36,
              child: OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(color: AppColors.appOrangeColor),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ))),
                  onPressed: () {
                  },
                  child: Text(
                    "Logout",
                    style: textTheme.headline2,
                  )))
        ],
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.appOrangeColor,
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            width: 50,
            child: CommonUtils.getAssetImage("icon"),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              indicatorColor: AppColors.appOrangeColor,
              labelStyle: textTheme.headline4?.copyWith(fontSize: 14),
              unselectedLabelColor: Colors.black,
              labelColor: AppColors.appOrangeColor,
              tabs: const [
                Tab(
                  text: "My Profile",
                ),
                Tab(
                  text: 'Order History',
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: const [MyProfile(), SizedBox()],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
