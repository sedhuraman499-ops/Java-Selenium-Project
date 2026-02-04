package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class _20_Scrolling {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("--- Selenium Lab Session Started ---");

        WebDriver driver = new ChromeDriver();

        System.out.println("Navigating to Scrolling worksheet...");
        driver.get(
            "http://127.0.0.1:5502/Java_Selinium/worksheets/ws_scrolling.html"  //change ip according to your site link
        );

        JavascriptExecutor js =
        (JavascriptExecutor) driver;

        // Task 01: Scroll Down by Pixels (500px)
        System.out.println("Executing Task 01: Scrolling down by 500 pixels...");
        js.executeScript(
            "window.scrollBy(0, 500)"
        );
        Thread.sleep(3000);

        // Task 02: Scroll to Specific Element
        System.out.println("Executing Task 02: Scrolling 'Footer' into view...");
        WebElement footer =
        driver.findElement(
            By.id("footer")
        );

        js.executeScript(
            "arguments[0].scrollIntoView(true);",
            footer
        );
        Thread.sleep(3000);
        // Task 03: Scroll to Bottom of Page
        System.out.println("Executing Task 03: Scrolling to the bottom of the page...");
        js.executeScript(
            "window.scrollTo(0, document.body.scrollHeight)"
        );
        Thread.sleep(3000);
        System.out.println("--- Selenium Lab Session Ended ---");
        driver.quit();
    }
}
