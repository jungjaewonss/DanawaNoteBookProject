package Danawa.Project1.Dto;
import java.util.Date;

import lombok.ToString;

@ToString
public class BoardBean {

	

        //게시번호 , 좋아요 , 싫어요 , 조회수 , 댓글수 , 작성이 , 이메일 , 제목 , 비밀번호 , 작성일 , 내용
		private int num , ref  , readcount,commentcount;
		private String writer; 
		private String email;
		private String subject;
		private String password;
		private String reg_date;
		private String content;
		private int likes;
		private int dislike;
		
		
		
		
		public int getLikes() {
			return likes;
		}
		public void setLikes(int likes) {
			this.likes = likes;
		}
		public int getDislike() {
			return dislike;
		}
		public void setDislike(int dislike) {
			this.dislike = dislike;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
	
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getReg_date() {
			return reg_date;
		}
		public void setReg_date(String reg_date) {
			this.reg_date = reg_date;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}

		public BoardBean() {}
		public BoardBean(String writer, String email, String subject, String password, String content
				,int commentcount , int likes , int dislike) {
			super();
			this.writer = writer;
			this.email = email;
			this.subject = subject;
			this.password = password;
			this.content = content;
			this.commentcount = commentcount;
			this.likes = likes;
			this.dislike = dislike;
		}
		public int getCommentcount() {
			return commentcount;
		}
		public void setCommentcount(int commentcount) {
			this.commentcount = commentcount;
		}
		
		
		
	}
