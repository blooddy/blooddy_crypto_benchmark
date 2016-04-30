////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto {

	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import by.blooddy.crypto.benchmark.TestSuite;
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 */
	public class BinaryTest extends TestSuite {

		//--------------------------------------------------------------------------
		//
		//  Class variables
		//
		//--------------------------------------------------------------------------
		
		protected static const _LOADER:URLLoader = new URLLoader( new URLRequest( 'https://api.kongregate.com/badges.json' ) );
		
		protected static var _BIN:ByteArray;
		
		_LOADER.dataFormat = URLLoaderDataFormat.BINARY;
		_LOADER.addEventListener( Event.COMPLETE, function(event:Event):void {
			
			_BIN = _LOADER.data;
			
		}, false, int.MAX_VALUE );
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function BinaryTest() {
			super();
		}

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		public override function run():void {
			
			var run:Function = super.run;
			
			if ( _BIN ) {
				run();
			} else {
				_LOADER.addEventListener( Event.COMPLETE, function(event:Event):void {
					run();
				} );
			}
			
		}
		
	}

}