import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/data/response/status.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/viewmodel/movie_list_viewmodel.dart';
import 'package:mvvm_architecture_flutter/viewmodel/session_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MoviesListViewModel moviesListViewModel = MoviesListViewModel();

  @override
  void initState() {
    super.initState();
    moviesListViewModel.movieListViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final sessionData = Provider.of<SessionViewModel>(context);
    final moviesListViewModel = Provider.of<MoviesListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                sessionData.logout().then((value) {
                  Navigator.pushNamed(context, RouteName.login);
                });
              },
              child: const Center(child: Text('Logout'))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<MoviesListViewModel>(
        create: (BuildContext context) => moviesListViewModel,
        child: Consumer<MoviesListViewModel>(builder: (context, value, _) {
          switch (value.movieList.status) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.movieList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: value.movieList.data!.search!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.movieList.data!.search![index].poster
                              .toString(),
                          errorBuilder: (context, error, stack) {
                            return Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(value.movieList.data!.search![index].title
                            .toString()),
                      ),
                    );
                  });
          }
          return Container();
        }),
      ),
    );
  }
}
