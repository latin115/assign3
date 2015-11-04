//You should implement your assign3 here.
final int enemy_straight = 0;
final int enemy_slash = 1;
final int enemy_diamond=2;

PImage bg1,bg2,enemy;
int bg1_x,bg2_x;
int enemy_x;
int speed;
int enemy_state;
float j;

void setup () {
  size(640, 480) ;
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  bg1_x = 0;
  bg2_x = 640;
  enemy_x = 0;
  speed = 3;
  enemy_state = enemy_straight;
}

void draw() {
  //bg
  image(bg1,bg1_x,0);
  bg1_x -= 1;
  if(bg1_x == -640)
    bg1_x = 640;
  image(bg2,bg2_x,0);
  bg2_x -= 1;
  if(bg2_x == -640)
    bg2_x = 640;
  //enemy
  if(enemy_state == enemy_straight){
    for(int i=0;i<5;i++){
      image(enemy,enemy_x-(i*59),j);
    }
    if(enemy_x < width+295)
      enemy_x += speed;
    else{
      enemy_state = enemy_slash;
      enemy_x=0;
      j = random(0,height-310);
    }
  }
  if(enemy_state == enemy_slash){
    for(int i=0;i<5;i++){
      image(enemy,enemy_x-(i*59),i*62+j);
    }
    if(enemy_x < width+295)
      enemy_x += speed;
    else{
      enemy_state = enemy_diamond;
      enemy_x=0;
      j = random(0,height-310);
    }
  }
  if(enemy_state == enemy_diamond){
    for(int i=0;i<3;i++){
      image(enemy,enemy_x-(i*30),122+(i*61)+j);
      image(enemy,enemy_x-(i*30),122-(i*61)+j);
    }
    image(enemy,enemy_x-(3*30),122+61+j);
    image(enemy,enemy_x-(3*30),122-61+j);
    image(enemy,enemy_x-(4*30),122+j);
    if(enemy_x < width+122)
      enemy_x += speed;
    else{
      enemy_state = enemy_straight;
      enemy_x=0;
      j = random(0,height-61);
    }
  }

}
