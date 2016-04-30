////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto {

	import com.adobe.crypto.SHA224;
	import com.adobe.crypto.SHA256;
	
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
		}

		//--------------------------------------------------------------------------
		//
		//  Tests
		//
		//--------------------------------------------------------------------------
		
		[Test( description="by.blooddy.crypto.SHA224.hashBytes", order=1 )]
		public function bloddy_crypto_sha224():void {
			by.blooddy.crypto.SHA224.hashBytes( _BIN );
		}
		
		[Test( description="com.adobe.crypto.SHA224.hashBytes", order=2 )]
		public function as3corelib_sha224():void {
			com.adobe.crypto.SHA224.hashBytes( _BIN );
		}

		[Test( description="by.blooddy.crypto.SHA256.hashBytes", order=11 )]
		public function bloddy_crypto_sha256():void {
			by.blooddy.crypto.SHA256.hashBytes( _BIN );
		}
		
		[Test( description="com.adobe.crypto.SHA256.hashBytes", order=12 )]
		public function as3corelib_sha256():void {
			com.adobe.crypto.SHA256.hashBytes( _BIN );
		}
		
	}

}