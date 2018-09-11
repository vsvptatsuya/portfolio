/**
 * iParallax
 * lastupdate: 2012/12/25
 **/
(function(window) {
	if (!window.requestAnimationFrame) {
		window.requestAnimationFrame = (function(){
			return window.webkitRequestAnimationFrame ||
				window.mozRequestAnimationFrame ||
				window.oRequestAnimationFrame ||
				window.msRequestAnimationFrame ||
				function(callback, element){ return window.setTimeout(callback, 1000 / 60); };
		})();
		window.cancelRequestAnimationFrame = (function() {
			return window.webkitCancelRequestAnimationFrame ||
				window.mozCancelRequestAnimationFrame ||
				window.msCancelRequestAnimationFrame ||
				window.oCancelRequestAnimationFrame ||
				function(id) { window.clearTimeout(id); };
		})();
	}

	var iParallax = function(container,option) {
		var self = this;
		this.DefaultSetting = {
			frame: 60,
			maxX: NaN,
			maxY: NaN,
			friction: 0.25,
			bounce: true,
			inertiaTime: 100,
			inertia: 5,
			onScroll: function(x,y){},
			onResize: function(x,y){}
		};
		this.setting = {};
		this.setOption(option);
		this.support3d = (typeof WebKitCSSMatrix != 'undefined' && new WebKitCSSMatrix().hasOwnProperty('m41'));
		this.touchData = {
			x: 0,
			y: 0,
			distX: 0,
			distY: 0,
			count: 0,
			time: 0
		};
		this.objects = [];
		this.animation = {};
		this.frame = this.setting.frame;
		this.timer = null;
		this.count = 0;
		this.container = container;
		this.wrap = this.container.parentNode;

		this.touchStartHandler = function(e) {
			self.touchStart(e);
		};
		this.touchMoveHandler = function(e) {
			self.touchMove(e);
		};
		this.touchEndHandler = function(e) {
			self.touchEnd(e);
		};
		this.wheelHandler = function(e) {
			self.wheel(e);
		};
		this.loopHandler = function() {
			self.doAnimation();
		};
		this.resizeHandler = function(e) {
			self.resize(e);
		};
		this.init();
	};
	iParallax.prototype = {
		init: function() {
			this.wrap.style.overflow = "hidden";
			var pos = this.getCurrentPosition();
			this.x = pos.x;
			this.y = pos.y;
			this.addTouchEvent();
			this.step();
		},
		setOption: function(option) {
			for (var key in this.DefaultSetting) {
				if (option && option[key] !== undefined) {
					this.setting[key] = option[key];
				} else {
					this.setting[key] = this.DefaultSetting[key];
				}
			}
			return this.setting;
		},
		updateOption: function(option) {
			for (var key in option) {
				this.setting[key] = option[key];
			}
		},
		addTouchEvent: function() {
			var p = this.container.parentNode;
			p.addEventListener("touchstart", this.touchStartHandler);
			p.addEventListener("touchmove", this.touchMoveHandler);
			p.addEventListener("touchend", this.touchEndHandler);
			window.addEventListener('resize', this.resizeHandler);
			this.addMouseEvent();
		},
		addMouseEvent: function() {
			var p = this.container.parentNode;
			p.addEventListener("mousedown", this.touchStartHandler);
			p.addEventListener("mousemove", this.touchMoveHandler);
			p.addEventListener("mouseup", this.touchEndHandler);
			window.addEventListener('DOMMouseScroll', this.wheelHandler);
			window.addEventListener('mousewheel', this.wheelHandler);
		},
		removeTouchEvent: function() {
			var p = this.container.parentNode;
			p.removeEventListener("touchstart", this.touchStartHandler);
			p.removeEventListener("touchmove", this.touchMoveHandler);
			p.removeEventListener("touchend", this.touchEndHandler);
			window.removeEventListener('resize', this.resizeHandler);
		},
		removeMouseEvent: function() {
			var p = this.container.parentNode;
			p.removeEventListener("mousedown", this.touchStartHandler);
			p.removeEventListener("mousemove", this.touchMoveHandler);
			p.removeEventListener("mouseup", this.touchEndHandler);
			window.removeEventListener('DOMMouseScroll', this.wheelHandler);
			window.removeEventListener('mousewheel', this.wheelHandler);
		},
		getHeight: function() {
			return this.container.scrollHeight - this.container.clientHeight;
		},
		getWidth: function() {
			return this.container.scrollWidth - this.container.clientWidth;
		},
		getOffset: function(e) {
			if (e.touches) {
				var touch = e.targetTouches[0];
				return {
					left: touch.clientX - this.wrap.offsetLeft,
					top: touch.clientY - this.wrap.offsetTop
				};
			} else {
				return {
					left: e.clientX - this.wrap.offsetLeft,
					top: e.clientY - this.wrap.offsetTop
				};
			}
		},
		getTranslate: function(x,y,unit) {
			if (!unit) {
				unit = "";
			}
			if (this.support3d) {
				return "translate3d("+x+unit+"," + y + unit +",0)";
			}
			return "translate("+x+unit+"," + y + unit + ")";
		},
		getCurrentPosition: function() {
			var pos = {x:0,y:0};
			var matrix = window.getComputedStyle(this.container)['webkitTransform'];
			if (matrix !== "none") {
				matrix = matrix.replace(/[^0-9-.,]/g, '').split(',');
				pos.x = -parseFloat(matrix[4]);
				pos.y = -parseFloat(matrix[5]);
			}
			return pos;
		},
		getScrollLimit: function() {
			var limit = {
				x: this.setting.maxX,
				y: this.setting.maxY
			};
			if (isNaN(limit.x)) {
				limit.x = this.getWidth();
			}
			if (isNaN(limit.y)) {
				limit.y = this.getHeight();
			}
			return limit;
		},
		touchStart: function(e) {
			//e.preventDefault();
			this.stop();
			var offset = this.getOffset(e);
			this.touchData.x = offset.left;
			this.touchData.y = offset.top;
			var pos = this.getCurrentPosition();
			this.x = pos.x;
			this.y = pos.y;
			if (e.touches) {
				this.removeMouseEvent();
				this.touchData.count = e.touches.length;
			} else {
				this.touchData.count = 1;
			}
		},
		touchMove: function(e) {
			e.preventDefault();
			if (this.touchData.count === 1) {
				this.touchData.time = (new Date()).getTime();
				var offset = this.getOffset(e);
				var x = offset.left;
				var y = offset.top;
				this.touchData.distX = (this.touchData.x -x ) * 1;
				this.touchData.distY = (this.touchData.y - y) * 1;

				this.moveBy(this.touchData.distX,this.touchData.distY);

				this.touchData.x = x;
				this.touchData.y = y;
			}
		},
		touchEnd: function(e) {
			//e.preventDefault();
			if (this.touchData.count === 1) {
				var interval = (new Date()).getTime() - this.touchData.time;
				if (interval < this.setting.inertiaTime) {
					var it = (this.setting.inertiaTime - interval) / 100;
					var x = this.touchData.distX * (1.0 + it) * this.setting.inertia;
					var y = this.touchData.distY * (1.0 + it) * this.setting.inertia;
					this.animate(this.x+x,this.y+y);
				} else {
					this.move(this.x,this.y,true);
				}
			}
			this.touchData.count = 0;
		},
		wheel: function(e) {
			e.preventDefault();
			this.stop();
			var deltaX = 0;
			var deltaY = 0;
			if (e.delta) {
				deltaY = e.detail/3;
			} else {
				if (e.wheelDeltaX) {
					deltaY = e.wheelDeltaY/3;
					deltaX = e.wheelDeltaX/3;
				} else {
					deltaY  = e.wheelDelta/3;
				}
			}
			var x = this.x;
			var y = this.y;
			var limit = this.getScrollLimit();

			if (this.x - deltaX < 0) {
				x = 0;
			} else if (this.x - deltaX > limit.x) {
				x = limit.x;
			} else {
				x -= deltaX;
			}

			if (this.y - deltaY < 0) {
				y = 0;
			} else if (this.y - deltaY > limit.y) {
				y = limit.y;
			} else {
				y -= deltaY;
			}
			this.move(x,y);
		},
		move: function(x,y,bounce) {
			if (bounce) {
				var overX = 0;
				var overY = 0;
				var limit = this.getScrollLimit();
				if (x < 0) {
					overX = x;
				} else if (x > limit.x) {
					overX= x-limit.x;
				}
				if (y < 0) {
					overY = y;
				} else if (y > limit.y) {
					overY = y - limit.y;
				}

				if (overX === 0 && overY === 0) {
					this.x = x;
					this.y = y;
				} else {
					this.animate(this.x-overX,this.y-overY);
				}
			} else {
				this.x = x;
				this.y = y;
			}
			this.step();
		},
		moveBy: function(x,y,bounce) {
			if (!bounce) {
				var limit = this.getScrollLimit();
				if (limit.x > 0) {
					if (this.x+x < 0 || this.x + x > limit.x) {
						if (this.setting.bounce) {
							x *= this.setting.friction;
						}  else {
							x = 0;
						}
					}
				} else {
					x = 0;
				}
				if (limit.y) {
					if (this.y + y < 0 || this.y + y > limit.y) {
						if (this.setting.bounce) {
							y *= this.setting.friction;
						} else {
							y = 0;
						}
					}
				} else {
					y = 0;
				}
			}
			this.move(this.x+x,this.y+y,bounce);
		},
		animate: function(x,y,time) {
			this.stop();
			var limit = this.getScrollLimit();
			if (limit.x === 0) {
				x = 0;
			}
			if (limit.y === 0) {
				y = 0;
			}
			if (time) {
				this.frame = time / 16;
			} else {
				this.frame = this.setting.frame;
			}
			this.animation = {
				x1: this.x,
				y1: this.y,
				x2: x,
				y2: y,
				limit: limit
			};
			this.doAnimation();
		},
		easing: function(t, b, c, d) {
			return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
			//return c*((t=t/d-1)*t*t + 1) + b;
		},
		doAnimation: function() {
			if(this.count < this.frame){
				this.timer = window.requestAnimationFrame(this.loopHandler);
				var x = parseInt(this.easing(this.count,this.animation.x1,this.animation.x2-this.animation.x1,this.frame));
				var y = parseInt(this.easing(this.count,this.animation.y1,this.animation.y2-this.animation.y1,this.frame));

				var overX = 0;
				var overY = 0;
				if (x < 0) {
					overX = x;
				} else if (x > this.animation.limit.x) {
					overX= x - this.animation.limit.x;
				}
				if (y < 0) {
					overY = y;
				} else if (y > this.animation.limit.y) {
					overY = y - this.animation.limit.y;
				}
				if (this.setting.bounce) {
					if (overX !== 0) {
						x -=  overX*this.setting.friction;
						this.count = this.frame;
					}
					if (overY !== 0) {
						y -=  overY*this.setting.friction;
						this.count = this.frame;
					}
				}
				this.move(x,y);
				this.count++;
			} else {
				this.moveBy(0,0,true);
			}
		},
		stop: function() {
			this.step();
			window.cancelRequestAnimationFrame(this.timer);
			this.count = 0;
		},
		step: function() {
			this.container.style.webkitTransform = this.getTranslate(-this.x,-this.y,"px");
			if (this.setting.onScroll) {
				this.setting.onScroll.apply(this,[this.x,this.y]);
			}
			this.objectScroll(this.x,this.y);
		},
		objectScroll: function() {
			for (var id in this.objects) {
				var obj = this.objects[id];
				obj.scroll(this.x,this.y);
			}
		},
		addObject: function(id,para) {
			this.objects[id] = para;
			this.objectScroll(this.x,this.y);
		},
		getObject: function(id) {
			return this.objects[id];
		},
		removeObject: function(id) {
			var obj = this.objects[id];
			obj.destory();
			obj = null;
			delete this.objects[id];
		},
		removeAllObject: function() {
			for (var id in this.objects) {
				this.removeObject(id);
			}
		},
		resize: function(e) {
			if (this.setting.onResize) {
				this.setting.onResize.apply(this,[this.x,this.y]);
			}
			this.move(this.x,this.y,true);
		}
	};
	var iParallaxObject = function(elm) {
		this._elm = elm;
		this._start = {x:0,y:0};
		this._end = {x:0,y:0};
		this._callbacks = {};
	};
	iParallaxObject.prototype = {
		setStart: function(val) {
			if (typeof val === "string") {
				this._start.x = val;
				this._start.y = val;
			} else {
				if (val.x) {
					this._start.x = val.x;
				}
				if (val.y) {
					this._start.y = val.y;
				}
			}
		},
		setEnd: function(val) {
			if (typeof val === "string") {
				this._end.x = val;
				this._end.y = val;
			} else {
				if (val.x) {
					this._end.x = val.x;
				}
				if (val.y) {
					this._end.y = val.y;
				}
			}
		},
		setCallback: function(callbacks) {
			for (var key in callbacks) {
				this._callbacks[key] = callbacks[key];
			}
		},
		_isBefore: function(x,y) {
			if (x <= this._start.x && y <= this._start.y) {
				return true;
			}
			return false;
		},
		_isAfter: function(x,y) {
			if (x >= this._end.x && y >= this._end.y) {
				return true;
			}
			return false;
		},
		_isDuring: function(x,y) {
			if (x >= this._start.x && y >= this._start.y && x <= this._end.x && y <= this._end.y) {
				return true;
			}
			return false;
		},
		destroy: function() {
			this._elm = null;
			this._start = null;
			this._end = null;
			this._callbacks = null;
		},
		scroll: function(x,y) {
			if (this._isBefore(x,y) && this._callbacks.before) {
				this._callbacks.before.apply(this._elm,[x,y]);
			} else if (this._isAfter(x,y) && this._callbacks.after) {
				this._callbacks.after.apply(this._elm,[x,y]);
			} else if (this._isDuring(x,y) && this._callbacks.during) {
				var sx = (x - this._start.x) / (this._end.x - this._start.x) * 100;
				var sy = (y - this._start.y)/ (this._end.y - this._start.y) * 100;
				if (isNaN(sx)) {
					sx = 0;
				}
				if (isNaN(sy)) {
					sy = 0;
				}
				this._callbacks.during.apply(this._elm,[x,y,sx,sy]);
			}
		}
	};
	if (!window.iParallax) {
		window.iParallax = iParallax;
	}
	if (!window.iParallaxObject) {
		window.iParallaxObject = iParallaxObject;
	}
})(this);