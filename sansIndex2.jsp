<%--
Document : index
Created on :  3/9/2017
Author : Terry
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="false"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.conn.*" %>
<%@ page import="org.utils.*" %>
<%@ page import="org.beans.*" %>
<%@ page import="java.util.List" %>
<%
 Connection myConn = ConnectionUtils.getConnection();
 String myWhere = "WHERE 1 = 1";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movie Display Page</title>
</head>
<form action="sansDelete.jsp" method="get">


	     <jsp:include page="_header.jsp"></jsp:include>

	<center>
		<h1>Displaying All Movies</h1>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>TITLE</th>
				<th>FEATURE FORMAT</th>
				<th>FEATURE LENGTH</th>
				<th>RELEASE YEAR</th>
				<th>RATING</th>
                <th>DELETE ROW</th>				
			</tr>
			<tbody>
				<% 
        /* CONNECTION SECTION */
        
        try {                                
            // create one of the three types of statement (Statement,
            // PreparedStatement, CallableStatement)        
            
            List<Movie> myMovieList = DBUtils.queryMovie(myConn, myWhere);            
            
            for (int i=0; i < myMovieList.size(); i++ ){
%>
				<tr>
					<td>
						<% out.print(myMovieList.get(i).getId()); %>						
					</td>
					<td>
						<% out.print(myMovieList.get(i).getTitle()); %>
					</td>
					<td>
						<% out.print(myMovieList.get(i).getFeature_format()); %>
					</td>
					<td>
						<% out.print(myMovieList.get(i).getFeature_length()); %>
					</td>
					<td>
						<% out.print(myMovieList.get(i).getRelease_year()); %>
					</td>
					<td>
						<% out.print(myMovieList.get(i).getRating()); %>
					</td>
                    <td>  
                         <input type="radio" name="id" value="<%= myMovieList.get(i).getId() %>"> delete row                                                                 
                    </td>
				</tr>
				<% 
            } 
 
            //close statements to prevent memory leaks
            myConn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {        
        }
                       
 %>
 
			</tbody>
		</table>
<br>	
<a href="sansAdd.jsp">Add New Movie</a>
<br><br>		
<input type="reset" value="Reset Delete Checkbox">
<input type="submit" value="Submit Delete Checkbox">
		
	</center>

	     <jsp:include page="_footer.jsp"></jsp:include>

</form>

<BODY>
    <FORM action="sansEdit.jsp" method="POST">
       <center>
    <H1>Edit Movie Data</H1>
    <H4>Please enter the Id Number of the Movie to Edit :</H4>   
        <input type="text" name="id"> <BR> <BR> 
        <input type="submit" value="Submit">
        <jsp:include page="_footer.jsp"></jsp:include>
     </center>       
    </FORM>
</BODY>

</html>