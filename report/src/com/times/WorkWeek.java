package com.times;

import java.util.Calendar;
import java.util.Date;

public class WorkWeek {
	/**
     * ��ȡ��ǰ���������ڼ�<br>
     * 
     * @param dt
     * @return ��ǰ���������ڼ�
     */
    public static int getWeekOfDate(Date dt) {
        int[] weekDays = {7, 1, 2, 3, 4, 5, 6};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);

        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        
        return weekDays[w];
    }
}
