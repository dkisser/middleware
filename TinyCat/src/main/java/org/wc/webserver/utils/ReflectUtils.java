package org.wc.webserver.utils;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by WenChen on 2019/12/30.
 */
public class ReflectUtils {

    private static final Map<String, Class<?>> primitiveTypeNameMap = new HashMap<String, Class<?>>(16);

    private static final String ARRAY_SUFFIX = "[]";

    private static final String INTERNAL_ARRAY_PREFIX = "[L";

    static {
        primitiveTypeNameMap.put(boolean.class.getName(),boolean.class);
        primitiveTypeNameMap.put(byte.class.getName(), byte.class);
        primitiveTypeNameMap.put(char.class.getName(), char.class);
        primitiveTypeNameMap.put(double.class.getName(), double.class);
        primitiveTypeNameMap.put(float.class.getName(), float.class);
        primitiveTypeNameMap.put(int.class.getName(), int.class);
        primitiveTypeNameMap.put(long.class.getName(), long.class);
        primitiveTypeNameMap.put(short.class.getName(), short.class);
        primitiveTypeNameMap.put(boolean[].class.getName(),boolean[].class);
        primitiveTypeNameMap.put(byte[].class.getName(), byte[].class);
        primitiveTypeNameMap.put(char[].class.getName(), char[].class);
        primitiveTypeNameMap.put(double[].class.getName(), double[].class);
        primitiveTypeNameMap.put(float[].class.getName(), float[].class);
        primitiveTypeNameMap.put(int[].class.getName(), int[].class);
        primitiveTypeNameMap.put(long[].class.getName(), long[].class);
        primitiveTypeNameMap.put(short[].class.getName(), short[].class);
    }

    public static ClassLoader getDefaultClassLoader(){
        return getClassLoader(null);
    }

    public static ClassLoader getClassLoader(Class<?> clazz){
        ClassLoader loader = null;
        if (clazz == null){
          loader = Thread.currentThread().getContextClassLoader();
          if (loader == null){
              loader = ClassLoader.getSystemClassLoader();
              if (loader == null) throw new RuntimeException("ClassLoader not load,please check server state");
          }
        } else {
            loader = clazz.getClassLoader();
        }
        return loader;
    }

    public static Class<?> forName (String name,ClassLoader classLoader)
            throws ClassNotFoundException{
        Class<?> result = resolvePrimitiveClassName(name);
        if (result != null)
            return result;
        // "java.lang.String[]" style arrays
        if (name.endsWith(ARRAY_SUFFIX)){
            String eleClassName = name.substring(0,name.length()- ARRAY_SUFFIX.length());
            Class<?> eleClass = forName(eleClassName,classLoader);
            return Array.newInstance(eleClass,0).getClass();
        }

        int internalArrayMarker = name.indexOf(INTERNAL_ARRAY_PREFIX);
        if (internalArrayMarker != -1 && name.endsWith(";")){
            String eleClassName = null;
            if (internalArrayMarker == 0){
                eleClassName = name.substring(INTERNAL_ARRAY_PREFIX.length(),name.length()-1);
            } else if (name.startsWith("[")){
                eleClassName = name.substring(1);
            }
            Class<?> clz = forName(eleClassName,classLoader);
            return Array.newInstance(clz,0).getClass();

        }
        if (classLoader == null){
            classLoader = getDefaultClassLoader();
        }
        result = classLoader.loadClass(name);
        return result;
    }

    public static Class<?> forNameWithCallerClassLoader (String name,Class<?> clz)
            throws ClassNotFoundException{
        return forName(name,clz.getClassLoader());
    }

    public static Class<?> forNameWithThreadContextClassLoader (String name)
            throws ClassNotFoundException{
        return forName(name,Thread.currentThread().getContextClassLoader());
    }

    public static Class<?> resolvePrimitiveClassName(String name) {
        Class<?> result = null;
        // Most class names will be quite long, considering that they
        // SHOULD sit in a package, so a length check is worthwhile.
        if (name != null && name.length() <= 8) {
            // Could be a primitive - likely.
            result = (Class<?>) primitiveTypeNameMap.get(name);
        }
        return result;
    }
}
