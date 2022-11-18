<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <%@include file="all_js_css.jsp" %> 
</head>
<body>
 <div class="container">
   <%@include file="navbar.jsp" %>  
   <h1>Edit your note</h1>
   <br>
   <%
   int noteId=Integer.parseInt(request.getParameter("note_id").trim());
   Session s=FactoryProvider.getFactory().openSession();
   
   Note note=(Note)s.get(Note.class, noteId);
   
   %>
   
   <form action="UpdateServlet" method="post">
   <input value="<%=note.getId()%>" name="note_id" type="hidden">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Note title</label>
    <input name="title" required="required" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" 
    placeholder="Enter here" value="<%=note.getTitle() %>" />
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Note Content</label>
    <textarea name="content" required="required" id="content" placeholder="Enter your content here" class="form-control" style="height:200px"><%=note.getContent() %>
    </textarea>
  </div>
  
<div class="container text-center">
  <button type="submit" class="btn btn-success">Save Note</button>
  </div>
</form>
   
   
   </div>

</body>
</html>