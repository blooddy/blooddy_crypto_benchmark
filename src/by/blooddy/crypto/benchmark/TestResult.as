////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto.benchmark {
	
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @created					13.10.2010 0:38:44
	 */
	public class TestResult {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor
		 */
		public function TestResult(name:String, description:String) {
			super();
			this.name = name;
			this.description = description;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		public var name:String;
		
		public var description:String;
		
		public var time:Number;

		public var error:Error;

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------

		public function toString():String {
			return	(
						this.description
						?	this.description
						:	this.name
					) +
					': ' +
					(
						this.error
						?	this.error
						:	( isFinite( this.time ) ? this.time + ' ms' : '*' )
					);
		}

	}
	
}