package com.auchan.bem.bem_pojo.entity;

import java.math.BigDecimal;
import java.util.Date;

public class File {
    private Integer id;

    private String name;

    private Directory directory;

    private BigDecimal fileSize;

    private Short sizeUnit;

    private Date createDate;

    private String createUser;

    private TypeIcon typeIcon;

    private String discription;

    private Topic topic;

    private Division division;

    private Section section;
    
    private Short otherStoreView;
    
    private Integer downloadTimes;
    
    private Store store;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Directory getDirectory() {
        return directory;
    }

    public void setDirectory(Directory directory) {
        this.directory = directory;
    }

    public BigDecimal getFileSize() {
        return fileSize;
    }

    public void setFileSize(BigDecimal fileSize) {
        this.fileSize = fileSize;
    }

    public Short getSizeUnit() {
        return sizeUnit;
    }

    public void setSizeUnit(Short sizeUnit) {
        this.sizeUnit = sizeUnit;
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

    public TypeIcon getTypeIcon() {
		return typeIcon;
	}

	public void setTypeIcon(TypeIcon typeIcon) {
		this.typeIcon = typeIcon;
	}

	public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription == null ? null : discription.trim();
    }

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Division getDivision() {
		return division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	public Short getOtherStoreView() {
		return otherStoreView;
	}

	public void setOtherStoreView(Short otherStoreView) {
		this.otherStoreView = otherStoreView;
	}

	public Integer getDownloadTimes() {
		return downloadTimes;
	}

	public void setDownloadTimes(Integer downloadTimes) {
		this.downloadTimes = downloadTimes;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}
}