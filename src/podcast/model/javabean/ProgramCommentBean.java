package podcast.model.javabean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Component
@Entity
@Table(name = "programComment")
public class ProgramCommentBean {
	private Integer commentId;
	private String commentMsg;
	private Integer memberId;
	private Integer podcasterId;
	private Integer msgStatus;
	private Date msgDate;
	private Date replyDate;
	private String replyMsg;

	public ProgramCommentBean() {
	}

	public ProgramCommentBean(Integer commentId, String commentMsg, Integer memberId, Integer podcasterId, Integer msgStatus,
			Date msgDate,  Date replyDate, String replyMsg) {
		this.commentId = commentId;
		this.commentMsg = commentMsg;
		this.memberId = memberId;
		this.podcasterId = podcasterId;
		this.msgStatus = msgStatus;
		this.msgDate = msgDate;
		this.replyDate = replyDate;
		this.replyMsg = replyMsg;
	}
	
	@Column(name = "REPLYMSG")
	public String getReplyMsg() {
		return replyMsg;
	}

	public void setReplyMsg(String replyMsg) {
		this.replyMsg = replyMsg;
	}

	@Column(name = "REPLYDATE")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	@Id
	@Column(name = "COMMENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
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
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	@Column(name = "PODCASTERID")
	public Integer getPodcasterId() {
		return podcasterId;
	}

	public void setPodcasterId(Integer podcasterId) {
		this.podcasterId = podcasterId;
	}

	@Column(name = "MSGSTATUS")
	public Integer getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(Integer msgStatus) {
		this.msgStatus = msgStatus;
	}

	@Column(name = "MSGDATE")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	public Date getMsgDate() {
		return msgDate;
	}

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}

}
