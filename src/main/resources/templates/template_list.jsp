  
<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head> 
    <title>Template Selection</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link th:href="@{/styles.css}" rel="stylesheet" />
    <script type="text/javascript" th:src="@{/js/jquery-3.6.0.js}"></script>
    <script th:inline="javascript">
    	$(document).ready(function(){
    		$('#example').change(function(){
    			var seriesId = $(this).val();
    			alert(seriesId);
    		});
    	});
	</script>
</head>
<body>
	<div>
        <a href="https://www.transcendstreet.com" target="_main"><img
                src="https://www.transcendstreet.com/wp-content/uploads/2020/09/Transcend-Logo-PNG-1000x500-1.png"
                alt="error" width="250px"></a>
	</div>
	    <div>


        <form action="">


            <div style="position:absolute; left:40px; top:200px;">
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


            <div style="position:absolute; left:32px; top:300px;">
                <label for="Message">
                    Message


                    <select class="form-control" name="example2" id="example2">
         				<option value="NONE">----Select----</option>
    					<option th:each="messageNo : ${messageList}" th:value="${messageNo}"
        					th:text="${messageNo}">
    					</option>
    				</select>

                </label>
            </div>




            <div style="position:relative; left:450px; top:20px;">
                <label for="Template">Template
                    <textarea style="overflow:auto;resize:none" name="Template" id="Template" cols="30" rows="10">

                     </textarea>
                </label>
            </div>


           <div  style="position:relative; left:1000px; top:-118px; ">

            <label for="environment">
                Environment


                <select name="environment" id="environment">

                    <option value="JD">JD</option>
                    <option value="RC">RC</option>
                    <option value="RS">RS</option>
                </select>



            </label>
             </div>



            <div style="position:absolute; left:1010px; top:300px;">
            <label for="queue">
                Queue


                <select name="queue" id="queue">

                    <option value="cash">cash</option>
                    <option value="cheque">cheque</option>
                    <option value="jaadu">jaadu</option>
                </select>



            </label>
            </div>
			<input type="submit">
        </form>
    </div>
 <div class="container">
  <table class="table table-striped">
   <thead class="thead-dark">
    <th scope="row">ID</th>
    <th scope="row">Series Number</th>
    <th scope="row">Message Number</th>
    <th scope="row">Template</th>
    <th scope="row">Template Name</th>
   </thead>
  </table>
 </div>
</body>
</html>