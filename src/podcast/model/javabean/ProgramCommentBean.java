package podcast.model.javabean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "programComment")
public class ProgramCommentBean {
	private int commentId;
	private String commentMsg;
	private int memberId;
	private int podcasterId;
	private int msgStatus;
	private Date msgDate;

	public ProgramCommentBean() {
	}

	public ProgramCommentBean(int commentId, String commentMsg, int memberId, int podcasterId, int msgStatus,
			Date msgDate) {
		this.commentId = commentId;
		this.commentMsg = commentMsg;
		this.memberId = memberId;
		this.podcasterId = podcasterId;
		this.msgStatus = msgStatus;
		this.msgDate = msgDate;
	}

	@Id
	@Column(name = "COMMENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	@Column(name = "COMMENTMSG")
	public String getCommentMsg() {
		return commentMsg;
	}

	public void setCommentMsg(String commentMsg) {
		this.commentMsg = commentMsg;
	}

	@Column(name = "MEMBERID")
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Column(name = "PODCASTERID")
	public int getPodcasterId() {
		return podcasterId;
	}

	public void setPodcasterId(int podcasterId) {
		this.podcasterId = podcasterId;
	}

	@Column(name = "MSGSTATUS")
	public int getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(int msgStatus) {
		this.msgStatus = msgStatus;
	}

	@Column(name = "MSGDATE")
	public Date getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}

}
