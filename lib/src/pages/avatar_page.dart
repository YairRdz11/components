import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar page'),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(2.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/318/144/png-transparent-iron-man-avatar-iron-man-cartoon-avatar-superhero-icon-superhero-phone-icon-comics-face-camera-icon.png'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text('YR'),
            ),
          )
        ],       
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.bing.com/images/search?view=detailV2&ccid=jNSlaCru&id=EA835035A28353153DA483E45CBDA2AE45BFDA14&thid=OIP.jNSlaCruc_xCqZKOTfgXKgAAAA&mediaurl=https%3a%2f%2fi.pinimg.com%2foriginals%2f04%2f10%2f42%2f041042547f8a9681e20f9d3c6c991b0b.png&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.8cd4a5682aee73fc42a9928e4df8172a%3frik%3dFNq%252fRa6ivVzkgw%26pid%3dImgRaw%26r%3d0&exph=832&expw=469&q=iron+man+vertical&simid=608047587314200965&FORM=IRPRST&ck=FF8087C0AD6A1730DA0C9FDD56EBD862&selectedIndex=4&ajaxhist=0&ajaxserp=0'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        )
        ),
    );
  }
}