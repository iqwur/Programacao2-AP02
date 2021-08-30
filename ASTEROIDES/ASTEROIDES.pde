//Georgia Rebeka da Silva - 398289
//Programação 2
//Trabalho AP01

Nave n;
Fim fim;

ArrayList <Tiro> tiros = new ArrayList<Tiro>();
ArrayList <Asteroides> ast = new ArrayList<Asteroides>();

int score;

void setup() {
  fullScreen();
  
  score = 0;
  fim = null;
  
  n = new Nave();
  
  for (int i = 0; i < 15; i++){
    ast.add(new Asteroides());
  }
 
}

void draw() {
 
  if(fim != null){
    fim.desenhaFim();

  }else{
    
    background(0);
    textSize(26);
    fill(255);
    text("Score: "+ score, width/2 - 30, 50);
    noFill();
    
  for(int i = 0; i < ast.size(); i++){
    Asteroides asteroides = ast.get(i);
    asteroides.desenha();
    asteroides.move();
    asteroides.vel();
    
    if(n.acerta(asteroides)){   
      fim = new Fim(score);
      println("gameover");
    }
  }

  
    for(int i = 0; i < tiros.size(); i++){
      Tiro tiro = tiros.get(i);
      tiro.desenha();
      tiro.move();
      if(tiro.fora() == true){  
        tiros.remove(i);
        }else{
          for(int j = 0; j < ast.size(); j++){
            Asteroides asteroides = ast.get(j);
            if(tiro.acerta(asteroides)){
              score += 25; 
              if(asteroides.r > 20){  
                score += 10;
                ArrayList<Asteroides> newA = asteroides.breakup();
                ast.addAll(newA);
              }
                ast.remove(j);
                tiros.remove(i);
                break;
              }
            
            }
          }
        }
    
    n.desenha();
    n.move();
  }
}


void keyPressed() {
  if(key == ' '){
    tiros.add(new Tiro(n.pos,n.a)); 
  }else if(keyCode == LEFT){
      n.rotaciona(-0.1);
    }else if(keyCode == RIGHT){
      n.rotaciona(0.1);
    }else if(keyCode == UP){
      n.velX += cos(n.a) * n.thrust;
      n.velY += sin(n.a) * n.thrust;
    }else if(keyCode == DOWN){
      n.velX -= cos(n.a) * n.thrust;
      n.velY -= sin(n.a) * n.thrust;
    }
}
void mousePressed() {
  if (fim != null && fim.mouseOverButton() == true) {
    restart();
  }
}
void restart() {
  tiros.clear();
  n = new Nave();
  ast.add(new Asteroides(new PVector(random(width/2), random(height)), random(15,70)));
  fim = null;
  score = 0;
}
