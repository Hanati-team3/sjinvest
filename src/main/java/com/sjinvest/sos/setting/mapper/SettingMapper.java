package com.sjinvest.sos.setting.mapper;

import com.sjinvest.sos.setting.domain.Setting;

public interface SettingMapper {
	public void create(int userSeq);
	public Setting read(int userSeq);
	public int delete(int userSeq);
	public int update(Setting setting);
}