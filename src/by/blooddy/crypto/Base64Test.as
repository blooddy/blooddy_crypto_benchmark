////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto {

	import flash.events.Event;
	
	import mx.utils.Base64Encoder;
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @created					13.10.2010 2:07:54
	 */
	public class Base64Test extends BinaryTest {

		//--------------------------------------------------------------------------
		//
		//  Class variables
		//
		//--------------------------------------------------------------------------

		protected static var _STR:String;
		
		_LOADER.addEventListener( Event.COMPLETE, function(event:Event):void {
			
			_STR = by.blooddy.crypto.Base64.encode( _BIN );
			
		}, false, int.MAX_VALUE );
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor
		 */
		public function Base64Test() {
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		[Test( description="by.blooddy.crypto.Base64 decode", order=1 )]
		public function bloddy_crypto_decode():void {
			by.blooddy.crypto.Base64.decode( _STR );
		}
		
		[Test( description="mx.utils.Base64Encoder decode", order=2 )]
		public function flex_decode():void {
			var e:mx.utils.Base64Decoder = new mx.utils.Base64Decoder();
			e.decode( _STR );
			e.flush();
		}
		
		[Test( description="by.blooddy.crypto.Base64 encode", order=11 )]
		public function bloddy_crypto_encode():void {
			by.blooddy.crypto.Base64.encode( _BIN );
		}
		
		[Test( description="mx.utils.Base64Encoder encode", order=12 )]
		public function flex_encode():void {
			var e:mx.utils.Base64Encoder = new mx.utils.Base64Encoder();
			e.insertNewLines = false;
			e.encodeBytes( _BIN );
			e.flush();
		}
		
	}
	
}