<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<!-- 페이징 추가 1-->
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>첫번째 페이지</title>
</head>
<style>
	<!-- 페이징 추가 2-->
	.pagination {
        margin:24px;
        display: inline-flex;
        
    }
    ul {
        text-align: center;
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	}
</style>
<body>
	<div id="app">
		<div class="container">
			<label>검색어 : <input type="text" v-model="keyword"></label>
			<select v-model="selectItem">
				<option value="">:: 전체 ::</option>
				<option value="1">공지사항</option>
				<option value="3">자유게시판</option>
			</select>
			<button class="btn" @click="fnGetList">검색</button>
			<div class="table-list">
	            <table class="board_list">                   
	                <thead>
	                    <tr>            
	                   <!-- <th scope="col"></th>       -->          
	                        <th scope="col">No.</th>
	                        <th scope="col">제목</th>
	                        <th scope="col">작성자</th>
	                        <th scope="col">작성일</th>
	                        <th scope="col">조회수</th>
	                        <th scope="col"></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr v-for="(item, index) in list" > 
	                   <!-- <td><input type="checkbox" v-bind:value = "item" v-model="checkList"></td> -->                 
	                        <td>{{index + 1}}</td> 
	                        <td @click="fnView(item.boardNo)"><a href="javascript:;">{{item.title}}</a></td>
	                        <td>{{item.id}}</td>
	                        <td>{{item.cdatetime}}</td>     
	                        <td>{{item.cnt}}</td>     
	                        <td><button v-if="item.id == sessionId || sessionStatus == 'A'" class="btn" @click="fnRemove(item.boardNo)">삭제</button></td>  
	                    </tr>                                       
	                </tbody>                   
	            </table>
	            <!-- 페이징 추가 3-->
				<template>
				  <paginate
				    :page-count="pageCount"
				    :page-range="3"
				    :margin-pages="2"
				    :click-handler="fnSearch"
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				  </paginate>
				</template>
	        </div>
	        <div>
	        	<button class="btn">삭제</button>
	        	<button class="btn" @click="fnAdd">등록</button>
	        </div>
	     </div>
	</div>
</body>
</html>
<script type="text/javascript">
<!-- 페이징 추가 4-->
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		checkList : [],
		keyword : "",
		selectItem : "",
		sessionId : "${sessionId}",
		sessionStatus : "${sessionStatus}",
			<!-- 페이징 추가 5-->
		selectPage: 1,
		pageCount: 1,
		cnt : 0
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            <!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 10);
    		var lastNum = (self.selectPage * 10) + 1
            var nparmap = {keyword : self.keyword, kind : self.selectItem, startNum : startNum, lastNum : lastNum};
            $.ajax({
                url:"/bbs/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
	                self.list = data.list;
	                self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
                }
            }); 
        } 
	    <!-- 페이징 추가 7-->
		, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = (pageNum * 10) + 1;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/bbs/list.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 10);
				}
			});
		}
    	, fnAdd : function(){
    		location.href = "insert.do";
    	}
    	, fnRemove : function(boardNo){
    		 var self = this;
    		 if(!confirm("정말 삭제하시겠습니까?")){
    			 return;
    		 }
             var nparmap = {boradKey : boardNo};
             $.ajax({
                 url:"/bbs/remove.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
                	alert("삭제되었습니다.");
 	                self.fnGetList();
                 }
             }); 
    	}
    	
    	, pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
    		//	this.linkCall(url);
    			return;
    		}
    		var form = document.createElement("form"); 
    		form.name = "dataform";
    		form.action = url;
    		form.method = "post";
    		form.target = target;
    		for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
    		document.body.appendChild(form);
    		form.submit();
    		document.body.removeChild(form);
    	}
    	
    	, fnView : function(boardNo){
    		var self = this;
    		self.pageChange("./read.do", {boardNo : boardNo});
    	}
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();

	}
});
</script>