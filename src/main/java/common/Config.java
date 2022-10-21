package common;

import com.github.javafaker.Faker;
import org.joda.time.LocalDateTime;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class Config {

    public Faker faker(){
        return new Faker();
    }

    public String mailsacEmail(){
        String candidateEmail = new Faker().internet().emailAddress();
        String Email = candidateEmail.substring(0,candidateEmail.indexOf("@"))+"@mailsac.com";
        return Email;
    }

    public String todaysDateTime(){
        return LocalDateTime.now().toString();
    }

    public String waitForAPI() throws InterruptedException {
        Thread.sleep(5000);
        return "wait";
    }

    public String startDate(){
        return LocalDate.now().toString();
    }

    public String endDate(){
        return LocalDate.now().plusDays(3).toString();
    }

    public int randomNumber(){
        return new Random().nextInt(10);
    }

    public Boolean randomTrueOrFalse(){
        return new Config().randomNumber() % 2 == 0;
    }

    public static String brows(String n){
        return n;
    }





}
