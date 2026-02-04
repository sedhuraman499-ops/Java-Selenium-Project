package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class _04_Webdrivercommands {

public static void main(String[] args) {

 WebDriver driver = null;
   try {
      // Launch Chrome
       driver = new ChromeDriver();

      // Open worksheet page
       driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_webdriver_commands.html");//change ip according to your site link 
       
       Thread.sleep(3000);
       
     // Task 01: Open URL and Get Page Info
       driver.get("https://opensource-demo.orangehrmlive.com/");

       // Get title and URL
       String title = driver.getTitle();
       String currentUrl = driver.getCurrentUrl();
      
       // Print title and URL
       System.out.println("Page Title : " + title);
       System.out.println("Current URL : " + currentUrl);

       // Verify title
       if (title.equals("OrangeHRM")) {
           System.out.println("✅ Title verification PASSED");
       } else {
           System.out.println("❌ Title verification FAILED");
       }
         Thread.sleep(3000);
          
       // Task 02: Interaction (IDs hidden in solution - follow instruction!)
            driver.findElement( By.xpath( "//input[@placeholder='Username']")).sendKeys("Admin");
            Thread.sleep(3000);
            driver.findElement(By.xpath("//input[@placeholder='Password']")).sendKeys("admin123");
            Thread.sleep(3000);
            
       // Task 03: Click & Source
            driver.manage().window().maximize();
            driver.findElement(By.xpath("//button[@type='submit']")).click();
            Thread.sleep(3000);          
            System.out.println("Source Length: " +driver.getPageSource().length());

            Thread.sleep(3000);

            driver.quit();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}