package Selenium;


import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class _10_Navigation {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("--- Selenium Lab Session Started ---");
        WebDriver driver = new ChromeDriver();

        // Task 01: Navigate to Multiple URLs
        System.out.println("Executing Task 01: Navigating to Google and Facebook...");
        driver.navigate().to("https://www.google.com");
        System.out.println("Current URL: " + driver.getCurrentUrl());
        Thread.sleep(3000);

        driver.navigate().to("https://www.facebook.com");
        System.out.println("Current URL: " + driver.getCurrentUrl());
        Thread.sleep(3000);

        // Task 02: Browser History Navigation
        System.out.println("Executing Task 02: Testing back and forward navigation...");
        driver.navigate().back();
        System.out.println("Navigated back to: " + driver.getCurrentUrl());
        Thread.sleep(3000);

        driver.navigate().forward();
        System.out.println("Navigated forward to: " + driver.getCurrentUrl());
        Thread.sleep(3000);

        // Task 03: Page Refresh Operations
        System.out.println("Executing Task 03: Navigating to Amazon and refreshing...");
        driver.navigate().to("https://www.amazon.com");
        System.out.println("Title before refresh: " + driver.getTitle());
        Thread.sleep(3000);
        driver.navigate().refresh();
        System.out.println("Title after refresh: " + driver.getTitle());
        Thread.sleep(3000);

        System.out.println("--- Selenium Lab Session Ended ---");
        driver.quit();
    }
}