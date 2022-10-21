package common;

import org.apache.commons.lang.RandomStringUtils;

public class RandomStringGenerator {


    public String generate(){
        String filename  =RandomStringUtils.randomAlphabetic(5);
        return filename;
    }
}
