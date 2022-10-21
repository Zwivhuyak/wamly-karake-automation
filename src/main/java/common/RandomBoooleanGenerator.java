package common;

import java.util.Random;

public class RandomBoooleanGenerator {
    public static Boolean generate(){
        Random randomGenerator=new Random();
        Boolean isResult = randomGenerator.nextBoolean();
        return isResult;
    }
}
