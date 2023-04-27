<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>마이페이지</title>
		<style>
	        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #1BBC9B;
	        }
	
	        .div1 {
	            margin: auto;
				margin-top: 10%;
	            width: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	        }
	         .div2 {
	            margin: auto;
	            width: 250px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 10px;
	        }
	
	        input {
	            width: 100%;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 5px;
	            border: none;
	        }
	
	        .in {
	            margin-bottom: 10px;
	        }
	
	        #btn {
	            background-color: #1BBC9B;
	            margin-bottom: 30px;
	            color: white;
	        }
	
	        a {
	            text-decoration: none;
	            color: #9B9B9B;
	            font-size: 12px;
	        }
    	</style>
	</head>
	<body>
		<div id="app" class="div1">
			<h2>마이페이지</h2>
			<div class="div2">
				<input v-model="sessionId" type="text" class="in" placeholder="아이디" disabled></input>
			</div>

			<div class="div2">
				<input v-model="passwd" type="password" class="in" placeholder="비밀번호 확인"></input>
			</div>
			<div class="div2">
				<button id="btn" @click="fnJoin">확인</button>
			</div>
			</div>
			
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	sessionId:"${sessionId}",
		passwd:"",
		passcnkflg:""

    }   
    , methods: {
    	fnJoin : function(){
            var self = this;
            var nparmap = {id : self.sessionId, password:self.passwd};
            console.log(nparmap);
            $.ajax({
                url:"/bbs/mypage.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	console.log(data);
                	self.passcnkflg = data.passcnkflg
					console.log(self.passcnkflg);
                	if(self.passcnkflg=="1"){
                		alert("성공")
    	           		location.href="/join.do";
                	}else{
						alert("패스워드가 다릅니다.")
					}
                }
            }); 
        }

    }   
    , created: function () {
    
	}
});
</script>
