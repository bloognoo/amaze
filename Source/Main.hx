package;

import openfl.display.Sprite;
import Random;

class Main extends Sprite
{
	var walls:Array<Array<Bool>>;
	var flats:Array<Array<Bool>>;

	static var wallPc:Float = 0.5;
	static var flatPc:Float = 0.3;

	static var xDim:Int = 30;
	static var yDim:Int = 30;

	public function new()
	{
		super();

		walls = new Array<Array<Bool>>();
		flats = new Array<Array<Bool>>();
		//generate
		for(y in 0...yDim){
			walls.push(new Array<Bool>());
			flats.push(new Array<Bool>());
			for(x in 0...xDim){
				if(Random.float(0,1)<wallPc){
					walls[y].push(true);
				}else{
					walls[y].push(false);
				}
				if(Random.float(0,1)<flatPc){
					flats[y].push(true);
				}else{
					flats[y].push(false);
				}
			}
		}

		var y:Int = 0;
		var x:Int = 0;
		var yd:Int = 20;
		var xd:Int = 20;
		var thickness:Int=2;

		do{
			y++;
			do{
				x++;
				if(walls[y-1][x-1]){
					graphics.beginFill(0x000000);
					graphics.drawRect((x-1)*xd,y*yd,xd,thickness);
					graphics.endFill();
				}
				if(flats[y-1][x-1]){
					graphics.beginFill(0x000000);
					graphics.drawRect(x*xd,y*yd,thickness,-yd);
					graphics.endFill();
				}
			}while(x<xDim);
			x = 0;
		}while(y<yDim);
	}
}
