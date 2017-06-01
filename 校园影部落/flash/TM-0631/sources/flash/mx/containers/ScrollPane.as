class mx.containers.ScrollPane extends mx.core.ScrollView
{
	var _total, _loaded, destroyChildAt, createChild, __scrollContent, spContentHolder, hScroller, vScroller, __get__hScrollPolicy, __vScrollPolicy, __get__vScrollPolicy, tabEnabled, keyDown, mask_mc, hPosition, __get__maxHPosition, vPosition, __get__maxVPosition, __hPosition, __vPosition, invalidate;
	function ScrollPane () {
		super();
	}
	function getBytesTotal() {
		return(_total);
	}
	function getBytesLoaded() {
		return(_loaded);
	}
	function set contentPath(scrollableContent) {
		if (!initializing) {
			if (scrollableContent == undefined) {
				destroyChildAt(0);
			} else {
				if (this[mx.core.View.childNameBase + 0] != undefined) {
					destroyChildAt(0);
				}
				createChild(scrollableContent, "spContentHolder");
			}
		}
		__scrollContent = scrollableContent;
		//return(contentPath);
	}
	function get contentPath() {
		return(__scrollContent);
	}
	function get content() {
		return(spContentHolder);
	}
	function setHPosition(position) {
		if ((position <= hScroller.maxPos) && (position >= hScroller.minPos)) {
			super.setHPosition(position);
			spContentHolder._x = -position;
		}
	}
	function setVPosition(position) {
		if ((position <= vScroller.maxPos) && (position >= vScroller.minPos)) {
			super.setVPosition(position);
			spContentHolder._y = -position;
		}
	}
	function get vLineScrollSize() {
		return(__vLineScrollSize);
	}
	function set vLineScrollSize(vLineSize) {
		__vLineScrollSize = vLineSize;
		vScroller.__set__lineScrollSize(vLineSize);
		//return(vLineScrollSize);
	}
	function get hLineScrollSize() {
		return(__hLineScrollSize);
	}
	function set hLineScrollSize(hLineSize) {
		__hLineScrollSize = hLineSize;
		hScroller.__set__lineScrollSize(hLineSize);
		//return(hLineScrollSize);
	}
	function get vPageScrollSize() {
		return(__vPageScrollSize);
	}
	function set vPageScrollSize(vPageSize) {
		__vPageScrollSize = vPageSize;
		vScroller.__set__pageScrollSize(vPageSize);
		//return(vPageScrollSize);
	}
	function get hPageScrollSize() {
		return(__hPageScrollSize);
	}
	function set hPageScrollSize(hPageSize) {
		__hPageScrollSize = hPageSize;
		hScroller.__set__pageScrollSize(hPageSize);
		//return(hPageScrollSize);
	}
	function set hScrollPolicy(policy) {
		__hScrollPolicy = policy.toLowerCase();
		setScrollProperties(spContentHolder._width, 1, spContentHolder._height, 1);
		//return(__get__hScrollPolicy());
	}
	function set vScrollPolicy(policy) {
		__vScrollPolicy = policy.toLowerCase();
		setScrollProperties(spContentHolder._width, 1, spContentHolder._height, 1);
		//return(__get__vScrollPolicy());
	}
	function get scrollDrag() {
		return(__scrollDrag);
	}
	function set scrollDrag(s) {
		__scrollDrag = s;
		if (__scrollDrag) {
			spContentHolder.useHandCursor = true;
			spContentHolder.onPress = function () {
				this._parent.startDragLoop();
			};
			spContentHolder.tabEnabled = false;
			spContentHolder.onRelease = (spContentHolder.onReleaseOutside = function () {
				delete this.onMouseMove;
			});
			__scrollDrag = true;
		} else {
			delete spContentHolder.onPress;
			spContentHolder.tabEnabled = false;
			spContentHolder.tabChildren = true;
			spContentHolder.useHandCursor = false;
			__scrollDrag = false;
		}
		//return(scrollDrag);
	}
	function init(Void) {
		super.init();
		tabEnabled = true;
		keyDown = _onKeyDown;
	}
	function createChildren(Void) {
		super.createChildren();
		mask_mc._visible = false;
		initializing = false;
		if ((__scrollContent != undefined) && (__scrollContent != "")) {
			contentPath = (__scrollContent);
		}
	}
	function size(Void) {
		super.size();
		setScrollProperties(spContentHolder._width, 1, spContentHolder._height, 1);
		hPosition = Math.min(hPosition, __get__maxHPosition());
		vPosition = Math.min(vPosition, __get__maxVPosition());
	}
	function setScrollProperties(columnCount, columnWidth, rowCount, rowHeight) {
		super.setScrollProperties(columnCount, columnWidth, rowCount, rowHeight);
		hScroller.__set__lineScrollSize(__hLineScrollSize);
		hScroller.__set__pageScrollSize(__hPageScrollSize);
		vScroller.__set__lineScrollSize(__vLineScrollSize);
		vScroller.__set__pageScrollSize(__vPageScrollSize);
	}
	function onScroll(scrollEvent) {
		spContentHolder._x = -__hPosition;
		spContentHolder._y = -__vPosition;
		super.onScroll(scrollEvent);
	}
	function childLoaded(obj) {
		super.childLoaded(obj);
		onComplete();
	}
	function onComplete(Void) {
		setScrollProperties(spContentHolder._width, 1, spContentHolder._height, 1);
		hPosition = 0;
		vPosition = 0;
		scrollDrag = (__scrollDrag);
		invalidate();
	}
	function startDragLoop(Void) {
		spContentHolder.lastX = spContentHolder._xmouse;
		spContentHolder.lastY = spContentHolder._ymouse;
		spContentHolder.onMouseMove = function () {
			var _local5 = this.lastX - this._xmouse;
			var _local4 = this.lastY - this._ymouse;
			_local5 = _local5 + this._parent.hPosition;
			_local4 = _local4 + this._parent.vPosition;
			var _local3 = this._parent.getViewMetrics();
			var _local7 = (this._parent.__height - _local3.top) - _local3.bottom;
			var _local6 = (this._parent.__width - _local3.left) - _local3.right;
			this._parent.__hPosition = Math.max(0, Math.min(_local5, this._width - _local6));
			this._parent.__vPosition = Math.max(0, Math.min(_local4, this._height - _local7));
			this._parent.hScroller.scrollPosition = this._parent.__hPosition;
			this._x = -this._parent.hPosition;
			this._parent.vScroller.scrollPosition = this._parent.__vPosition;
			this._y = -this._parent.vPosition;
			super.dispatchEvent({type:"scroll"});
		};
	}
	function dispatchEvent(o) {
		o.target = this;
		_total = o.total;
		_loaded = o.current;
		super.dispatchEvent(o);
	}
	function refreshPane(Void) {
		contentPath = (__scrollContent);
	}
	function _onKeyDown(e) {
		if (((hScroller != undefined) && (__hPosition <= hScroller.maxPos)) && (__hPosition >= hScroller.minPos)) {
			if (e.code == 37) {
				hPosition = hPosition - hLineScrollSize;
			} else if (e.code == 39) {
				hPosition = hPosition + hLineScrollSize;
			}
		}
		if (((vScroller != undefined) && (__vPosition <= vScroller.maxPos)) && (__vPosition >= vScroller.minPos)) {
			if (e.code == 33) {
				vPosition = vPosition - vPageScrollSize;
			} else if (e.code == 34) {
				vPosition = vPosition + vPageScrollSize;
			}
			if (e.code == 40) {
				vPosition = vPosition + vLineScrollSize;
			} else if (e.code == 38) {
				vPosition = vPosition - vLineScrollSize;
			}
		}
		if (e.code == 36) {
			vPosition = vScroller.minPos;
		} else if (e.code == 35) {
			vPosition = vScroller.maxPos;
		}
	}
	static var symbolName = "ScrollPane";
	static var symbolOwner = mx.containers.ScrollPane;
	var className = "ScrollPane";
	static var version = "2.0.2.126";
	var __hScrollPolicy = "auto";
	var __scrollDrag = false;
	var __vLineScrollSize = 5;
	var __hLineScrollSize = 5;
	var __vPageScrollSize = 20;
	var __hPageScrollSize = 20;
	var clipParameters = {contentPath:1, scrollDrag:1, hScrollPolicy:1, vScrollPolicy:1, vLineScrollSize:1, hLineScrollSize:1, vPageScrollSize:1, hPageScrollSize:1};
	static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(mx.containers.ScrollPane.prototype.clipParameters, mx.core.ScrollView.prototype.clipParameters);
	var initializing = true;
}