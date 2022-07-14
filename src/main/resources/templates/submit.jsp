<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <title>Message section</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" th:src="@{/js/jquery-3.6.0.js}"></script>
    <style>
       
        .container{
            width: 100%;
            height: 100%;
            background-color: rgb(49, 49, 197);
            padding: 20px;
        }
        
        textarea {
        resize: none;
      }
    </style>
    <body>

        <div class="container" >
        	<textarea id="text1" rows="15" cols="60" text-align:center; placeholder="TEMPLATE"
						style="position:absolute; left:450px; top:180px;" name ="template">
            <p th:text="${message}"></p>
            </textarea>
        </div>
    </body>
</html>