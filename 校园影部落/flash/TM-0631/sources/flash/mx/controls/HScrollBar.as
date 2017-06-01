class mx.controls.HScrollBar extends mx.controls.scrollClasses.ScrollBar
{
	var _minHeight, _minWidth, _xscale, _rotation, __width, scrollIt;
	function HScrollBar () {
		super();
	}
	function getMinWidth(Void) {
		return(_minHeight);
	}
	function getMinHeight(Void) {
		return(_minWidth);
	}
	function init(Void) {
		super.init();
		_xscale = -100;
		_rotation = -90;
	}
	function get virtualHeight() {
		return(__width);
	}
	function isScrollBarKey(k) {
		if (k == 37) {
			scrollIt("Line", -1);
			return(true);
		}
		if (k == 39) {
			scrollIt("Line", 1);
			return(true);
		}
		return(super.isScrollBarKey(k));
	}
	static var symbolName = "HScrollBar";
	static var symbolOwner = mx.core.UIComponent;
	static var version = "2.0.2.127";
	var className = "HScrollBar";
	var minusMode = "Left";
	var plusMode = "Right";
	var minMode = "AtLeft";
	var maxMode = "AtRight";
}
