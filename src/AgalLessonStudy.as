package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import agalLesson.Lesson3;
	import agalLesson.Lesson4;
	import agalLesson.Main;

	[SWF(width="640", height="480", frameRate="60", backgroundColor="#000000")]	
	public class AgalLessonStudy extends Sprite
	{
		public function AgalLessonStudy()
		{
			if (stage != null) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event = null):void 
		{
			
			if (hasEventListener(Event.ADDED_TO_STAGE))
				removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.frameRate = 60;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// and request a context3D from Stage3d
			stage.stage3Ds[0].addEventListener(
				Event.CONTEXT3D_CREATE, onContext3DCreate);
			stage.stage3Ds[0].requestContext3D();
		}
		
		private function onContext3DCreate(event:Event):void 
		{
			var main:Main = new mainClass();
			this.addChild(main);
			main.init();
		}
		
		private function get mainClass():Class
		{
			return Lesson4;
		}
		
	}
}