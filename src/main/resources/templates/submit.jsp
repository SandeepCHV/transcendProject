<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
    <title>Message section</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" th:src="@{/js/jquery-3.6.0.js}"></script>
    <style>
        .card{
            width: 100%;
            height: 100%;
        }
        html,body
            {
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
        }
        textarea {
        resize: none;
      }
      .button {
  background-color: rgb(247,100,58);
  border: none;
  color: white;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
      
    </style>
    <body>
           <h1 > <center>Edited Template</center> </h1>
    <div class="card" >
            <textarea id="text1" rows="30" cols="120" text-align:center; placeholder="TEMPLATE"
                style="position:absolute; left:350px; top:180px;" name ="template" readonly 
                        th:text="${message}" >
            </textarea>
        </div>
        <div class="back" style="position: absolute; left:750px; bottom:85px;  ">
        <a href="http://localhost:8080/template">
                    <input type="submit" class="button" id="btnShowMsg" value="Go Back" />
                    </a>
    </body>
</html>

