import 'dart:convert';
import 'dart:io';
import 'package:anthorflix/movies_widget.dart';
import 'package:anthorflix/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

void main() => runApp(const AnthorflixApp());

class AnthorflixApp extends StatefulWidget {
  const AnthorflixApp({Key? key}) : super(key: key);

  @override
  _MainWindow createState() => _MainWindow();
}

class _MainWindow extends State<AnthorflixApp> {
  Movie _movie = Movie(imdbId: "id", title: "Título",
      poster: "https://www.uninassau.edu.br/sites/mauriciodenassau.edu.br/files/fields/imagemLateral/noticias/2018/04/700_fo38843930_9e45ae83c58d8b25cef06bb9ea6a7a05.jpg",
      year: "Ano", director: "Diretores", actors: "Elenco", genre: "Gênero", released: "Lançamento",
      plot: "descrição");
  String _movie_name = " ";
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text( 'Anthorflix' );
  final TextEditingController _textController = TextEditingController();
  late File _jsonFile;
  Directory _directory = Directory(" ");
  final String _file_name = "movie_DB.json";
  bool _fileExists = false;
  late Map<String, dynamic> _fileContent;

  void saveData(){
    //to do
  }
  void createFile(Map<String, dynamic> content, Directory dir, String fileName){
    File file = File(_directory.path + "/" + _file_name);
    file.createSync();
    _fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, dynamic value){
    Map<String, dynamic> content = {key: value};
    if (_fileExists) {
      Map<String, dynamic> jsonFileContent = json.decode(_jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      _jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      createFile(content, _directory, _file_name);
    }
    setState(() => _fileContent = json.decode(_jsonFile.readAsStringSync()));
  }

  @override
  void initState(){
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory){
      _directory = directory;
      _jsonFile = File(_directory.path + "/" + _file_name);
      _fileExists = _jsonFile.existsSync();
      if(_fileExists){
        setState(() => _fileContent = json.decode(_jsonFile.readAsStringSync()));
      }
    });
  }

  void _populateMovieContent() async {
    Movie movie = await _fetchOMDbMovie();
    setState(() {
      _movie = movie;
    });
  }

  Future<Movie> _fetchOMDbMovie() async {
    final response =  await http.get(
        Uri.parse("http://www.omdbapi.com/?t=$_movie_name&plot=full&apikey=3d041907"));
    if (response.statusCode == 200){
      final result = jsonDecode(response.body);
      return  Movie.fromJson(result);
    }
    else {
      throw Exception("Loading movies has failed");
    }
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _textController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Digite nome do filme...',
          ),
          onSubmitted: (String str){
            _movie_name = str;
            _populateMovieContent();
          }
        );
      } else {
        _searchIcon = Icon(Icons.search);
        _appBarTitle = Text('Anthorflix');
        _textController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anthorflix',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: (){
                _searchPressed();
              },
              icon: _searchIcon,
            ),
          ],
          leading: Image.asset('assets/images/anthor.png'),
          title: _appBarTitle,
        ),
        body: MoviesWidget(movie: _movie),
        floatingActionButton:Stack(
          children: <Widget>[
            Align (
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
              tooltip: 'Salvar avaliação',
              onPressed: () => saveData(),
              child: const Icon(
                Icons.save,
                color: Colors.green,
                size: 40,
              ),
              backgroundColor: Colors.black,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
