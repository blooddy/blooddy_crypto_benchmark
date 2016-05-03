////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto.image {
	
	import com.adobe.images.JPGEncoder;
	import com.adobe.images.PNGEncoder;
	
	import flash.display.BitmapData;
	
	import mx.graphics.codec.JPEGEncoder;
	import mx.graphics.codec.PNGEncoder;
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @created					13.10.2010 2:13:20
	 */
	public class PNGEncoderTest extends ImageTest {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		/**
		 * Constructor
		 */
		public function PNGEncoderTest() {
			super();
			var bmp:BitmapData = new BitmapData( 100, 100 );
			by.blooddy.crypto.image.PNGEncoder.encode( bmp, 1 );
			com.adobe.images.PNGEncoder.encode( bmp );
			( new mx.graphics.codec.PNGEncoder() ).encode( bmp );
		}

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		[Test( description="by.blooddy.crypto.image.PNGEncoder", order=1 )]
		public function blooddy_crypto():void {
			by.blooddy.crypto.image.PNGEncoder.encode( _IMAGE );
		}
		
		[Test( description="com.adobe.images.PNGEncoder", order=3 )]
		public function as3corelib():void {
			com.adobe.images.PNGEncoder.encode( _IMAGE );
		}
		
		[Test( description="mx.graphics.codec.PNGEncoder", order=3 )]
		public function flex_sdk():void {
			( new mx.graphics.codec.PNGEncoder() ).encode( _IMAGE );
		}
		
		[Test( description="by.blooddy.crypto.image.PNG24Encoder transparent", order=11 )]
		public function blooddy_crypto_transparent():void {
			by.blooddy.crypto.image.PNG24Encoder.encode( _IMAGE_TRANS );
		}
		
		[Test( description="com.adobe.images.PNGEncoder transparent", order=12 )]
		public function as3corelib_transparent():void {
			com.adobe.images.PNGEncoder.encode( _IMAGE_TRANS );
		}
		
		[Test( description="mx.graphics.codec.PNGEncoder transparent", order=13 )]
		public function flex_sdk_transparent():void {
			( new mx.graphics.codec.PNGEncoder() ).encode( _IMAGE_TRANS );
		}
		
	}
	
}