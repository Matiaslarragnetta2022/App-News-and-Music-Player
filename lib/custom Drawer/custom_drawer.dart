import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
   // final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
     
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 80,
            
            child: Container(
              margin: const EdgeInsets.only(right: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.white,
          ),
          ListTile(
            title: const Text(
              'Qr',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/qr-screen',
              );
            },
          ),
          ListTile(
            title: const Text(
              'Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.monetization_on,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/card',
              );
            },
          ),
          ListTile(
            title: const Text(
              'Listview',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.analytics_outlined,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/listview',
              );
            },
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '',
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
        
           
             
         
        ],
      ),
    );
  }
}

//     return ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       separatorBuilder: (context, i) => Divider(
//         color: appTheme.primaryColorLight,
//       ),
//       itemCount: pageRoutes.length,
//       itemBuilder: (context, i) => ListTile(
//         leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
//         title: Text(pageRoutes[i].titulo),
//         trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => pageRoutes[i].page));
//         },
//       ),
//     );
//   }
// }
