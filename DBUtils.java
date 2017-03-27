/**
 * 
 */
package org.utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.beans.Movie;
/**
 * @author Terry
 *
 */
public class DBUtils {
	public static String deleteMovie (Connection myConn, String WHERE) throws SQLException{

		 String DELETE_QUERY = "delete from movie " + WHERE;	
		 String msg = "Sorry, could not delete the Movie data";
		 
		 Statement stmtDel = myConn.createStatement();
         int exDel = stmtDel.executeUpdate(DELETE_QUERY);
				
		//Show if data deleted or not 		
		if (exDel > 0){
            msg = "Movie Data deleted";			
		}
		
		return msg;		
	}

	public static String addMovie (Connection myConn, Movie flix) throws SQLException{

		final String SELECT_INSERT = "INSERT INTO movie ( TITLE, FEATURE_FORMAT, FEATURE_LENGTH, RELEASE_YEAR, RATING)" 
                   								+ " VALUES (?, ?, ?, ?, ? )";

		String msg = "Sorry, could not add the Movie data";
		
		PreparedStatement ps = myConn.prepareStatement(SELECT_INSERT);
		
		System.out.println(SELECT_INSERT);
		
		System.out.println(flix.getTitle());
		System.out.println(flix.getFeature_format());
		System.out.println(flix.getFeature_length());
		System.out.println(flix.getRelease_year());
		System.out.println(flix.getRating());
		
		ps.setString(1, flix.getTitle());
		ps.setString(2, flix.getFeature_format());
		ps.setTime(3, flix.getFeature_length());
		ps.setInt(4, flix.getRelease_year());
		ps.setInt(5, flix.getRating());
		
		int exUpt = ps.executeUpdate();
		
		if (exUpt > 0){
			msg = "Movie Data Added";
		}
				
		return msg;	
	}
	
	public static String updateMovie (Connection myConn, Movie flix, String myWhere) throws SQLException{

		final String SELECT_UPDATE = "UPDATE movie SET title = ?, feature_format = ?, feature_length = ?, release_year = ?, rating = ? "
					 + myWhere;
		String msg = "Sorry, could not update the Movie data";
		
		PreparedStatement ps = myConn.prepareStatement(SELECT_UPDATE);
		
		System.out.println(SELECT_UPDATE);
		
		System.out.println(flix.getTitle());
		System.out.println(flix.getFeature_format());
		System.out.println(flix.getFeature_length());
		System.out.println(flix.getRelease_year());
		System.out.println(flix.getRating());
		
		ps.setString(1, flix.getTitle());
		ps.setString(2, flix.getFeature_format());
		ps.setTime(3, flix.getFeature_length());
		ps.setInt(4, flix.getRelease_year());
		ps.setInt(5, flix.getRating());
		
		int exUpt = ps.executeUpdate();
		
		if (exUpt > 0){
			msg = "Movie Data Updated";
		}
				
		return msg;	
	}
		
	public static List <Movie> queryMovie (Connection myConn, String myWhere) throws SQLException{

		final String SELECT_QUERY = "SELECT ID, TITLE, FEATURE_FORMAT, FEATURE_LENGTH, RELEASE_YEAR, RATING"
				+ " FROM movie " + myWhere;
		
		System.out.println(SELECT_QUERY);

		Statement myStmt = myConn.createStatement();
		ResultSet myRs = myStmt.executeQuery(SELECT_QUERY);

		List<Movie> list = new ArrayList<Movie>();

		while ( myRs.next() ){
			int id = myRs.getInt("id");

			String title = myRs.getString("title");    	

			String feature_format = myRs.getString("feature_format");

			Time feature_length = myRs.getTime("feature_length");

			int release_year = myRs.getInt("release_year");

			int rating = myRs.getInt("rating");

			Movie movie = new Movie();

			movie.setId(id);
			movie.setTitle(title);
			movie.setFeature_format(feature_format);
			movie.setFeature_length(feature_length);
			movie.setRelease_year(release_year);
			movie.setRating(rating);

			list.add(movie);

		}
		return list;
	}


}
