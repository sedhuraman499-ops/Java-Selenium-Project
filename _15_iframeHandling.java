package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class _15_iframeHandling {

    public static void main(String[] args) {

        WebDriver driver = new ChromeDriver();

        try {
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

            System.out.println("Opening iframe worksheet page...");
            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_iframes.html"); //change ip according to your site link
            Thread.sleep(3000);

            // --------------------------------------------------
            // Task 01: Switch to Frame by ID and click Buy Now
            // --------------------------------------------------
            System.out.println("TASK 01: Switching to iframe by ID 'ad'");
            driver.switchTo().frame("ad");

            wait.until(ExpectedConditions.elementToBeClickable(By.id("btn"))).click();
            System.out.println("TASK 01 COMPLETED: 'Buy Now' button clicked");
            Thread.sleep(3000);

            // --------------------------------------------------
            // Task 02: Return to main content and click Logout
            // --------------------------------------------------
            System.out.println("TASK 02: Switching back to main content");
            driver.switchTo().defaultContent();

            wait.until(ExpectedConditions.elementToBeClickable(By.id("logout"))).click();
            System.out.println("TASK 02 COMPLETED: 'Logout' button clicked");
            Thread.sleep(3000);
            // --------------------------------------------------
            // Task 03: Switch to iframe by index and read text
            // --------------------------------------------------
            System.out.println("TASK 03: Switching to iframe by index 0");
            driver.switchTo().frame(0);

            String text = driver.findElement(By.tagName("h3")).getText();
            System.out.println("TASK 03 COMPLETED: Text inside iframe = " + text);
            Thread.sleep(3000);
            System.out.println("ALL TASKS EXECUTED SUCCESSFULLY ✅");

            Thread.sleep(4000); // just to observe in browser

        } catch (Exception e) {
            System.out.println("❌ ERROR OCCURRED");
            e.printStackTrace();
        } finally {
            driver.quit();
            System.out.println("Browser closed");
        }
    }
}
