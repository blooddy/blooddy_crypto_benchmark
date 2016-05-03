////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto.benchmark {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	[SWF( width="430", height="280", frameRate="60", backgroundColor="#373737" )]
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 */
	public class BenchmarkLoader extends MovieClip {

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor
		 */
		public function BenchmarkLoader() {
			
			super();
			
			var $this:MovieClip = this;
			super.loaderInfo.addEventListener( Event.COMPLETE, function(event:Event):void {
				$this.nextFrame();
				$this.parent.addChild( new ( getDefinitionByName( 'by.blooddy.crypto.benchmark.Benchmark' ) as Class ) );
				$this.parent.removeChild( $this );
			} );
			
		}

	}

}