package com.wlh.watch.common.data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/** 
 *日期类 
 */
public class DateUtils {
	
	public static Date getDATE(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date date=null;
		try {
			date = df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		return date;
	}

}
