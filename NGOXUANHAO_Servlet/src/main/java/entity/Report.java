package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;


@NamedStoredProcedureQueries({
@NamedStoredProcedureQuery(name = "Report.favoriteByYear",
procedureName = "spFavoriteByYear",
parameters = {
@StoredProcedureParameter(name="Year", type = Integer.class)},
resultClasses = {Report.class})
})

@Entity
public class Report implements Serializable{
	@Id
	String group;
	Long likes;
	Date newest;
	Date oldest;
	
	public Report() {

	}
	public Report(String group, Long likes, Date newest, Date oldest) {
		super();
		this.group = group;
		this.likes = likes;
		this.newest = newest;
		this.oldest = oldest;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
	public Date getNewest() {
		return newest;
	}
	public void setNewest(Date newest) {
		this.newest = newest;
	}
	public Date getOldest() {
		return oldest;
	}
	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}
	public String toStringNew() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return  sdf.format(newest);
	}
	public String toStringOld() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return  sdf.format(oldest);
	}
	
}
