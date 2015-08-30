package agalLesson
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage3D;
	import flash.display3D.Context3D;
	import flash.display3D.Context3DTextureFormat;
	import flash.display3D.textures.Texture;
	import flash.events.Event;
	import flash.geom.Matrix;
	
	public class Main extends Sprite
	{
		// constants used during inits
		protected static const swfWidth:int = 640;
		protected static const swfHeight:int = 480;
		protected static const textureSize:int = 512;
		
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
		
		public static function drawTexture(context3D:Context3D, bitData:BitmapData):Texture
		{
			var myTexture:Texture = context3D.createTexture(textureSize, textureSize, 
				Context3DTextureFormat.BGRA, false);
			var ws:uint = bitData.width;
			var hs:uint = bitData.height;
			var transform:Matrix = new Matrix();
			var level:int = 0;
			var tmp:BitmapData = new BitmapData(ws, hs, true, 0x00000000);
			while ( ws >= 1 && hs >= 1 )
			{ 
				tmp.draw(bitData, transform, null, null, null, true); 
				myTexture.uploadFromBitmapData(tmp, level);
				transform.scale(0.5, 0.5);
				level++;
				ws >>= 1;
				hs >>= 1;
				if (hs && ws) 
				{
					tmp.dispose();
					tmp = new BitmapData(ws, hs, true, 0x00000000);
				}
			}
			tmp.dispose();
			return myTexture;
		}
		
	}
}