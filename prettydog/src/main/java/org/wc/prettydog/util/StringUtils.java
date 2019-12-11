package org.wc.prettydog.util;

/**
 * Created by WenChen on 2019/12/10.
 */
public class StringUtils {

    public static boolean isEmpty(String s){
        return s == null || "".equals(s);
    }

    public static boolean hasText(String s){
        return !isEmpty(s) && containText(s);
    }

    private static boolean containText (String s){
        int length = s.length();
        for (int i=0;i<length;i++){
            if (!Character.isWhitespace(s.charAt(i))){
                return true;
            }
        }
        return false;
    }

    public static boolean isNotEmpty(String s){
        return !isEmpty(s);
    }
}
