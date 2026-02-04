package Selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class _05_autowedrivermanager {

    public static void main(String[] args) {
    	 // Task 01: Modern Way (Selenium 4.6+)
        
    	WebDriver  driver = new ChromeDriver();
        try {   
        	 // Open worksheet page
            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_auto_webdriver.html");//change ip according to your site link
            
            // Task 02: Launching Firefox (Alternative)
             // WebDriver firefox = new FirefoxDriver(); install and it will work

            // Task 03: Window Controls & Page Details
            driver.manage().window().maximize();   
            System.out.println("Title: " + driver.getTitle());

            Thread.sleep(3000);
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            // Always close browser
          
                driver.quit();
            }
        }
    }

