import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tentang_anak/detail_fruit.dart';
import 'package:tentang_anak/home_viewmodel.dart';
import 'package:tentang_anak/model/fruit_response.dart';
import 'package:tentang_anak/repository/repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Repository repo = Provider.of(context, listen: false);
    return HomeView(repository: repo);
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (ctx, vm, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Tentang Anak"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 16.0, left: 16.0, bottom: 10.0),
                  child: const Text(
                    "Fruits Data",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  child: buildList(vm),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(repository: widget.repository),
      onModelReady: (HomeViewModel homeViewModel) async {
        await homeViewModel.getListFruits();
      },
    );
  }

  Widget buildList(HomeViewModel homeViewModel) {
    var listValue = homeViewModel.list;
    // List<String> litems = ["1","2","Third","4"];
    return Container(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: listValue.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailFruits(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(listValue[index].name ?? ""),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Total Rp. ${listValue[index].price ?? ""}"),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
