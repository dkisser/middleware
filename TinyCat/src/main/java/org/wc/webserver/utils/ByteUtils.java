package org.wc.webserver.utils;

/**
 * Created by WenChen on 2020/1/6.
 */
public class ByteUtils {

    private static final int UNICODE_LEN = 2;

    public static byte[] Int2Byte_LE(int val){
        byte[] b = new byte[4];
        b[0] = (byte) (val & 0xFF);
        b[1] = (byte) ((val & 0xFF00) >> 8);
        b[2] = (byte) ((val & 0xFF0000) >> 16);
        b[3] = (byte) ((val & 0xFF000000) >> 24);
        return b;
    }

    public static byte[] Int2Byte_BE(int val){
        byte[] b = new byte[4];
        b[3] = (byte) (val & 0xFF);
        b[2] = (byte) ((val & 0xFF00) >> 8);
        b[1] = (byte) ((val & 0xFF0000) >> 16);
        b[0] = (byte) ((val & 0xFF000000) >> 24);
        return b;
    }

    public static void main(String[] args) {
        int num = 6;
//        System.out.println(Int2Byte_BE(num));
        byte i = -128;
        System.out.println(i & 0xFF);
        System.out.println();
    }
}
