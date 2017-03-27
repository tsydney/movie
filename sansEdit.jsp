<%--
Document : index
Created on :  3/9/2017
Author : Terry
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="false"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.conn.*"%>
<%@ page import="org.utils.*"%>
<%@ page import="org.beans.*"%>
<%@ page import="java.util.List"%>
<%
 Connection myConn = ConnectionUtils.getConnection();
 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Page</title>
</head>
<form action="sansEdit2.jsp">

	     <jsp:include page="_header.jsp"></jsp:include>

	<center>
		<h1>Edit Movie</h1>
		<table border="1">
			<tbody>
				<% 
        /* CONNECTION SECTION */
                
        try {                                
            // create one of the three types of statement (Statement,
            // PreparedStatement, CallableStatement)        
 
            String id = request.getParameter("id");
            String myWhere = "WHERE id = " + id;
                      
            List<Movie> myMovieList = DBUtils.queryMovie(myConn, myWhere);
            
            for (int i=0; i < myMovieList.size(); i++ ){
%>
				<tr>
					<th>ID</th>
					<td>
						<% out.print(myMovieList.get(i).getId()); %>
					</td>
					<td>
					<input type="hidden" NAME="id" value= "<%= id %> " >
					</td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td>
						<% out.print(myMovieList.get(i).getTitle()); %>
					</td>
					<td><input type="text" name="etitle" maxlength="50"></td>
				</tr>
				<tr>
					<th>FEATURE FORMAT</th>
					<td>
						<% out.print(myMovieList.get(i).getFeature_format()); %>
					</td>
					<td><select name="eformat">
							<option value="VHS">VHS</option>
							<option value="DVD">DVD</option>
							<option value="Streaming">Streaming</option>
					</select></td>
				</tr>
				<tr>
					<th>FEATURE LENGTH</th>
					<td>
						<% out.print(myMovieList.get(i).getFeature_length()); %>
					</td>
					<td><input type="text" name="elength" maxlength="50">
						>00:00:00 and <08:33:00</td>
				</tr>
				<tr>
					<th>RELEASE YEAR</th>
					<td>
						<% out.print(myMovieList.get(i).getRelease_year()); %>
					</td>
					<td><input type="text" name="eyear" maxlength="50">
						>1800 and <2100</td>
				</tr>
				<tr>
					<th>RATING</th>
					<td>
						<% out.print(myMovieList.get(i).getRating()); %>
					</td>
					<td><input type="radio" name="erating" value="1"> 1 <input
						type="radio" name="erating" value="2"> 2 <input
						type="radio" name="erating" value="3"> 3 <input
						type="radio" name="erating" value="4"> 4 <input
						type="radio" name="erating" value="5"> 5</td>
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
		<BR> <BR> <INPUT TYPE="SUBMIT" value="Submit">
	</center>

	     <jsp:include page="_footer2.jsp"></jsp:include>

</form>
</html>