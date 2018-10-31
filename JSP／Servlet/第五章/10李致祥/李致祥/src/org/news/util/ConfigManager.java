package org.news.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigManager {
    private static Properties props = null;

    static {
        InputStream is = null;
        is = ConfigManager.class.getClassLoader().getResourceAsStream(
                "database.properties");
        if (is == null)
            throw new RuntimeException("鎵句笉鍒版暟鎹簱鍙傛暟閰嶇疆鏂囦欢锛�");
        props = new Properties();
        try {
            props.load(is);
        } catch (IOException e) {
            throw new RuntimeException("鏁版嵁搴撻厤缃弬鏁板姞杞介敊璇紒", e);
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static String getProperty(String key) {
        return props.getProperty(key);
    }
}
