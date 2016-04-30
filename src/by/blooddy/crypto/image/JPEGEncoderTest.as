////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto.image {

	import com.adobe.images.JPGEncoder;
	
	import flash.display.BitmapData;
	
	import mx.graphics.codec.JPEGEncoder;
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @created					13.10.2010 2:49:08
	 */
	public class JPEGEncoderTest extends ImageTest {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor
		 */
		public function JPEGEncoderTest() {
			super();
			var bmp:BitmapData = new BitmapData( 100, 100 );
			by.blooddy.crypto.image.JPEGEncoder.encode( bmp, 1 );
			( new com.adobe.images.JPGEncoder( 1 ) ).encode( bmp );
			( new mx.graphics.codec.JPEGEncoder( 1 ) ).encode( bmp );
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		[Test( description="by.blooddy.crypto.image.JPEGEncoder", order=1 )]
		public function blooddy_crypto():void {
			by.blooddy.crypto.image.JPEGEncoder.encode( _IMAGE, 60 );
		}
		
		[Test( description="com.adobe.images.JPGEncoder", order=2 )]
		public function as3corelib():void {
			( new com.adobe.images.JPGEncoder( 60 ) ).encode( _IMAGE );
		}
		
		[Test( description="mx.graphics.codec.JPEGEncoder", order=3 )]
		public function flex_sdk():void {
			( new mx.graphics.codec.JPEGEncoder( 60 ) ).encode( _IMAGE );
		}
		
	}
	
}