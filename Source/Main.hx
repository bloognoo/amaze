package;

import openfl.display.Sprite;
import openfl.events.Event;
import Random;

class Cell extends Sprite {

	public var xPos:Int;
	public var yPos:Int;
	var wall:Bool;
	var floor:Bool;
	var value:Int;
	var yd:Int;
	var xd:Int;
	var thickness:Int;

	public function new(xP:Int,yP:Int,wl:Bool,fl:Bool){
		super();
		xPos = xP;
		yPos = yP;
		wall = wl;
		floor = fl;
		value = 0;
		yd= 20;
		xd= 20;
		thickness=2;
		if(wall){
			graphics.beginFill(0x000000);
			graphics.drawRect((x-1)*xd,y*yd,xd+thickness,thickness);
			graphics.endFill();
		}
		if(floor){
			graphics.beginFill(0x000000);
			graphics.drawRect(x*xd,y*yd,thickness,-yd-thickness);
			graphics.endFill();
		}
		trace("("+xPos+","+yPos+") "+wall+" "+floor);
	}
}

class Main extends Sprite
{
	var cells:Array<Cell>;

	static var wallPc:Float = 0.5;
	static var flatPc:Float = 0.3;

	static var xDim:Int = 30;
	static var yDim:Int = 30;

	public function new()
	{
		super();

		cells = new Array<Cell>();

		var len = xDim * yDim;

		//generate
		for(n in 0...len){
			var cell = new Cell(
					n%xDim,
					Std.int(n/yDim),
					Random.float(0,1)<wallPc,
					Random.float(0,1)<flatPc
					);
			addChild(cell);
			cell.x = xDim * cell.xPos;
			cell.y = yDim * cell.yPos;
		}

		// do{
		//	y++;
		//	do{
		//		x++;
		//		if(walls[y-1][x-1]){
		//		}
		//		if(flats[y-1][x-1]){
		//		}
		//	}while(x<xDim);
		//	x = 0;
		// }while(y<yDim);

		// var maxTail=5;
		// heads = new Array<Head>();

		// var xStart:Int = Random.int(0,Std.int(xDim/3));

		// trace("Starting at: "+xStart);

		// heads.push(new Head(xStart));

		// addEventListener(Event.ENTER_FRAME, updateHeads );

	}

	// function updateHeads(event:Event):Void{

	// 	heads = heads.filter(filterHead);
	// }

	// function filterHead(head:Head):Bool{
	// 	var alive = head.update();
	// 	head.render();
	// 	return alive;
	// }
}
