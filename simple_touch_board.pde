import processing.serial.*;
import ddf.minim.*;
Minim minim;
AudioPlayer savingpod,earth,casher,taxi,car,plane,bicycle,motorbike,train,bus;

import deadpixel.keystone.*;
import processing.video.*;
Movie savingpod1,house1,shoppingcart1,taxi1,cars1,bycicle1,motorbike1,train1,bus1,plane1,country1;//,country1,cars1,taxi1,bycicle1,plane1;//,motorbike1,bus1,train1;
Keystone ks;
CornerPinSurface surface1,surface2,surface3,surface4,surface5,surface6,surface7,surface8,surface9,surface10,surface11;//,surface4,surface5,surface6,surface7;//,surface8,surface9,surface10;
PGraphics offscreen1,offscreen2,offscreen3,offscreen4,offscreen5,offscreen6,offscreen7,offscreen8,offscreen9,offscreen10,offscreen11;//,offscreen4,offscreen5,offscreen6,offscreen7;//,offscreen8,offscreen9,offscreen10;


final int baudRate = 57600;

Serial inPort;  // the serial port
String inString; // input string from serial port
String[] splitString; // input string array after splitting
int[] status, lastStatus;
boolean[] isOn;

int device_number = 1;

void updateArraySerial(int[] array) {
  if (array == null) {
    return;
  }

  for(int i = 0; i < min(array.length, splitString.length - 1); i++){
    try {
      array[i] = Integer.parseInt(trim(splitString[i + 1]));
    } catch (NumberFormatException e) {
      array[i] = 0;
    }
  }
}

void setup() {
  fullScreen(P3D,SPAN);
  
  ks=new Keystone(this);
  surface1=ks.createCornerPinSurface(1280,720,20);
  surface2=ks.createCornerPinSurface(1280,720,20);
  surface3=ks.createCornerPinSurface(1280,720,20);
  surface4=ks.createCornerPinSurface(1280,720,20);
  surface5=ks.createCornerPinSurface(1280,720,20);
  surface6=ks.createCornerPinSurface(1280,720,20);
  surface7=ks.createCornerPinSurface(1280,720,20);
  surface8=ks.createCornerPinSurface(1280,720,20);
  surface9=ks.createCornerPinSurface(1280,720,20);
  surface10=ks.createCornerPinSurface(1280,720,20);
  surface11=ks.createCornerPinSurface(1280,720,20);
  
  offscreen1=createGraphics(1280,720,P3D);
  offscreen2=createGraphics(1280,720,P3D);
  offscreen3=createGraphics(1280,720,P3D);
  offscreen4=createGraphics(1280,720,P3D);
  offscreen5=createGraphics(1280,720,P3D);
  offscreen6=createGraphics(1280,720,P3D);
  offscreen7=createGraphics(1280,720,P3D);
  offscreen8=createGraphics(1280,720,P3D);
  offscreen9=createGraphics(1280,720,P3D);
  offscreen10=createGraphics(1280,720,P3D);
  offscreen11=createGraphics(1280,720,P3D);
  
  status = new int[12];
  lastStatus = new int[12];
  isOn = new boolean[12];

  println((Object[])Serial.list());
  
  inPort = new Serial(this, Serial.list()[device_number], baudRate); 
  inPort.bufferUntil('\n');
  
  minim=new Minim(this);
  
  savingpod = minim.loadFile("TRACK000.mp3");
  earth= minim.loadFile("TRACK001.mp3");
  casher= minim.loadFile("TRACK002.mp3");
  taxi= minim.loadFile("TRACK003.mp3");
  car= minim.loadFile("TRACK004.mp3");
  plane= minim.loadFile("TRACK005.mp3");
  bicycle= minim.loadFile("TRACK006.mp3");
  motorbike= minim.loadFile("TRACK007.mp3");
  train=minim.loadFile("TRACK008.aiff");
  bus= minim.loadFile("TRACK009.mp3");
  
 
  country1=new Movie(this,"country_1.mp4");
  shoppingcart1=new Movie(this,"shoppingcart.mp4");
  savingpod1=new Movie(this,"saving pod.mp4");
  cars1=new Movie(this,"cars.mp4");
  taxi1=new Movie(this,"taxi.mp4");
  bycicle1=new Movie(this,"bycicle.mp4");
  plane1= new Movie(this,"plane.mp4");
  motorbike1= new Movie(this,"motorbike.mp4");
  bus1=new Movie(this,"bus.mp4");
  train1= new Movie(this,"train.mp4");
  house1=new Movie(this,"House.mp4");
  
  
  
  savingpod1.frameRate(23);
  house1.frameRate(23);
}

void draw() {

offscreen4.beginDraw();
//offscreen4.background(255);
offscreen4.image(taxi1,0,0);
offscreen4.endDraw();

offscreen5.beginDraw();
//offscreen5.background(255);
offscreen5.image(cars1,0,0);
offscreen5.endDraw();

offscreen6.beginDraw();
//offscreen6.background(255);
offscreen6.image(bycicle1,0,0);
offscreen6.endDraw();

offscreen7.beginDraw();
//offscreen7.background(255);
offscreen7.image(motorbike1,0,0);
offscreen7.endDraw();

offscreen8.beginDraw();
//offscreen8.background(255);
offscreen8.image(train1,0,0);
offscreen8.endDraw();

offscreen9.beginDraw();
//offscreen9.background(255);
offscreen9.image(bus1,0,0);
offscreen9.endDraw();

offscreen10.beginDraw();
//offscreen10.background(255);
offscreen10.image(plane1,0,0);
offscreen10.endDraw();

offscreen2.beginDraw();
//offscreen2.background(255);
offscreen2.image(house1,0,0);
offscreen2.endDraw();

offscreen3.beginDraw();
//offscreen3.background(255);
offscreen3.image(shoppingcart1,0,0);
offscreen3.endDraw();

offscreen1.beginDraw();
//offscreen1.background(255);
offscreen1.image(savingpod1,0,0);
offscreen1.endDraw();

offscreen11.beginDraw();
//offscreen1.background(255);
offscreen11.image(country1,0,0);
offscreen11.endDraw();

background(0);

surface1.render(offscreen1);
surface2.render(offscreen2);
surface3.render(offscreen3);
surface4.render(offscreen4);
surface5.render(offscreen5);
surface6.render(offscreen6);
surface7.render(offscreen7);
surface8.render(offscreen8);
surface9.render(offscreen9);
surface10.render(offscreen10);
surface11.render(offscreen11);
}

void serialEvent(Serial p) {
  inString = p.readString();
  splitString = splitTokens(inString, ": ");
  
  if (splitString[0].equals("TOUCH")) {
    updateArraySerial(status);
  }
   
    if(lastStatus[0] == 0 && status[0] == 1){
      if (!isOn[0]) {
          savingpod1.loop();

          car.pause();
          plane.pause();
          motorbike.pause();
          train.pause();
          taxi.pause();
      
          savingpod.rewind();
          savingpod.play();
          println("SAVE YOUR MONEY");
       isOn[0] = true;
      } else {
    savingpod1.pause();
    isOn[0] = false;
      }
    }

    else if(lastStatus[1]==0 && status[1]==1){
     if(!isOn[1]){
     house1.loop();
      
      car.pause();
      plane.pause();
      motorbike.pause();
      train.pause();
      taxi.pause();
      
      earth.rewind();
      earth.play();
    println("HOW BIG IS YOUR HOUSE");
    isOn[1]=true;
     }else{
     house1.pause();
     isOn[1]=false;
     }
    }
    
    else if(lastStatus[2]==0 && status[2]==1){
      if(!isOn[2]){
      shoppingcart1.loop();
      
      car.pause();
      plane.pause();
      motorbike.pause();
      train.pause();
      taxi.pause();
      
      casher.rewind();
      casher.play();
    println("SPEND MONEY");
    isOn[2]=true;
      }else{
      shoppingcart1.pause();
      isOn[2]=false;
      }
}

    else if(lastStatus[10]==0 && status[10]==1){
      if(!isOn[10]){
      country1.loop(); 
    println("SELECT YOUR COUNTRY");
    isOn[10]=true;
      }else{
      country1.pause();
      isOn[10]=false;
      }
}

else if(lastStatus[3]==0 && status[3]==1){
      taxi1.loop();
      
      car.pause();
      plane.pause();
      motorbike.pause();
      train.pause();
      
      taxi.rewind();
      taxi.play();
    println("TAXI IS COMING"); 
}

else if(lastStatus[4]==0 && status[4]==1){
      cars1.loop();
      
      plane.pause();
      motorbike.pause();
      train.pause();
      taxi.pause();
      
      car.rewind();
      car.play();
    println("DIDI"); 
}

else if(lastStatus[5]==0 && status[5]==1){
      plane1.loop();
      
      car.pause();
      motorbike.pause();
      train.pause();
      taxi.pause();
      
      plane.rewind();
      plane.play();
    println("FLYING"); 
}

else if(lastStatus[6]==0 && status[6]==1){
    bycicle1.loop();
  
    car.pause();
    plane.pause();
    motorbike.pause();
    train.pause();
    taxi.pause();
  
    bicycle.rewind();
    bicycle.play();
    println("GREEN TRANS"); 
}

else if(lastStatus[7]==0 && status[7]==1){
      motorbike1.loop();
      
      car.pause();
      plane.pause();
      train.pause();
      taxi.pause();
      
      motorbike.rewind();
      motorbike.play();
    println("didididdadadada");
}

else if(lastStatus[8]==0 && status[8]==1){
      train1.loop();
  
      car.pause();
      plane.pause();
      motorbike.pause();
      taxi.pause();
      
      train.rewind();
      train.play();
    println("TUTUTUTUTU"); 
}

else if(lastStatus[9]==0 && status[9]==1){
      bus1.loop();
      
      car.pause();
      plane.pause();
      motorbike.pause();
      train.pause();
      taxi.pause();
      
      bus.rewind();
      bus.play();
    println("BUS IS COMING"); 
}
for (int i=0; i<status.length; i++) {
    lastStatus[i] = status[i];
}
}

void keyPressed(){
  switch(key){
  case'c':
  ks.toggleCalibration();
  break;
  case'l':
  ks.load();
  break;
  case's':
  ks.save();
  break;
  }
}

void movieEvent(Movie m) { 
 m.read();
}
