<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="/js/ckeditor5/sample/styles.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="/js/ckeditor5/build/ckeditor.js"></script>

	
	<title>샘플 페이지</title>
</head>
<style>
	
	*{
		border:1px dashed blueviolet
	}
</style>
<body >
	<div id="app">
		<div class="container">
			<h2>게시판 등록</h2>
			<table class="board_detail">
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<td style="text-align : center;" >제목</td>
					<td><input type="text" id="title" name="title" v-model="title"></td>
				</tr>
				<tr>
					<td colspan="2">
						
						<!-- <textarea id="contents" name="contents" v-model="content"></textarea> -->
					</td>
				</tr>
			</table>

			<main>
							
				<div class="centered">
					<div class="row row-editor">
						<div class="editor-container">
							<div class="editor">
								
							</div>
						</div>
					</div>
				</div>
				
			</main>
			<button @click="" class="btn" style="float: right;">목록으로</button>
			<button @click="fnAddBbs()" class="btn" style="float: right;">저장</button>
		</div>
		
	</div>
</body>
</html>

<script>ClassicEditor
	.create( document.querySelector( '.editor' ), {
		
		licenseKey: '',
		
		
		
		
	} )
	.then( editor => {
		window.editor = editor;

		
		
		
	} )
	.catch( error => {
		console.error( 'Oops, something went wrong!' );
		console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
		console.warn( 'Build id: poh14nld66ba-25nh7lcfw9by' );
		console.error( error );
	} );
</script>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		checkList : [],
		title : "",
		content : "",
		sessionId : "${sessionId}"
    }   
    , methods: {
    	fnAddBbs : function(){
            var self = this;
            var nparmap = {title : self.title, content : self.content, userId:self.sessionId};
           	console.log(nparmap);
            $.ajax({
                url:"/bbs/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다.");
                	// location.href="bbs.do";
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;

	}
});
</script>