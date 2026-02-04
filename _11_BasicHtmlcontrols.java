package Selenium;
 
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
 
public class _11_BasicHtmlcontrols {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("--- Selenium Lab Session Started ---");
        WebDriver driver = new ChromeDriver();
 
        System.out.println("Navigating to Basic HTML worksheet...");
        driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_basic_html.html");   //change ip according to your site links
        Thread.sleep(3000);
 
        // Task 01: Type Text
        System.out.println("Executing Task 01: Entering 'John Doe' into First Name field...");
        driver.findElement(By.id("fname")).sendKeys("John Doe");
        Thread.sleep(3000);
 
        // Task 02: Clear Text
        System.out.println("Executing Task 02: Clearing Bio field...");
        driver.findElement(By.id("bio")).clear();
        Thread.sleep(3000);
 
        // Task 03: Click Button
        System.out.println("Executing Task 03: Clicking Submit button...");
        driver.findElement(By.tagName("button")).click();
        Thread.sleep(3000);
 
        System.out.println("--- Selenium Lab Session Ended ---");
        driver.quit();
    }
}
