package agalLesson
{
	import flash.display.Sprite;
	import flash.display.Stage3D;
	import flash.display3D.Context3D;
	import flash.events.Event;
	
	public class Main extends Sprite
	{
		// constants used during inits
		protected const swfWidth:int = 640;
		protected const swfHeight:int = 480;
		protected const textureSize:int = 512;
		
		// the 3d graphics window on the stage
		protected var context3D:Context3D;
		public function Main()
		{
			super();
		}
		
		public function init():void
		{
			var t:Stage3D = stage.stage3Ds[0];					
			context3D = t.context3D; 	
			
			if (context3D == null) 
			{
				// Currently no 3d context is available (error!)
				return;
			}
			
			// Disabling error checking will drastically improve performance.
			// If set to true, Flash will send helpful error messages regarding
			// AGAL compilation errors, uninitialized program constants, etc.
			context3D.enableErrorChecking = true;
			
			
			// The 3d back buffer size is in pixels
			context3D.configureBackBuffer(swfWidth, swfHeight, 0, true);
			
			init3DData();
			
			addEventListener(Event.ENTER_FRAME, updateFrame);
		}
		protected function init3DData():void
		{
			
		}
		protected function updateFrame(evt:Event):void
		{
			
		}
	}
}