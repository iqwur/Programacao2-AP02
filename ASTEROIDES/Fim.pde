//Georgia Rebeka da Silva - 398289
//Programação 2
//Trabalho AP01

class Fim{
  String gameOverText, buttonText, scoreText;
  int buttonX, buttonY, buttonW, buttonH;
  
  Fim(int score){
    this.gameOverText = "Game Over!";
    this.buttonText = "Tente Novamente";
    this.scoreText = "Sua pontuação final foi: " + score;
    this.buttonW = 550;
    this.buttonH = 100;
    this.buttonX = width/2 - this.buttonW/2;
    this.buttonY = height/2 - this.buttonH/2;
  }
  void desenhaFim(){
    //OVERLAY
    fill(0);
    rect(0, 0, width, height);
    rect(buttonX, buttonY, buttonW, buttonH);
    
    //TEXT
    stroke(255);
    fill(255);
    textSize(60);
    text(this.gameOverText, width/3, height/4);
    
    //BUTTON
    fill(0);
    stroke(200);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(200);
    text(buttonText, buttonX+25, buttonY+70);
    
    //SCORE
    stroke(255);
    fill(255);
    textSize(30);
    text(scoreText, width/3, height - height/4);
  }
    boolean mouseOverButton() {
    return (mouseX > buttonX && mouseX < buttonX + buttonW && mouseY > buttonY && mouseY < buttonY + buttonH);
  }
}
