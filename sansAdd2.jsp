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
<title>Show Edited Page</title>
</head>
<body>

	     <jsp:include page="_header.jsp"></jsp:include>

	<center>
		<h1>Show Added Movie</h1>
		<table border="1">
			<tbody>
				<%
					try {
						// create one of the three types of statement (Statement,
						// PreparedStatement, CallableStatement)        

						String title = request.getParameter("etitle");
						//out.println("title is : " + title);

						String format = request.getParameter("eformat");
						//out.println("format is : " + format);

						Time length = Time.valueOf(request.getParameter("elength"));
						//out.println("length is : " + length);

						int year = Integer.parseInt(request.getParameter("eyear"));
						//out.println("year is : " + year);

						int rating = Integer.parseInt(request.getParameter("erating"));
						//out.println("rating is : " + rating);                      

						String myWhere = "ORDER BY ID DESC LIMIT 1";

						Movie picture = new Movie();
						picture.setTitle(title);
						picture.setFeature_format(format);
						picture.setFeature_length(length);
						picture.setRelease_year(year);
						picture.setRating(rating);

						String updateMsg = DBUtils.addMovie(myConn, picture);

						out.println(updateMsg + "/n");

						List<Movie> myMovieList = DBUtils.queryMovie(myConn, myWhere);

						for (int i = 0; i < myMovieList.size(); i++) {
				%>
				<tr>
					<th>ID</th>
					<td>
						<%
							out.print(myMovieList.get(i).getId());
						%>
					</td>
				</tr>
				<tr>
					<th>TITLE</th>
					<td>
						<%
							out.print(myMovieList.get(i).getTitle());
						%>
					</td>
				</tr>
				<tr>
					<th>FEATURE FORMAT</th>
					<td>
						<%
							out.print(myMovieList.get(i).getFeature_format());
						%>
					</td>
				</tr>
				<tr>
					<th>FEATURE LENGTH</th>
					<td>
						<%
							out.print(myMovieList.get(i).getFeature_length());
						%>
					</td>
				</tr>
				<tr>
					<th>RELEASE YEAR</th>
					<td>
						<%
							out.print(myMovieList.get(i).getRelease_year());
						%>
					</td>
				</tr>
				<tr>
					<th>RATING</th>
					<td>
						<%
							out.print(myMovieList.get(i).getRating());
						%>
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
	</center>

	     <jsp:include page="_footer2.jsp"></jsp:include>

</body>
</html>