<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>테스트</title>
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
			<h2>회원 가입</h2>
			<div class="div2">
				<input type="text" class="in" placeholder="아이디"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호 확인"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="이름"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="닉네임"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="나이"></input>
			</div>
			<div class="div2">
				<label>성별 : 
					<select style="width : 100px;">
						<option>남자</option>
						<option>여자</option>
					</select>
				</label>
			</div>
			<div class="div2">
				<label>주소 : 
					<select style="width : 100px;">
						<option>서울</option>
						<option>인천</option>
						<option>제주도</option>
					</select>
				</label>
			</div>
			<div class="div2">
				<button id="btn" >회원가입</button>
			</div>
		</div> 
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {

    }   
    , methods: {
    	fnJoin : function(){
    		
    	}
    }   
    , created: function () {
    
	}
});
</script>
