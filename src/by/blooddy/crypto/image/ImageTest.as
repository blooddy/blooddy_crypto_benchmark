////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto.image {
	
	import flash.display.BitmapData;
	
	import by.blooddy.crypto.benchmark.TestSuite;
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @created					13.10.2010 2:38:08
	 */
	public class ImageTest extends TestSuite {
		
		//--------------------------------------------------------------------------
		//
		//  Class variables
		//
		//--------------------------------------------------------------------------
		
		protected static const _IMAGE:BitmapData = new BitmapData( 512, 512, false, 0xFFFFFF );
		_IMAGE.perlinNoise( 51, 51, 16, 0, false, true, 7 );
		
		protected static const _IMAGE_TRANS:BitmapData = new BitmapData( 512, 512, true, 0xFFFFFFFF );
		_IMAGE_TRANS.perlinNoise( 51, 51, 16, 0, false, true, 15 );
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor
		 */
		public function ImageTest() {
			super();
		}
		
	}
	
}