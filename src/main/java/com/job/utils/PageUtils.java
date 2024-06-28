package com.job.utils;

import com.job.model.Page;
import java.util.List;

public class PageUtils {
	public static Page getPage(Page page, List list) {
        page.setStart(getStart(page.getPageNumber(), page.getTotalPage(), list.size(), page.getMaxRows()));
        page.setTotalPage(getTotalPage(list.size(), page.getMaxRows()));
        return page;
    }

    public static int getStart(int pageNumber, int totalPage, int totalNumber, int maxRows) {
        totalNumber = totalNumber / maxRows + (totalNumber % maxRows == 0 ? 0 : 1);
        totalPage = totalNumber;
        if (pageNumber > totalPage) pageNumber = totalNumber;
        if (totalPage == 0) {
            return 0;
        } else {
            return (pageNumber - 1) * maxRows;
        }
    }

    public static int getTotalPage(int totalNumber, int maxRows) {
        return totalNumber / maxRows + (totalNumber % maxRows == 0 ? 0 : 1);
    }
}
