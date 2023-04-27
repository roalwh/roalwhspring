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
		<template v-if="sessionId !=''" >
			<h2>회원정보수정</h2>
			<div class="div2">
				<input @keyup="fnChange" v-model="userlist.id" type="text" class="in" placeholder="아이디" disabled></input>
			</div>
			<div class="div2">
				<input v-model="password1" type="password" class="in" placeholder="비밀번호"></input>
			</div>
			<div class="div2">
				<input v-model="password2" type="password" class="in" placeholder="비밀번호 확인"></input>
			</div>
			<div class="div2">
				<input v-model="userlist.name" type="text" class="in" placeholder="이름"></input>
			</div>
			<div class="div2">
				<input v-model="userlist.nickname" type="text" class="in" placeholder="닉네임"></input>
			</div>
			<div class="div2">
				<input v-model="userlist.age" type="number" class="in" placeholder="나이"></input>
			</div>
			<div class="div2">
				<label>성별 : 
					<select style="width : 100px;" v-model="userlist.gender">
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
				</label>
			</div>
			<div class="div2">
				<label>주소 : 
					<select style="width : 100px;" v-model="userlist.address">
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="제주도">제주도</option>
					</select>
				</label>
			</div>
			<div class="div2">
				<button id="btn" @click="fnTobbs">게시판으로</button>
				<button id="btn" @click="fnUserEdit">정보수정</button>
				
				
			</div>
			</template>
			<!-- -------------------------------------------------------------------- -->
			<template v-else>
			<h2>회원 가입</h2>
			<div class="div2">
				<input @keyup="fnChange" v-model="info.joinId" type="text" class="in" placeholder="아이디" ></input>
				<template v-if="info.joinId != ''">
					<span v-if="loginFlg">사용가능한 아이디</span>
					<span v-else style="color:red;">사용불가</span>
				</template>
			</div>
			<div class="div2">
				<input v-model="info.pwd1" type="password" class="in" placeholder="비밀번호"></input>
			</div>
			<div class="div2">
				<input v-model="info.pwd2" type="password" class="in" placeholder="비밀번호 확인"></input>
			</div>
			<div class="div2">
				<input v-model="info.name" type="text" class="in" placeholder="이름"></input>
			</div>
			<div class="div2">
				<input v-model="info.nick" type="text" class="in" placeholder="닉네임"></input>
			</div>
			<div class="div2">
				<input v-model="info.age" type="number" class="in" placeholder="나이"></input>
			</div>
			<div class="div2">
				<label>성별 : 
					<select style="width : 100px;" v-model="info.gender">
						<option value="M">남자</option>
						<option value="F">여자</option>
					</select>
				</label>
			</div>
			<div class="div2">
				<label>주소 : 
					<select style="width : 100px;" v-model="info.addr">
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="제주도">제주도</option>
					</select>
				</label>
			</div>
			<div class="div2">
				<button id="btn" @click="fnJoin">회원가입</button>
			</div>
			</template>
			
		</div> 
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		info : {
			joinId : "",
			pwd1 : "",
			pwd2 : "",
			name : "",
			nick : "",
			age : "",
			gender : "M",
			addr : "서울"
		}
		, loginFlg : true
		, userlist:{}
		,password1:""
		,password2:""
		, sessionId:"${sessionId}"

    }   
    , methods: {
    	fnJoin : function(){
    		var self = this;
    		if(self.info.joinId == ""){
    			alert("아이디를 입력해라");
    			return;
    		}
    		
    		if(self.info.pwd1 != self.info.pwd2){
    			alert("비밀번호 두개가 다르다");
    			return;
    		}
    		if(self.info.name == ""){
    			alert("이름 입력해라");
    			return;
    		}
    		if(self.info.nick == ""){
    			alert("닉네임 입력해라");
    			return;
    		}
    		if(self.info.age == ""){
    			alert("나이 입력해라");
    			return;
    		}
    		if(!self.loginFlg){
    			alert("아이디 중복체크를 해주세요.");
    			return;
    		}
            var nparmap = self.info;
            $.ajax({
                url:"/user/join.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	location.href="/login.do";
                }
            }); 
    		
    	}
	    , fnCheck : function(){
	    	var self = this;
	    	var nparmap = {id : self.info.joinId};
            $.ajax({
                url:"/user/check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	if(data.cnt > 0){
                		alert("아이디가 이미 존재합니다.");
                	} else {
                		alert("사용 가능한 아이디입니다.");
                		self.loginFlg = true;
                	}
                }
            }); 
	    }
	    , fnChange : function(){
	    	var self = this;
	    	var nparmap = {id : self.info.joinId};
            $.ajax({
                url:"/user/check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	if(data.cnt > 0){
                		self.loginFlg = false;
                	} else {
                		self.loginFlg = true;
                	}
                }
            }); 
	    }
	    , fnUserlist : function(){
	    	var self = this;
	    	var nparmap = {id : self.sessionId};
	    	console.log(nparmap);
            $.ajax({
                url:"/user/userlist.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
					console.log(data.list);
   					self.userlist=data.list
                }
            }); 
	    }
		, fnUserEdit : function(){
			var self = this;
			console.log(self.password1);
			console.log(self.password2);
			if(self.password1 != self.password2){
				alert("비밀번호 확인값이 다릅니다.");
			}else{
				var self = this;
	    		var nparmap = {id : self.userlist.id,password:self.password1,name:self.userlist.name,nickname:self.userlist.nickname,age:self.userlist.age,gender:self.userlist.gender,address:self.userlist.address};
           		 console.log(nparmap);
				$.ajax({
                url:"/user/userEdit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
					alert("완료,로그인창으로!");
					location.href="/login.do";
                	}
				});
			}
			
		}
		, fnTobbs : function(){
			location.href="/bbs.do";
		}

    }   
    , created: function () {
    	var self=this;
    	if("sessionId !=''"){
    		self.fnUserlist();
    	}else{
    	};


	}
});
</script>
