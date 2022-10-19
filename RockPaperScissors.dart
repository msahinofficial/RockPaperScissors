import 'dart:io';
import 'dart:math';
enum element {Rock,Paper,Scissors}
int count = 0;
var Rock = element.Rock;
var Paper = element.Paper;
var Scissors = element.Scissors;
int PlayerScore = 0;
int AIScore = 0;
void main() {
  print("Welome to Game!!");
  print("Press To E for Play the game");
  Start();
  Update();
}

void Start(){
  var button;
  while(true){
    button = stdin.readLineSync();
    if(button == "E"){
      break;
    }
  }
}

void Update(){
  bool restart = true;
  if(Difficulty() == 1){
    while(restart){
      while(count < 5){
        NormalAI();
        ChoiceNormal();
     }
    Result();
    restart = Restart();
    }
    
  }
  else if(Difficulty() == 2){
    while(restart){
      while(count < 4){
      ChoiceImpossible();
    }
    Result();
    restart = Restart();
    }
  }
}

int Difficulty(){
  var choice;
  int returnNum = 0;
  print("choose the difficulty");
  print("Normal or Impossible");
  choice = stdin.readLineSync();
  if(choice == "Normal"){
    returnNum = 1;
    print("Your Choice = 'Normal'.");
  }
  else if(choice == "Impossible"){
    returnNum = 2;
    print("Your Choice = 'Impossible'.");
  }
  return returnNum;
}

void ChoiceNormal(){
  count;
  var choice;
  int switchnum =0;
  var secim = NormalAI();
  print("Choice move : ");
  choice = stdin.readLineSync();
  if(choice == "Paper"){
    switchnum = 1;
  }
  else if(choice == "Rock"){
    switchnum =2;
  }
  else if(choice == "Scissors"){
    switchnum =3;
  }
  switch(switchnum){
    case 1 : if(secim=="Rock"){
      print("Enemy Choice : Rock");
      print("You Win!!");
      count++;
      PlayerScore++;
      print("Score : $PlayerScore - $AIScore");
    }
    else if(secim=="Paper"){
      print("Enemy Choice : Paper");
      print("Raw!");
      count++;
      print("Score : $PlayerScore - $AIScore");

    }
    else if(secim=="Scissors"){
      print("Enemy Choice : Scissors");
      print("You Lose :(");
      count++;
      AIScore++;
      print("Score : $PlayerScore - $AIScore");
  } break;
    case 2:if(secim=="Rock"){
      print("Enemy Choice : Rock");
      print("Raw!!");
      count++;
      print("Score : $PlayerScore - $AIScore");

    }
    else if(secim=="Paper"){
      print("Enemy Choice : Paper");
      print("You Lose :(");
      count++;
      AIScore ++;
      print("Score : $PlayerScore - $AIScore");

    }
    else if(secim=="Scissors"){
      print("Enemy Choice : Scissors");
      print("You Win!!");
      count++;
      PlayerScore++;
      print("Score : $PlayerScore - $AIScore");

    } break;
    case 3:if(secim=="Rock"){
      print("Enemy Choice : Rock");
      print("You Lose :(");
      count++;
      AIScore++;
      print("Score : $PlayerScore - $AIScore");

    }
    else if(secim=="Paper"){
      print("Enemy Choice : Paper");
      print("You Win!!");
      count++;
      PlayerScore++;
      print("Score : $PlayerScore - $AIScore");

    }
    else if(secim=="Scissors"){
      print("Enemy Choice : Scissors");
      print("Raw!");
      count++;
      print("Score : $PlayerScore - $AIScore");

    } break;
  }
}

String NormalAI(){
  var randomnumbers = Random().nextInt(3);
  const elementAI = {"Rock","Paper","Scissors"};
  String secim = elementAI.elementAt(randomnumbers);
  return secim;

}

void ChoiceImpossible(){
  count;
  var choice;
  print("Choice move : ");
  choice = stdin.readLineSync();
  if(choice == Paper.name){
    print("Enemy Choice : Scissors");
    print("You Lose :(");
    count++;
    AIScore++;
    print("Score : $PlayerScore - $AIScore");
  }
  if(choice == Rock.name){
    print("Enemy Choice : Paper");
    print("You Lose :(");
    count++;
    AIScore++;
    print("Score : $PlayerScore - $AIScore");
  }
   if(choice == Scissors.name){
    print("Enemy Choice : Rock");
    print("You Lose :(");
    count++;
    AIScore++;
    print("Score : $PlayerScore - $AIScore");
  }
}

void Result(){
  print("What a game!!");
  if(PlayerScore > AIScore){
    print("Congrulations!! You Win!");
  }
  else if(PlayerScore < AIScore){
    print("You Lose :(. Don't worry :). Come and play again!!");
  }
  else if(AIScore == PlayerScore){
    print("Draw!. One more time!. I sure you win!!");
  }
}

bool Restart(){
  var choice;
  bool returnvalue = true;
  print("Play Again : Press R");
  print("Exit : Press Q");
  choice = stdin.readLineSync();
  if(choice == "R"){
    PlayerScore = 0;
    AIScore = 0;
    count = 0;
    returnvalue = true;
  }
  else if(choice == "Q"){
    returnvalue = false;
  }
  return returnvalue;
}