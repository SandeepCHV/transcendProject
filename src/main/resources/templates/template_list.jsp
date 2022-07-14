  
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head> 
    <title>Template Selection</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link th:href="@{/styles.css}" rel="stylesheet" />
    <script type="text/javascript" th:src="@{/js/jquery-3.6.0.js}"></script>
    <script th:inline="javascript">
    	$(document).ready(function(){
    		$('#example').change(function(){
    			var seriesId = $(this).val();
    			$.ajax({
    				url: 'http://localhost:8080/template/getMessage',
                    type:'POST',
                     data:{
                        seriesId:seriesId
                     } ,      
                    success:function(data){
                        
                        var s='';
                        s=s+'<option value="">----Select----</option>';
                        for(var i=0;i<data.length;i++){
                            s+='<option value="'+data[i]+'">'+data[i]+'</option>';
                        }
                        console.log(s)  
                        $('#example2').html(s);
                    } 
    			});
    		});
    		$('#example2').change(function(){
    			var messageId = $(this).val();
    			$.ajax({
    				url: 'http://localhost:8080/template/getTemplate',
                    type:'POST',
                     data:{
                        messageId:messageId
                     } ,      
                    success:function(data){
                        
                        var r='';
                        for(var i=0;i<data.length;i++){
                            r+=data[i];
                        }
                        console.log(r)  
                        $('#text1').html(r);
                    } 
    			});
    		});
    		$('#environment').change(function(){
    			var envname = $(this).val();
    			$.ajax({
    				url: 'http://localhost:8080/template/getQueue',
                    type:'POST',
                     data:{
                        envname:envname
                     } ,      
                    success:function(data){
                        
                        var q='';
                        q=q+'<option value="">----Select----</option>';
                        for(var i=0;i<data.length;i++){
                            q+='<option value="'+data[i]+'">'+data[i]+'</option>';
                        }
                        console.log(q)  
                        $('#queue').html(q);
                    } 
    			});
    		});
    		$('#queue').change(function(){
    			$.ajax({
    				url: 'http://localhost:8080/template/publishMessage',
                    type:'POST',
                    contentType: "application/json",
                    data: JSON.stringify({
                        "source":"Sandeep",
                        "message":$('#text1').val()
                     }) , 
    			});
    		});
    	});
	</script>
	<style>
</style>
</head>
<body>
	
	<div class="box">
        <!-- for initial logo -->
        <div style="left: 100px;">
            <a href="https://www.transcendstreet.com" target="_main"><img
                    src="/logo.JPG"
                    alt="error" width="250px"></a>
		</div>
	</div>
	    <div>


        <form action="" method="post">


            <div class="boxa" style="position:relative; left:40px; top:125px; font-size: larger;text-align: center;">
                <label for="Series">
                    Series
					<select class="form-control" name="example" id="example">
         				<option value="NONE">----Select----</option>
    					<option th:each="seriesNo : ${templateList}" th:value="${seriesNo}"
        					th:text="${seriesNo}">
    					</option>
    				</select>


                </label>
            </div>
            <br>


            <div class="boxb" style="position:relative; left:40px; top:225px;font-size: larger;text-align: center;">
                <label for="Message">
                    Message


                    <select class="form-control" name="example2" id="example2">
         				<option value="NONE">----Select----</option>
    				</select>

                </label>
            </div>




            <div>        
				<textarea id="text1" rows="15" cols="60" text-align:center; placeholder="TEMPLATE"
						style="position:absolute; left:450px; top:180px;"></textarea>
            </div>


           <div class="boxc" style="position:relative; left: 1200px; top:55px;font-size: larger; text-align: center; ">

                    <label for="environment">
                        Environment


                        <select name="environment" id="environment">
                            <option value="NONE">---Select---</option>
    						<option th:each="envname : ${envList}" th:value="${envname}"
        					th:text="${envname}">
    						</option>
                        </select>



                    </label>
                </div>



            <div class="boxd" style="position:relative; left: 1200px; top:167px;font-size: larger;text-align: center;">
            <label for="queue">
                Queue


                <select name="queue" id="queue">
                	<option value="NONE">----Select----</option>
                </select>



            </label>
            </div>
			<h1>
                <div style="position: relative; left:600px; top:240px; ">
                    <input type="button" class="button" id="btnShowMsg" value="SUBMIT" />
                    
                </div>

            </h1>
        </form>
    </div>
</body>
</html>