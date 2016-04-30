////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto.serialization {

	import com.adobe.serialization.json.JSON;
	
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	import by.blooddy.crypto.BinaryTest;
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 */
	public class JSONTest extends BinaryTest {

		//--------------------------------------------------------------------------
		//
		//  Class variables
		//
		//--------------------------------------------------------------------------
		
		private static const JSON:Object =  ApplicationDomain.currentDomain.hasDefinition( 'JSON' ) ? ApplicationDomain.currentDomain.getDefinition( 'JSON' ) : null;

		protected static var _STR:String;
		
		protected static var _OBJ:Object;
		
		_LOADER.addEventListener( Event.COMPLETE, function(event:Event):void {
			
			_STR = _BIN.readUTFBytes( _BIN.length );
			_OBJ = JSONer.parse( _STR );
			
		}, false, int.MAX_VALUE );
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function JSONTest() {

			super();

			by.blooddy.crypto.serialization.JSONer.parse( '0' );
			com.adobe.serialization.json.JSON.decode( '0' );
			
			by.blooddy.crypto.serialization.JSONer.stringify( 0 );
			com.adobe.serialization.json.JSON.encode( 0 );
			
		}

		//--------------------------------------------------------------------------
		//
		//  Tests
		//
		//--------------------------------------------------------------------------
		
		[Test( description="by.blooddy.crypto.serialization.JSONer.parse", order=1 )]
		public function bloddy_crypto_decode():void {
			by.blooddy.crypto.serialization.JSONer.parse( _STR );
		}
		
		[Test( description="com.adobe.serialization.json.JSON.decode", order=2 )]
		public function as3corelib_decode():void {
			com.adobe.serialization.json.JSON.decode( _STR );
		}

		[Test( description="by.blooddy.crypto.serialization.JSONer.stringify", order=11 )]
		public function bloddy_crypto_encode():void {
			by.blooddy.crypto.serialization.JSONer.stringify( _OBJ );
		}
		
		[Test( description="com.adobe.serialization.json.JSON.encode", order=12 )]
		public function as3corelib_encode():void {
			com.adobe.serialization.json.JSON.encode( _OBJ );
		}
		
	}

}