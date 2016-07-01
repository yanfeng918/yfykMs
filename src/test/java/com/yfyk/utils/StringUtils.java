package com.yfyk.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by yanfeng on 2016/7/1.
 */
public class StringUtils {

    // 判断一个字符串是否都为数字
    public static boolean isDigit(String strNum) {
        return strNum.matches("[0-9]{1,}");
    }

    // 判断一个字符串是否都为数字
    public static boolean isDigitAll(String strNum) {
        Pattern pattern = Pattern.compile("[0-9]{1,}");
        Matcher matcher = pattern.matcher((CharSequence) strNum);
        return matcher.matches();
    }

    //截取数字
    public static String getNumbers(String content) {
        Pattern pattern = Pattern.compile("\\d+弄");
        Matcher matcher = pattern.matcher(content);
        while (matcher.find()) {
            return matcher.group(0);
        }
        return "";
    }

    // 截取非数字
    public static String splitNotNumber(String content) {
        Pattern pattern = Pattern.compile("\\D+");
        Matcher matcher = pattern.matcher(content);
        while (matcher.find()) {
            return matcher.group(0);
        }
        return "";
    }

    public static void  main(String args[]){
        String aaa123asdfasd = StringUtils.getNumbers("上海市浦东新区海阳路1001弄12号501室");
        System.out.print(aaa123asdfasd);
    }
}
