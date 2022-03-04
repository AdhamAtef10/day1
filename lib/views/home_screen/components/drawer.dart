import 'package:day1/core/utlis/naviagtion.dart';
import 'package:day1/core/utlis/size_config.dart';
import 'package:day1/services/shared-prefrence/cache_helper.dart';
import 'package:day1/src/app_colors.dart';
import 'package:day1/views/about_us/aboutus.dart';
import 'package:day1/views/cart/cart.dart';
import 'package:day1/views/categories/categories.dart';
import 'package:day1/views/content_us/contentus.dart';
import 'package:day1/views/login/login_screen.dart';
import 'package:day1/views/my_orders/myorders.dart';
import 'package:day1/views/wish_list/wishlist.dart';
import 'package:flutter/material.dart';

class Drawerr extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:
        <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                ),
                SizedBox(
                  width:25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Adham Atef',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),),
                    ),
                    Row(
                      children: [
                        Text('Edit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                        SizedBox(
                          width:25 ,
                        ),
                        Icon(Icons.edit,
                        color: Colors.white,
                        size: 20,),
                      ],
                    )
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: AppColors.KPrimaryColor,
            ),
          ),
          ListTile(
            title: Text('Cart'),
            leading: Icon(Icons.shopping_cart),
            onTap: ()
            {
               AppNavigator.customNavigator(context: context, screen:Cart() , finish: false);
            },
          ),
          ListTile(
            title: Text('Wish List'),
            leading: Icon(Icons.favorite_border),
            onTap: ()
            {
              AppNavigator.customNavigator(context: context, screen: WishList(), finish: false);
            },
          ),
          ListTile(
            title: Text('My Orders'),
            leading: Icon(Icons.apartment_sharp),
            onTap: ()
            {
              AppNavigator.customNavigator(context: context, screen: MyOrders(), finish: false);
            },
          ),
          ListTile(
            title: Text('Content Us'),
            leading: Icon(Icons.phone),
            onTap: ()
            {
              AppNavigator.customNavigator(context: context, screen: ContentUs(), finish: false);
            },
          ),
          ListTile(
            title: Text('About Us'),
            leading: Icon(Icons.announcement_outlined),
            onTap: ()
            {
              AppNavigator.customNavigator(context: context, screen: AboutUs(), finish: false);
            },
          ),
          ListTile(
            title: Text('Categories'),
            leading: Icon(Icons.widgets_outlined),
            onTap: ()
            {
               AppNavigator.customNavigator(context: context, screen: CategoriesScreen(), finish: false);
            },
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.arrow_forward_ios_outlined),
            onTap: ()
            {
             SharedPreferencesHelper.removeData(key: 'token');
              AppNavigator.customNavigator(context: context, screen: LoginView(), finish: false);
            },
          ),
        ],
      ),
    );
  }
}
