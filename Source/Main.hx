package;

import Cell;
import Random;
import openfl.events.Event;
import openfl.display.Sprite;
import openfl.display.FPS;

using Lambda;

class Main extends Sprite
{
	var cells:Array<Cell>;

	static var wallPc:Float = 0.5;
	static var flatPc:Float = 0.3;

	static var xDim:Int = 20;
	static var yDim:Int = 20;

	public function new()
	{
		super();

		var fps = new FPS();
		fps.x = -30;
		fps.y = -30;
		addChild(fps);

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
			cells.push(cell);
		}

		cells[Std.int(xDim/2)].activate();

		addEventListener(Event.ENTER_FRAME, frame );
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
	}

	function frame(event:Event):Void{
		//test cell and grow out
		cells.foreach(function (cell){
			cell.update();
			return true;
		});
	}

	function addedToStage(event:Event):Void{
		x = 30;
		y = 30;
	}
}
