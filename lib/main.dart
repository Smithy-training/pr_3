import 'package:flutter/material.dart';

void main() => runApp(GameStoreApp());

class GameStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: GameListScreen(),
    );
  }
}

class GameListScreen extends StatelessWidget {
  final List<Game> games = [
    Game('Cuphead', 'компьютерная игра в жанре run and gun и платформера, разработанная и изданная канадской командой разработчиков StudioMDHR Entertainment. Анонс игры состоялся в 2013 году, а выход для персональных компьютеров и Xbox One состоялся 29 сентября 2017 года.', 'assets/images/img.png'),
    Game('Elden Ring', 'компьютерная игра в жанре action/RPG с открытым миром, разработанная японской компанией FromSoftware и изданная компанией Bandai Namco Entertainment для платформ Windows, PlayStation 4, PlayStation 5, Xbox One и Xbox Series X/S.', 'assets/images/img_1.png'),
    Game('Rust', 'компьютерная игра в жанре симулятора выживания, разработанная независимой британской компанией Facepunch Studios, возглавляемой c 2014 года Гарри Ньюмэном. Игра была выпущена в раннем доступе в декабре 2013 года, 8 февраля 2018 года состоялся её полноценный релиз для Windows и macOS.', 'assets/images/img_2.png'),
    Game('Doom Eternal', 'компьютерная игра в жанре шутера от первого лица. Игра разработана студией id Software, а издателем выступила компания Bethesda Softworks. Анонс проекта состоялся в 2018 году на выставке E3.', 'assets/images/img_3.png'),
    Game('Kingdom Come: Deliverance', 'компьютерная игра в жанре action/RPG от первого лица с открытым миром, разработанная чешской студией Warhorse Studios и выпущенная компанией Deep Silver для платформ PlayStation 4, Xbox One и Microsoft Windows в 2018 году.', 'assets/images/img_4.png'),
    Game('Grand Theft Auto V', 'компьютерная игра в жанре action-adventure с открытым миром, разработанная компанией Rockstar North и изданная компанией Rockstar Games.', 'assets/images/img_5.png'),
    Game('Farming Simulator 22', 'компьютерная игра в жанре симулятора фермера, разработанная студией Giants Software и выпущенная 22 ноября 2021 года. В игре присутствует больше 100 брендов и более 400 единиц сельскохозяйственной техники и инструментов, среди них — John Deere, New Holland, Deutz-Fahr, MAN и другие.', 'assets/images/img_6.png'),
    Game('Hogwarts Legacy', 'компьютерная игра в жанре action/RPG, разработанная американской студией Avalanche Software и изданная Warner Bros. Games под лейблом Portkey Games. Действие игры разворачивается в фэнтезийной вселенной «Гарри Поттера» в XIX веке.', 'assets/images/img_7.png'),
    Game('Diablo II', 'компьютерная игра в жанре Action/RPG, разработанная американской компанией Blizzard North и выпущенная Blizzard Entertainment для Windows и Mac OS в 2000 году. Это вторая часть серии Diablo, продолжающая события игры Diablo.', 'assets/images/img_8.png'),
    Game('Far Cry 4', 'компьютерная игра в жанре шутера от первого лица, разработанная студией Ubisoft Montreal, при участии Ubisoft Red Storm, Ubisoft Toronto, Ubisoft Shanghai, Ubisoft Kyiv и изданная Ubisoft.', 'assets/images/img_9.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent, // Прозрачный фон для градиента
        elevation: 0,
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: <Color>[Colors.deepPurple, Colors.blue, Colors.white54],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: Text(
            'Maste',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return GestureDetector(
            onTap: () {
              // Описание
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetailScreen(game: game),
                ),
              );
            },
            child: Card(
              color: Colors.blueGrey[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      game.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      game.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Модель для описания
class Game {
  final String name;
  final String description;
  final String imageUrl;

  Game(this.name, this.description, this.imageUrl);
}

// Страница с описанием
class GameDetailScreen extends StatelessWidget {
  final Game game;

  GameDetailScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(game.imageUrl),
            SizedBox(height: 16),
            Text(
              game.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              game.description,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
