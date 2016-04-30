////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto {

	import com.adobe.crypto.SHA1;
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 */
	public class SHA1Test extends BinaryTest {

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function SHA1Test() {
			super();
		}

		//--------------------------------------------------------------------------
		//
		//  Tests
		//
		//--------------------------------------------------------------------------
		
		[Test( description="by.blooddy.crypto.SHA1", order=1 )]
		public function bloddy_crypto_sha1():void {
			by.blooddy.crypto.SHA1.hashBytes( _BIN );
		}
		
		[Test( description="com.adobe.crypto.SHA1", order=2 )]
		public function as3corelib_sha1():void {
			com.adobe.crypto.SHA1.hashBytes( _BIN );
		}

	}

}