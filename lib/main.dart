import 'package:flutter/material.dart';
import 'package:fry/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> tabItems = [const PageFood(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: tabItems[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank_outlined,
            ),
            label: '요리',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_rounded,
              ),
              label: '재료사전'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: 'MY'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class PageFood extends StatelessWidget {
  const PageFood({
    super.key,
  });

  static List<Map<String, String>> items = [
    {"subtitle": "준비물과 기초 칼질부터 시작하는", "title": "설레는 요리의 시작"},
    {"subtitle": "한국인의 소울푸드 10가지", "title": "초보자도 쉽게 할 수 있는"},
    {"subtitle": "있어 보이는 정식 요리 5가지", "title": "집들이도 걱정없는"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text(
          "요리",
          style: kTitleTextStyle,
        ),
        Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "재료로 레시피 찾기",
                style: kSubtitleTextStyle,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '단계별로 요리 배우기',
                  style: kSubtitleTextStyle,
                ),
                const SizedBox(height: 10.0),
                ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          items[index]["title"]!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey.shade600),
                        ),
                      ),
                      subtitle: Text(
                        items[index]["subtitle"]!,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
