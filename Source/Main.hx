package;

import openfl.display.Sprite;
import Random;

class Main extends Sprite
{
	var walls:Array<Array<Bool>>;
	var flats:Array<Array<Bool>>;

	static var wallPc:Float = 0.3;
	static var flatPc:Float = 0.25;

	static var xDim:Int = 10;
	static var yDim:Int = 10;

	public function new()
	{
		super();

		//generate
		for(y in 0...yDim){
			walls = new Array<Array<Bool>>();
			flats = new Array<Array<Bool>>();
			for(x in 0...xDim){
			walls[y] = new Array<Bool>();
			flats[y] = new Array<Bool>();
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
				trace(x,y,walls[x][y],flats[x][y]);
			}
		}
	}
}
