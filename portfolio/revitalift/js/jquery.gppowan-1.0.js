/**
 * jQuery.gpPowan 1.0
 * http://ginpen.com/jquery/gppowan/
 * https://github.com/ginpei/jQuery.gpPowan
 *
 * Copyright (c) 2012 Takanashi Ginpei
 * http://ginpen.com
 *
 * Released under the MIT License.
 * http://www.opensource.org/licenses/mit-license.php
 */
;(function($) {
    try {
        if (window.com.ginpen.gpPowan) { return; }
    } catch (e) {}

    if (!window.com) { window.com = {}; }
    if (!com.ginpen) { com.ginpen = {}; }

    var gpPowan = com.ginpen.gpPowan = {
      scales: [-100, 10, 0],
      venderPrevix: getVenderPrefix(),

      exec: function($el, duration, callback) {
        if ($.isFunction(duration)) {
          callback = duration;
          duration = null;
        }

        if (!duration) {
          duration = 1200;
        }

        var interval = duration / this.scales.length;

        this._setTransition($el, interval);
        var deferred = this._animate($el, interval);

        var that = this;
        deferred.done(function() {
          // FIXME: doesnt revert?
          $el.css(that.venderPrevix + 'transition', this._originalTransition || '');
          if ($.isFunction(callback)) {
            callback.apply($el[0]);
          }
        });
      },

      _setTransition: function($el, interval) {
        this._originalTransition = $el.css(this.venderPrevix + 'transition');
        $el.css(this.venderPrevix + 'transition',
            this.venderPrevix + 'transform ' + (interval/1000) + 's');
      },

      _animate: function($el, interval) {
        var deferred = $.Deferred().resolve();
        var scales = this.scales;

        $el.show();

        for (var i = 0, l = scales.length; i < l; i++) {
          var scale = scales[i];
          deferred = this._setScaleLater($el, scale, deferred, interval);
        }

        return deferred;
      },

      _setScaleLater: function($el, scale, deferred, interval) {
        var that = this;
        var nextDeferred = $.Deferred();

        deferred.done(function() {
          that.setScale($el, scale);
          setTimeout(function() {
            nextDeferred.resolve();
          }, interval);
        });

        return nextDeferred;
      },

      setScale: function($el, scale) {
        var realScale = (100 + scale) / 100;
        $el.css(this.venderPrevix + 'transform', 'scale(' + realScale + ')');
      }
    };

    function getVenderPrefix() {
      if ($.browser.webkit) {
        return '-webkit-';
      }
      else if ($.browser.msie) {
        return '-ms-';
      }
      else if ($.browser.mozilla) {
        return '-moz-';
      }
      else if ($.browser.opera) {
        return '-o-';
      }
      else {
        return '';
      }
    }

    // jQuery method interface
    $.fn.gpPowan = function(duragion, callback) {
        return this.each(function(index, el) {
            gpPowan.exec($(el), duragion, callback);
        });
    };
}(jQuery));
