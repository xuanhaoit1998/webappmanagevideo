package entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;


@NamedQueries({
	
	@NamedQuery(name = "Video.findByKeyword",
			query = "SELECT DISTINCT o.video FROM Favorite o"
			+ " WHERE o.video.title LIKE :keyword"),
	@NamedQuery(name = "Video.findByUser",
		query = "SELECT o.video FROM Favorite o"
		+ " WHERE o.user.id=:id"),
	@NamedQuery(name = "Video.findInRange",
	query = "SELECT DISTINCT o.video FROM Favorite o"
				+ " WHERE o.likeDate BETWEEN :min AND :max"),
	@NamedQuery(name = "Video.findInMonths",
		query = "SELECT DISTINCT o.video FROM Favorite o"
		+ " where month(o.likeDate)IN(:months)"),
	@NamedQuery(name = "Video.VideoLike" , query = "SELECT DISTINCT f.video from Favorite f"),
	@NamedQuery(name = "Video.VideoShare" , query = "SELECT DISTINCT sh.video from Share sh")
})
    
@Entity
@Table(name = "Videos")
public class Video {
	@Id
	private String id;
	private String title;
	private String poster;
	private String description;
	private Integer views = 0;
	private Boolean active = true;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

}
