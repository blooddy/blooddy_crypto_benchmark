////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto {

	import com.adobe.crypto.SHA224;
	import com.adobe.crypto.SHA256;
	
	import flash.utils.ByteArray;
	
	import mx.utils.SHA256;
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 */
	public class SHA2Test extends BinaryTest {

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function SHA2Test() {
			super();
			var bin:ByteArray = new ByteArray();
			by.blooddy.crypto.SHA224.hashBytes( bin );
			com.adobe.crypto.SHA224.hashBytes( bin );
			by.blooddy.crypto.SHA256.hashBytes( bin );
			com.adobe.crypto.SHA256.hashBytes( bin );
			mx.utils.SHA256.computeDigest( bin );
		}

		//--------------------------------------------------------------------------
		//
		//  Tests
		//
		//--------------------------------------------------------------------------
		
		[Test( description="by.blooddy.crypto.SHA224", order=1 )]
		public function bloddy_crypto_sha224():void {
			by.blooddy.crypto.SHA224.hashBytes( _BIN );
		}
		
		[Test( description="com.adobe.crypto.SHA224", order=2 )]
		public function as3corelib_sha224():void {
			com.adobe.crypto.SHA224.hashBytes( _BIN );
		}

		[Test( description="by.blooddy.crypto.SHA256", order=11 )]
		public function bloddy_crypto_sha256():void {
			by.blooddy.crypto.SHA256.hashBytes( _BIN );
		}
		
		[Test( description="com.adobe.crypto.SHA256", order=12 )]
		public function as3corelib_sha256():void {
			com.adobe.crypto.SHA256.hashBytes( _BIN );
		}
		
		[Test( description="mx.utils.SHA256", order=13 )]
		public function flex_sdk_sha256():void {
			mx.utils.SHA256.computeDigest( _BIN );
		}
		
	}

}