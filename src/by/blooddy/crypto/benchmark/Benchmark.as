////////////////////////////////////////////////////////////////////////////////
//
//  (C) 2010 BlooDHounD
//
////////////////////////////////////////////////////////////////////////////////

package by.blooddy.crypto.benchmark {

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import by.blooddy.crypto.Base64Test;
	import by.blooddy.crypto.MD5Test;
	import by.blooddy.crypto.SHA1Test;
	import by.blooddy.crypto.SHA2Test;
	import by.blooddy.crypto.image.JPEGEncoderTest;
	import by.blooddy.crypto.image.PNGEncoderTest;
	import by.blooddy.crypto.serialization.JSONTest;
	
	[SWF( width="430", height="280", frameRate="60", backgroundColor="#373737" )]
	/**
	 * @author					BlooDHounD
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 */
	public class Benchmark extends Sprite {

		//--------------------------------------------------------------------------
		//
		//  Class variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private static const _FORMAT:TextFormat = new TextFormat( '_typewriter', 12, 0xCCCCCC );
		
		/**
		 * @private
		 */
		private static const _STYLE_SHEET:StyleSheet = new StyleSheet();
		_STYLE_SHEET.parseCSS(
			'a {' +
			'	color: #99CCFF;' +
			'	font-weight: bold;' +
			'}' +
			'a:hover {' +
			'	text-decoration: underline;' +
			'}'
		);
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor
		 */
		public function Benchmark() {

			super();

			this._menu.x = 10;
			this._menu.y = ( this._copy ? this._copy.y + 30 : 10 );
			this._menu.wordWrap = true;
			this._menu.multiline = true;
			this._menu.defaultTextFormat = _FORMAT;
			this._menu.autoSize = TextFieldAutoSize.LEFT;
			this._menu.styleSheet = _STYLE_SHEET;
			this._menu.selectable = false;
			this._menu.addEventListener( TextEvent.LINK, this.handler_link );
			super.addChild( this._menu );
			
			this._log.x = 10;
			this._log.defaultTextFormat = _FORMAT;
			this._log.multiline = true;
			super.addChild( this._log );
			
			this.handler_resize();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener( Event.RESIZE, this.handler_resize );
			
			var link:ContextMenuItem = new ContextMenuItem( 'blooddy_crypto.swc' );
			link.addEventListener( ContextMenuEvent.MENU_ITEM_SELECT, function(event:ContextMenuEvent):void {
				navigateToURL( new URLRequest( 'http://blooddy.by' ) );
			} );
			
			var contextMenu:ContextMenu = new ContextMenu();
			contextMenu.hideBuiltInItems();
			contextMenu.customItems = [ link ];
			
			this._log.contextMenu = contextMenu;
			
			this.addTest( new MD5Test(), 'MD5' );
			this.addTest( new SHA1Test(), 'SHA1' );
			this.addTest( new SHA2Test(), 'SHA2' );
			this.addTest( new JSONTest(), 'JSON' );
			this.addTest( new Base64Test(), 'Base64' );
			this.addTest( new PNGEncoderTest(), 'PNGEncoder' );
			this.addTest( new JPEGEncoderTest(), 'JPEGEncoder' );
			
		}

		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private const _menu:TextField = new TextField();
		
		/**
		 * @private
		 */
		private var _copy:TextField;
		
		/**
		 * @private
		 */
		private const _log:TextField = new TextField();
		
		/**
		 * @private
		 */
		private const _hash_tests:Object = new Object();
		
		/**
		 * @private
		 */
		private const _list_tests:Vector.<TestSuite> = new Vector.<TestSuite>();
		
		/**
		 * @private
		 */
		private var _busy:Boolean = false;
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		public function addTest(test:TestSuite, name:String):void {
			if ( name in this._hash_tests ) throw new ArgumentError();
			if ( this._list_tests.indexOf( test ) >= 0 ) throw new ArgumentError();
			this._hash_tests[ name ] = test;
			this._list_tests.push( test );
			this._menu.htmlText += ( this._list_tests.length != 1 ? ' ' : '' ) + '<a href="event:' + name + '">' + name + '</a>';
			this.handler_resize();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private function handler_resize(event:Event=null):void {
			this._menu.width = stage.stageWidth - 10 - this._menu.x;
			this._log.y = this._menu.y + this._menu.height + 10;
			this._log.width = stage.stageWidth - 10 - this._log.x;
			this._log.height = stage.stageHeight - 10 - this._log.y;
		}
		
		/**
		 * @private
		 */
		private function handler_link(event:TextEvent):void {
			if ( this._busy ) return;
			var test:TestSuite = this._hash_tests[ event.text ];
			if ( test ) {
				this._busy = true;
				this._log.htmlText = '';
				test.addEventListener( Event.COMPLETE, this.handler_complete );
				test.addEventListener( Event.CHANGE, this.handler_progress );
				test.run();
			}
		}
		
		/**
		 * @private
		 */
		private function handler_complete(event:Event):void {
			this._log.htmlText += '\n\ncomplete';
			this._log.setTextFormat( _FORMAT );
			this._log.scrollV = this._log.maxScrollV;
			this._busy = false;
		}
		
		/**
		 * @private
		 */
		private function handler_progress(event:Event):void {
			var test:TestSuite = event.target as TestSuite;
			var text:String = '';
			var s:String = '';
			const l:uint = 50;
			for each ( var r:TestResult in test.results ) {
				s = r.description || r.name.toString();
				if ( s.length > l ) {
					s = s.substr( 0, l-3 ) + '...:';
				} else {
					s += ':';
					while ( s.length < l ) s += ' ';
				}
				text += ( text.length == 0 ? '' : '\n' ) + s + ' ' + ( r.error ? r.error : r.time );
			}
			this._log.htmlText = text;
			this._log.setTextFormat( _FORMAT );
			this._log.scrollV = this._log.maxScrollV;
		}
		
	}

}