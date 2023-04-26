<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		안녕하세요.asdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		info : {},
		subList : []
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/student/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
                }
            }); 
        } 
	    , fnGetInfo : function(){
	        var self = this;
	        var nparmap = {stuNo : "20153075 "};
	        $.ajax({
	            url:"/student/info.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                console.log(data);
	            	self.info = data.info;
	            }
	        }); 
	    }
	    , fnSubList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/student/sublist.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.subList = data.list;
	                console.log(self.subList);
                }
            }); 
        } 

    }   
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
    	self.fnSubList();

	}
});
</script>