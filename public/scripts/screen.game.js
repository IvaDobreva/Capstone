// 게임화면 모듈
bird.screens["game-screen"] = (function () {
  // 모듈들을 불러와서 변수에 넣어준다 : 아마 쉽게 쓰려고?
  var board = bird.board; // 게임판 세팅
  var display = bird.display; // 그림 세팅
  var firstRun = true;
  var dom = bird.dom;


  var count = 0; //Counting number of words
  var cards = []; //Here list of answerd images will be kept
  var answers = []; //Available answers
  var uansw = []; //Answerd by the user
  var uansBool = []; //정답 = 1 오답 =0
  var curr_score = 0; //current score


  function answerCheck() {
    var ansFlag = false;

    //check if the answer is right
    var answer = $('#answer').val();
    uansw.push(answer);
    for(var i=0; i < answers.length; i++) {
      if(answer == answers[i]) {
        curr_score += 1;
        ansFlag = true;
        break;
      }
    }
    if(ansFlag == true ) {
      uansBool.push(1);
    } else {
      uansBool.push(0);
    }

    $('#answer').val(''); //Clear input field
    if(count == 10 ) {
      console.log(curr_score);
      $.post('/game/score',  {score: curr_score,
                              hisImage: cards.toString(),
                              hisAnswer: uansw.toString(),
                              hisAnsBool: uansBool.toString()},
          function(result) {
            console.log(result['status']);
            if(result['status'] == "success") {
              window.location = "/game/score";
            }
          });
    }
  }

  function GetImage() {
    $.get("/game/getImage")
      .done(function(data) {
        $("#quiz-image").attr("src",data['image']);
        $("#counter").replaceWith("<h3 id=\'counter\'> Quiz : " + count + "/10</h3>");
        count = count + 1;
        answers = data['kor'];
        cards.push(data['id']);

      });
  }



  // 1. 'Keypress Enter' event
  $("#answer").keypress(function(key) {

    if(key.keyCode == 13){
      console.log( $('#answer').val() );

      answerCheck();
      GetImage();
      gameState.timer=10;
    }
  });

  // 2. 'Click' event
  $('#next_btn').click(function(data){

    answerCheck();
    GetImage();
    gameState.timer= 10;
  });

  function startGame() {
    gameState = {
      level : 0,
      score : 0,
      timer : 10, // Gaming time of one image
      startTime : 0, // 현재 레벨을 시작한 시간.
      endTime : 0, // 게임이 종료될 때까지의 시간.
    };
  }

  function updateTimer() {
    gameState.timer = gameState.timer - 1;
    var progress = $("#game-screen .time .indicator")[0];
    progress.style.width = gameState.timer + "%";

    if(progress.style.width === "0%"){
      run();
    }
  }

  // Timer function
  function timer() {

    gameState.timer = gameState.timer - 1;
    $("#timer").replaceWith("<h2 id=\'timer\'> Left : " + gameState.timer + "</h2>");

    if(gameState.timer === 0) {
      // Empty value and wrong answer passed to the lists
      uansw.push("");
      uansBool.push(0);

      var ansFlag = false;
      GetImage();
      if(count == 10 ) {

        $.post('/game/score',  {score: curr_score,
                                hisImage: cards.toString(),
                                hisAnswer: uansw.toString(),
                                hisAnsBool: uansBool.toString()},
            function(result) {
              console.log(result['status']);
              if(result['status'] == "success") {
                window.location = "/game/score";
              }
            });
      }

      $('#answer').val(''); //Clear input field
      gameState.timer = 10;
      $("#timer").replaceWith("<h2 id=\'timer\'> Left : " + gameState.timer + "</h2>");

    }

  }

  function run() {

    // Initialize game setting $ varible
    startGame();
    GetImage();
    // Timer function call
    $("#timer").replaceWith("<h2 id=\'timer\'> Left : " + gameState.timer + "</h2>");
    setInterval(timer, 1000);
  }

  return {
    run : run
  };

})();
