  
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
                        s=s+'<option value="">---- Select ----</option>';
                        for(var i=0;i<data.length;i++){
                            s+='<option value="'+data[i]+'">'+data[i]+'</option>';
                        }
                        console.log(s)  
                        $('#example2').html(s);
                    } 
    			});
    		});
    	});
	</script>
	<style>

::placeholder{

color: rgb(224,232,254);

font-size: 50px;

}    
.boxa{
width: 210px;
height: 40px;
background-color: rgb(247,100,58);
opacity: 1;
}

.boxb{
width: 210px;
height: 40px;
background-color: rgb(247,100,58);
opacity: 1;
}
.boxc{
width: 210px;
height: 40px;
background-color: rgb(247,100,58);
opacity: 1;
}
.boxd{
width: 210px;
height: 40px;
background-color: rgb(247,100,58);
opacity: 1;
}



.button {
  background-color: rgb(247,100,58);
  border: none;
  color: white;
  padding: 15px 32px;
  
  text-decoration: none;
  display: inline-block;

  margin: 4px 2px;
  cursor: pointer;
}

textarea {
        resize: none;
      }
</style>
</head>
<body>
	<div class="boxa"  style="position:absolute; left:30px; top:190px;"></div>

	<div class="boxb"  style="position:absolute; left:30px; top:290px;"></div>

	<div class="boxc"  style="position:absolute; right:100px; top:190px;"></div>
	
	<div class="boxd"  style="position:absolute; right:100px; top:290px;"></div>
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


            <div style="position:absolute; left:40px; top:200px; larger;">
                <label for="Series">
                    Series&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<select class="form-control" name="example" id="example">
         				<option value="NONE">----Select----</option>
    					<option th:each="seriesNo : ${templateList}" th:value="${seriesNo}"
        					th:text="${seriesNo}">
    					</option>
    				</select>


                </label>
            </div>
            <br>


            <div style="position:absolute; left:40px; top:300px;">
                <label for="Message">
                    Message


                    <select class="form-control" name="example2" id="example2">
         				<option value="NONE">----Select----</option>
    				</select>

                </label>
            </div>




            <div>
                 
                        
<textarea rows="15" cols="60" placeholder="            

    TEMPLATE"

   

   

   

   

    style="position:absolute; left:450px; top:180px;"></textarea>
                </div>


           <div style="position:absolute; right:150px; top:205px; ">

                    <label for="environment">
                        Environment


                        <select name="environment" id="environment">
                            <option value="A300">A300</option>
                            <option value="B200">B200</option>
                            <option value="C250">C250</option>
                        </select>



                    </label>
                </div>



            <div style="position:absolute; right:150px; top:300px;">
            <label for="queue">
                Queue


                <select name="queue" id="queue">

                    <option value="cash">cash</option>
                    <option value="cheque">cheque</option>
                    <option value="jaadu">jaadu</option>
                </select>



            </label>
            </div>
			<h1>
                <div style="position: absolute; right:800px; top:510px; ">
                    <input type="button" class="button" id="btnShowMsg" value="SUBMIT" />
                    
                </div>

            </h1>
        </form>
    </div>
</body>
</html>