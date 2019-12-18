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

    /**
     * TODO In this way will produce so many template variables,so it will be change in later version
     *
     * replace placeholder with obj array
     * @param s
     * @param placeHolder
     * @param obj
     * @return
     */
    public static String parsePlaceHolder(String s,String placeHolder,Object... obj){
        StringBuilder sb = new StringBuilder(64);
        int index = -1,obLength = obj.length,scount=0,
                holderLen = placeHolder.length();
        String str = s;
        while ((index=str.indexOf(placeHolder)) > -1){
            scount++;
            if (scount > obLength){
                sb.append(str.substring(0,index)).append(placeHolder);
            } else {
                sb.append(str.substring(0,index)).append(obj[scount-1].toString());
            }
            str = str.substring(index+holderLen);
        }
        if (str.length() > 0){
            sb.append(str);
        }
        return sb.toString();
    }
}
