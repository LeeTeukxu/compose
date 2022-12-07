package com.zhide.assist.models;

import java.io.Serializable;
import java.util.List;

public class IndeTypo implements Serializable {
    private static final long serialVersionUID = 1L;
    private String dqTechnicalsolutions;
    private String dqExclusiveorder;
    private String pid;
    private String dqNum;
    private Integer Inid;
    private List<IndeTypo> js;

    public Integer getInId(){return Inid;}
    public void setInId(Integer Inid){this.Inid=Inid;}

    public String getDqTechnicalsolutions(){return dqTechnicalsolutions;}
    public void setDqTechnicalsolutions(String dqTechnicalsolutions){this.dqTechnicalsolutions=dqTechnicalsolutions;}

    public String getDqExclusiveorder(){return dqExclusiveorder;}
    public void setDqExclusiveorder(String dqExclusiveorder){this.dqExclusiveorder=dqExclusiveorder;}

    public String getPid(){return pid;}
    public void setPid(String pid){this.pid=pid;}

    public String getDqNum(){return dqNum;}
    public void setDqNum(String dqNum){this.dqNum=dqNum;}

    public List<IndeTypo> getJs(){return js;}
    public void setJs(List<IndeTypo> js){this.js=js;}
}
