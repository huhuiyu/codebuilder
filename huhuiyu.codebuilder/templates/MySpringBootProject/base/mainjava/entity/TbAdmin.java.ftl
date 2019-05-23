package top.huhuiyu.codebuilder.entity;

import io.swagger.annotations.ApiParam;
import top.huhuiyu.api.utils.mybase.BaseEntity;

/**
 * TbAdmin表
 * 
 * @author ${baseInfo.author}
 */
public class TbAdmin extends BaseEntity {

  private static final long serialVersionUID = ${builderUtil.serialVersionUID};

  @ApiParam(hidden = true)
  private java.lang.Integer aid;
  @ApiParam(hidden = true)
  private java.lang.String  username;
  @ApiParam(hidden = true)
  private java.lang.String  password;
  @ApiParam(hidden = true)
  private java.lang.String  salt;
  @ApiParam(hidden = true)
  private java.lang.String  nickname;
  @ApiParam(hidden = true)
  private java.lang.String  enable;
  @ApiParam(hidden = true)
  private java.util.Date    lastupdate;

  public TbAdmin() {
  }

  public java.lang.Integer getAid() {
    return aid;
  }

  public void setAid(java.lang.Integer aid) {
    this.aid = aid;
  }

  public java.lang.String getUsername() {
    return username;
  }

  public void setUsername(java.lang.String username) {
    this.username = username;
  }

  public java.lang.String getPassword() {
    return password;
  }

  public void setPassword(java.lang.String password) {
    this.password = password;
  }

  public java.lang.String getSalt() {
    return salt;
  }

  public void setSalt(java.lang.String salt) {
    this.salt = salt;
  }

  public java.lang.String getNickname() {
    return nickname;
  }

  public void setNickname(java.lang.String nickname) {
    this.nickname = nickname;
  }

  public java.lang.String getEnable() {
    return enable;
  }

  public void setEnable(java.lang.String enable) {
    this.enable = enable;
  }

  public java.util.Date getLastupdate() {
    return lastupdate;
  }

  public void setLastupdate(java.util.Date lastupdate) {
    this.lastupdate = lastupdate;
  }

}