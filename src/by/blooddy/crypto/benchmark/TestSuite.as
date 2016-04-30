////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto.benchmark {

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import avmplus.DescribeType;

	//--------------------------------------
	//  Events
	//--------------------------------------
	
	/**
	 * @eventType			flash.events.Event.CHANGE
	 */
	[Event( name="change", type="flash.events.Event" )]
	
	/**
	 * @eventType			flash.events.Event.COMPLETE
	 */
	[Event( name="complete", type="flash.events.Event" )]
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @created					12.10.2010 23:32:21
	 */
	public class TestSuite extends EventDispatcher {

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		/**
		 * Constructor
		 */
		public function TestSuite() {

			super();
			
			var info:Object = DescribeType.get( this, DescribeType.INCLUDE_METHODS | DescribeType.INCLUDE_TRAITS | DescribeType.INCLUDE_METADATA );
			
			var ns:String = getQualifiedClassName( TestSuite );
			
			var method:Object;
			var metadata:Object;
			var value:Object;
			
			var description:String;
			var order:Number;
			
			var arr:Array = new Array();
			var results:Array = new Array();
			
			for each ( method in info.traits.methods ) {
				if ( method.declaredBy != ns ) {
					for each ( metadata in method.metadata ) {
						if ( metadata.name == 'Test' ) {

							description = '';
							order = 0;
							
							for each ( value in metadata.value ) {
								switch ( value.key.toLowerCase() ) {
									case 'description':
										description = value.value;
										break;
									case 'order':
										order = parseInt( value.value );
										break;
								}
							}

							arr.push( new TestCase(
								this[ method.name ],
								method.name,
								description,
								order
							) );
							
						}
					}
				}
			}
			
			this._tests.push.apply( this._tests, arr.sortOn( 'order', Array.NUMERIC ) );

			for each ( var test:TestCase in this._tests ) {
				this._results.push( new TestResult( test.name, test.description ) );
			}
			
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------

		/**
		 * @private
		 */
		private const _tests:Vector.<TestCase> = new Vector.<TestCase>();

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		/**
		 * @private
		 */
		private const _results:Vector.<TestResult> = new Vector.<TestResult>();

		public function get results():Vector.<TestResult> {
			return this._results.slice();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------

		public function run():void {
			
			var i:int = 0;
			var l:int = this._tests.length;
			
			for each ( var result:TestResult in this._results ) {
				result.time = Number.NaN;
				result.error = null;
			}
			
			setTimeout( function():void {
				
				if ( i < l ) {
					
					var test:TestCase = _tests[ i ];
					var result:TestResult = _results[ i ];
		
					var t:uint = getTimer();

					try {
					
						test.test();
						
					} catch ( e:Error ) {
						
						result.error = e;
						
					}
					
					result.time = getTimer() - t;
					
					dispatchEvent( new Event( Event.CHANGE ) );

					++i;
					
					setTimeout( arguments.callee, 1 );
					
				} else {
					
					dispatchEvent( new Event( Event.COMPLETE ) );
					
				}
					
			}, 1 );
			
		}

	}

}

/**
 * @private
 */
internal final class TestCase {

	public function TestCase(test:Function, name:String, description:String, order:int=0) {
		super();
		this.test = test;
		this.name = name;
		this.description = description;
		this.order = order;
	}

	public var test:Function;

	public var name:String;
	
	public var description:String;

	public var order:int;
	
}