/**
 * 
 */
package org.beans;

import java.sql.Time;

/**
 * @author Terry
 *
 */
public class Movie {
	private int id;
	private String title;
	private String feature_format;
	private Time feature_length;
	private int release_year;
	private int rating;

	
	public Movie(){		
	}
	
	public Movie(String title, String feaure_format, 
			Time feature_length, int release_year, int rating){		
	
		this.title = title;
		this.feature_format = feaure_format;
		this.feature_length = feature_length;
		this.release_year = release_year;
		this.rating = rating;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFeature_format() {
		return feature_format;
	}
	public void setFeature_format(String feature_format) {
		this.feature_format = feature_format;
	}
	public Time getFeature_length() {
		return feature_length;
	}
	public void setFeature_length(Time feature_length) {
		this.feature_length = feature_length;
	}
	public int getRelease_year() {
		return release_year;
	}
	public void setRelease_year(int release_year) {
		this.release_year = release_year;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	
}
