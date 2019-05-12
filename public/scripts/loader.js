// 게임에서 쓰이는 변수들. 변화 없는 것들.
var bird = {
  screens : {}, // 각각 화면들을 캡슐화해서 담아줄 객체.
  settings : {
    baseScore : 100,
    imageSize : 100,
  },
  images : {

  },
};

// 현재 문서가 완전히 로드될때까지 기다린다.
window.addEventListener("load", () => {

  // 이미지의 크기를 결정한다.
  var imageProto = document.getElementById("image-proto"); // Id를 통해서 요소를 가져온다.
  var rect = imageProto.getBoundingClientRect(); // imageProto 요소의 위치와 크기를 받아온다.
  bird.settings.imageSize = rect.width; // 이미지의 크기를 imageSize에 저장해준다.

  // 동적 로딩 시작.
  Modernizr.load([
    {
      // 항상 로드되는 파일들
      load: [
        "scripts/sizzle.js",
        "scripts/dom.js",
        "scripts/game.js", //시작할때 game.js 로드된다.
        "scripts/screen.splash.js",
        "scripts/screen.main-menu.js",
        "scripts/screen.ranking.js",
        "scripts/screen.game.js",

        "scripts/board.js",
        "scripts/display.canvas.js",
      ],

      // 모든 파일의 로드 및 실행이 완료되면 호출된다.
      // bird.game 모듈에 선언된 showScreen 함수를 이용하여, splash-screen만 보여주게 힌다.
      complete: () => {
        console.log("모든 파일이 로드되었습니다.")

        // 가장 처음에는 스플래시 화면 보이게 한다.
        bird.game.showScreen("splash-screen");
      }
    }
  ]);

  // 스테이지 2 로드 : 스테이지 2는 어떤 이벤트가 있어야 로드 되는 것일까.......????????
  if (Modernizr.standalone) {
    Modernizr.load([
      {
        load: [
          "scripts/screen.main-menu.js",
          "scripts/screen.game.js",
          "scripts/board.js",
          "scripts/display.canvas.js",
        ],

        complete: () => {
          console.log("스테이지2가 로드되었습니다.")
          // 스플래시 화면 보이게 한다.
          //bird.game.showScreen("splash-screen");

        }

      }
    ]);
  }

}, false);
