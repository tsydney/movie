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
 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Page</title>
</head>
<body>

	     <jsp:include page="_header.jsp"></jsp:include>

	<center>
		<h1>Displaying Deleted Movie</h1>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>TITLE</th>
				<th>FEATURE FORMAT</th>
				<th>FEATURE LENGTH</th>
				<th>RELEASE YEAR</th>
				<th>RATING</th>
			</tr>
			<tr>
				<!-- header -->
			</tr>
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
				</tr>

				<% 
            } 
             
        String myDeletedMovie = DBUtils.deleteMovie(myConn, myWhere);        
        
        out.println(myDeletedMovie);
             
            //close statements to prevent memory leaks
            myConn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {        
        }
                       
 %>
			</tbody>
			<tr>
				<!-- footer -->
			</tr>
		</table>
	</center>

	     <jsp:include page="_footer2.jsp"></jsp:include>

</body>
</html>