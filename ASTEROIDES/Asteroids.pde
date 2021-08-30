//Georgia Rebeka da Silva - 398289
//Programação 2
//Trabalho AP01

class Asteroides{
  float r;
  PVector pos;
  PVector vel = PVector.random2D();
  int total = floor(random(5, 10));
  float[] offset;
  
  Asteroides(){
    this(new PVector(random(width), random(height)), random(30,80));
  }
  
  Asteroides(PVector pos_, float r){
    pos = pos_.copy();
    this.r = r * 0.5;
    offset = new float[total];
    for(int i = 0; i < total; i++){
      offset[i] = random(-r * 0.5, r * 0.5);
    }
      
  }  
  
  void desenha(){
    push();
    stroke(220,220,220);
    noFill();
    translate(pos.x, pos.y);
    //ellipse(0, 0, this.r,this.r);
    beginShape();
    for(int i = 0; i < this.total; i++){
      float angulo = map(i, 0, this.total, 0, TWO_PI);
      float r1 = r + offset[i];
      float x = r1 * cos(angulo);
      float y = r1 * sin(angulo);
      vertex(x,y);
    }
    endShape(CLOSE);  
    pop();
  }

  void vel(){
    this.pos.add(vel);
    
  }
   void move(){
     if(this.pos.x > width + this.r)//se o asteroide estiver pra fora do canto direito da tela
     this.pos.x = -this.r; //voltara para o lado esquerdo da tela
     else if(this.pos.x < -this.r) //se o asteroide estiver pra fora do canto esquerdo da tela
     this.pos.x = width + this.r;//voltara para o lado direito da tela
     if(this.pos.y > height + this.r)//se o asteroide estiver pra fora do canto inferior da tela
     this.pos.y = -this.r;//voltara para o lado superior da tela
     else if(this.pos.y < -this.r)//se o asteroide estiv trianguloer pra fora do superior inferior da tela
     this.pos.y = height + this.r;//voltara para o lado inferior da tela
   }
   ArrayList<Asteroides> breakup(){
     ArrayList<Asteroides> newA = new ArrayList<Asteroides>();
     newA.add(new Asteroides(pos, this.r));
     newA.add(new Asteroides(pos, this.r));
     return newA;
   }

}

 
