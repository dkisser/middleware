package org.wc.tinycat.utils;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import org.junit.Test;

import java.util.Random;

/**
 * Created by WenChen on 2020/1/20.
 */
public class GenSqlTest {

    private String[] prefixArr = new String[]{"000000004","000000001"};

    private String[] XSD_ARR = new String[]{"XSD-20200120-wc002","XSD-20200118-wc002","XSD-20200119-wc002",
            "XSD-20200120-hhs001","XSD-20200119-hhs001","XSD-20200118-hhs001","XSD-20200117-hhs001"};

    private String[] SHY_ARR = new String[]{"hehaishui","wenchen"};

    private String[] YWY_ARR = new String[]{"hehaishui","wenchen"};

    private String[] SHZ_ARR = new String[]{"ddfd","dafad","wenc","hehai","12dad","fdf","21fza","hhhh富士"};

    private String[] KDR_ARR = new String[]{"hehaishui","wenchen"};

    private String[] DATE_ARR = new String[]{"2020-01-18","2020-01-19","2020-01-20","2020-01-17"};

    @Test
    public void testSql (){
        String origin  = "INSERT INTO `byb`.`orders` ( `TXM`, `XSDH`, `WINE_ID`, `SHY`, `YWY`, `SHZ`, `KDR`, " +
                "`DATE`, `REMARK`) VALUES ('000000004000000116', 'XSD-20180120-wc002', '4', 'hehaishui', " +
                "'wenchen', '12dad', 'wenchen', '2018-01-20', NULL);\n";
        StringBuilder sb = new StringBuilder(512);
        sb.append("INSERT INTO `byb`.`orders` ( `TXM`, `XSDH`, `WINE_ID`, `SHY`, `YWY`, `SHZ`, `KDR`, ")
        .append("`DATE`) VALUES ");
        int idx = 116;
        do {
            idx++;
            String txm = getIdxSr(idx);
            sb.append("('").append(txm).append("','").append(getXSDH())
            .append("','").append(getWineId()).append("','").append(getSHY())
            .append("','").append(getYWY()).append("','").append(getSHZ())
            .append("','").append(getKDR()).append("','").append(getDATE()).append("'),\r\n");
        } while(idx < 10000);
        sb.setLength(sb.length()-1);
        System.out.println(sb.toString());
    }

    private String getIdxSr (int idx){
        Random random = new Random();
        String prefix = prefixArr[random.nextInt(2)];
        String sufix = getSuffix(idx);
        return prefix+sufix;
    }

    private String getSuffix (int idx){
        if (idx < 1000){
            return "000000"+idx;
        } else if (idx < 10000){
            return "00000"+idx;
        } else if (idx < 100000){
            return "0000"+idx;
        }
        return "error";
    }

    private String getXSDH(){
        Random ran = new Random();
        return XSD_ARR[ran.nextInt(XSD_ARR.length)];
    }

    private int getWineId(){
        Random ran = new Random();
        int result = ran.nextInt(4);
        if (result == 0)
            return 4;
        return result;
    }

    private String getSHY(){
        Random ran = new Random();
        return SHY_ARR[ran.nextInt(SHY_ARR.length)];
    }

    private String getYWY(){
        Random ran = new Random();
        return YWY_ARR[ran.nextInt(YWY_ARR.length)];
    }

    private String getSHZ(){
        Random ran = new Random();
        return SHZ_ARR[ran.nextInt(SHZ_ARR.length)];
    }

    private String getKDR(){
        Random ran = new Random();
        return KDR_ARR[ran.nextInt(KDR_ARR.length)];
    }

    private String getDATE(){
        Random ran = new Random();
        return DATE_ARR[ran.nextInt(DATE_ARR.length)];
    }

}
