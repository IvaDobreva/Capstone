// bird.dom 모듈 구현.
// 클릭 이벤트와 관련된 binding 함수도 여기서 구현해서 쓰자.
bird.dom = (function() {
  var $ = Sizzle;

  function hasClass(el, clsName) {
      var regex = new RegExp("(^|\\s)" + clsName + "(\\s|$)");
      return regex.test(el.className);
  }

  function addClass(el, clsName) {
      if (!hasClass(el, clsName)) {
          el.className += " " + clsName;
      }
  }

  function removeClass(el, clsName) {
      var regex = new RegExp("(^|\\s)" + clsName + "(\\s|$)");
      el.className = el.className.replace(regex, " ");
  }

  function bind(element, event, handler) {
    if(typeof element == "string") {
      element = $(element)[0];
    }
    element.addEventListener(event, handler, false);
  }


  return {
    $ : $,
    hasClass : hasClass,
    addClass : addClass,
    removeClass : removeClass,
    bind : bind
  };

})();
