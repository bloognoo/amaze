package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;

class Cell extends Sprite {

	public static var OFF:Int = 0;
	public static var ON:Int = 1;

	public var xPos:Int;
	public var yPos:Int;
	var wall:Bool;
	var floor:Bool;
	public var state:Int;
	var yd:Int;
	var xd:Int;
	var thickness:Int;

	var tex:Bitmap;

	public function new(xP:Int,yP:Int,wl:Bool,fl:Bool){
		super();
		xPos = xP;
		yPos = yP;
		wall = wl;
		floor = fl;
		state = OFF;
		yd= 20;
		xd= 20;
		thickness=2;
		if(wall){
			graphics.beginFill(0x000000);
			graphics.drawRect(0,0,thickness,yd);
			graphics.endFill();
		}
		if(floor){
			graphics.beginFill(0x000000);
			graphics.drawRect(0,0,xd,-thickness);
			graphics.endFill();
		}
		// trace("("+xPos+","+yPos+") "+wall+" "+floor);

		tex = new Bitmap(Assets.getBitmapData("assets/lightning.png"));
		// addChild(tex);
		tex.width = xd;
		tex.height = yd;
	}

	public function activate(){
		//TODO Implement Activate
		state = ON;
		addChild(tex);
	}

	public function update(l:Cell,r:Cell,d:Cell){
		//TODO Implement Update
		if(state){
			if(l!=null &&!l.wall() && !l.active()){
				l.activate();
			}
		}	
	}
}
