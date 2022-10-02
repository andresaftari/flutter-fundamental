import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanbloc/data/controller/covid_bloc.dart';
import 'package:latihanbloc/data/covid.dart';

class HomePageViews extends StatefulWidget {
  const HomePageViews({Key? key}) : super(key: key);

  @override
  State<HomePageViews> createState() => _HomePageViewsState();
}

class _HomePageViewsState extends State<HomePageViews> {
  final CovidBloc _covidBloc = CovidBloc();

  @override
  void initState() {
    _covidBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('BlocApp'),
        ),
      ),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _covidBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return _buildLoading();
              } else if (state is CovidLoading) {
                return _buildLoading();
              } else if (state is CovidLoaded) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Covid model) {
    return ListView.builder(
      itemCount: model.countries!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('Country: ${model.countries![index].country}'),
                  Text(
                      'Total Confirmed: ${model.countries![index].totalConfirmed}'),
                  Text('Total Deaths: ${model.countries![index].totalDeaths}'),
                  Text(
                      'Total Recovered: ${model.countries![index].totalRecovered}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
