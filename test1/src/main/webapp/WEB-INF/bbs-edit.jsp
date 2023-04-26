<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<title>샘플 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<h2>게시판 수정</h2>
			<table class="board_detail">
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<td style="text-align : center;" >제목</td>
					<td><input type="text" id="title" name="title" v-model="info.title"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="contents" name="contents" v-model="info.content"></textarea>
					</td>
				</tr>
			</table>
			<button @click="" class="btn" style="float: right;">목록으로</button>
			<button @click="fnEditBbs" class="btn" style="float: right;">수정</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		info : {},
		boardNo : "${map.boardNo}"
    }   
    , methods: {
    	fnEditBbs : function(){
            var self = this;
            var nparmap = {title : self.info.title
            				, content : self.info.content
            				, boardNo : self.boardNo};
            /* var nparmap = self.info;
            nparmap.boardNo = self.boardNo; */
            $.ajax({
                url:"/bbs/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	location.href="bbs.do";
                }
            }); 
        }
	    , fnGetBoard : function(){
	        var self = this;
	        var nparmap = {boardNo : self.boardNo};
	        $.ajax({
	            url:"/bbs/read.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {
	                self.info = data.info;
	                console.log(self.info);
	            }
	        }); 
	    }
    }   
    , created: function () {
    	var self = this;
    	self.fnGetBoard();

	}
});
</script>