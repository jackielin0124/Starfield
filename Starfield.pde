Particle [] spot;

void setup()
{
	
	size(400, 400);
	spot=new Particle[100];
	for(int i=0; i<spot.length-2; i++){
		spot[i]=new NormalParticle();
	}
	spot[spot.length-1]=new OddballParticle();
	spot[spot.length-2]=new JumboParticle();

}
void draw()
{
	background(0);
	for(int i=0; i<spot.length; i++){
		spot[i].move();
		spot[i].show();
	}
}

interface Particle
{
	//all particles share these functions
	public void move();
	public void show();
}

class NormalParticle implements Particle
{
	//initialize variables for particles
	int mySize, shadeR, shadeG, shadeB;
	double x, y, speed, angle;
	NormalParticle(){
		shadeR=(int)(Math.random()*200)+55;
		shadeG=(int)(Math.random()*200)+55;
		shadeB=(int)(Math.random()*200)+55;
		angle=Math.random()*(2*Math.PI);
		speed=(Math.random()*8)+0.5;
		x=200;
		y=200;
		mySize=(int)(Math.random()*10)+2;
	}
	public void move(){
		//cast the angle(which is a double) as a float to take the sin/cos(angle);
		x=cos((float)angle)*speed+x;
		y=sin((float)angle)*speed+y;
		//reset particles when mouse is pressed
		if(mousePressed==true){
			x=mouseX;
			y=mouseY;
			shadeR=(int)(Math.random()*200)+55;
			shadeG=(int)(Math.random()*200)+55;
			shadeB=(int)(Math.random()*200)+55;
			angle=Math.random()*(2*Math.PI);
			speed=(Math.random()*8)+0.5;
		}
	}
	public void show(){
		noStroke();
		fill(shadeR,shadeG,shadeB);
		ellipse((float)x, (float)y, mySize, mySize);
	}
}


class OddballParticle implements Particle//uses an interface
{
	int mySize, shadeR, shadeG, shadeB, x, y;
	OddballParticle(){
		shadeR=(int)(Math.random()*200)+55;
		shadeG=(int)(Math.random()*200)+55;
		shadeB=(int)(Math.random()*200)+55;
		mySize=(int)(Math.random()*15)+2;
		x=200;
		y=200;
	}
	public void move(){
		x=x+(int)(Math.random()*5)-2;
		y=y+(int)(Math.random()*5)-2;
		if(mousePressed==true){
			x=mouseX;
			y=mouseY;
			shadeR=(int)(Math.random()*200)+55;
			shadeG=(int)(Math.random()*200)+55;
			shadeB=(int)(Math.random()*200)+55;
			mySize=(int)(Math.random()*15)+2;
		}
	}
	public void show(){
		noStroke();
		fill(shadeR,shadeG,shadeB);
		rect(x,y,mySize,mySize);
	}
}


class JumboParticle extends NormalParticle//uses inheritance
{
	JumboParticle(){
		speed=(Math.random()*3)+0.5;
		mySize=(int)(Math.random()*30)+40;
	}
}

