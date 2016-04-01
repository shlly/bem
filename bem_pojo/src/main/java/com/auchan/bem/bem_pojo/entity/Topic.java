package com.auchan.bem.bem_pojo.entity;

import java.util.Date;
import java.util.List;

public class Topic {
    private Short topicNo;

    private String name;
    
    private String enName;

    private Short parentTopicNo;

    private Short status;

    private Date createDate;

    private String createUser;

    private Date lastChangeDate;

    private String lastChangeUser;

    private Directory directory;
    
    private Short importantLevel;
    
    private Short canQuestion;
    
    private List<Topic> childTopic;

    public Short getTopicNo() {
        return topicNo;
    }

    public void setTopicNo(Short topicNo) {
        this.topicNo = topicNo;
    }

    public String getName() {
        return name;
    }

	public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}

    public Short getParentTopicNo() {
        return parentTopicNo;
    }

    public void setParentTopicNo(Short parentTopicNo) {
        this.parentTopicNo = parentTopicNo;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

	public Date getLastChangeDate() {
		return lastChangeDate;
	}

	public void setLastChangeDate(Date lastChangeDate) {
		this.lastChangeDate = lastChangeDate;
	}

	public String getLastChangeUser() {
		return lastChangeUser;
	}

	public void setLastChangeUser(String lastChangeUser) {
		this.lastChangeUser = lastChangeUser;
	}

	public Directory getDirectory() {
		return directory;
	}

	public void setDirectory(Directory directory) {
		this.directory = directory;
	}

	public Short getImportantLevel() {
		return importantLevel;
	}

	public void setImportantLevel(Short importantLevel) {
		this.importantLevel = importantLevel;
	}

	public Short getCanQuestion() {
		return canQuestion;
	}

	public void setCanQuestion(Short canQuestion) {
		this.canQuestion = canQuestion;
	}

	public List<Topic> getChildTopic() {
		return childTopic;
	}

	public void setChildTopic(List<Topic> childTopic) {
		this.childTopic = childTopic;
	}
}