import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
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
        return SafeArea(child: Scaffold(
          appBar: AppBar(
            title: Text("Tentang Anak"),
          ),
          body: Container(
            child: Text('${vm.name}'),
          ),
        ));
      }, viewModelBuilder: () => HomeViewModel(repository: widget.repository),
      onModelReady: (HomeViewModel homeViewModel) async {
        await homeViewModel.getListFruits();
      },);
  }

  Widget buildList() {
    return Container();
  }
}
