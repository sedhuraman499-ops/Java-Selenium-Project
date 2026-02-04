package Selenium;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class _14_WaitsandSynchoronized {

    public static void main(String[] args) throws InterruptedException {

        WebDriver driver = new ChromeDriver();
        driver.manage().window().maximize();

        System.out.println("Navigating to Synchronization worksheet...");
        driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_waits.html");
        Thread.sleep(3000);

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        // ===============================
        // Task 02: Click Start Loading
        // ===============================
        WebElement startBtn = wait.until(
                ExpectedConditions.elementToBeClickable(
                        By.xpath("//button[text()='Start Loading']")
                )
        );
        startBtn.click();
        System.out.println("✔ Start Loading button clicked");

        // ===============================
        // Task 01: Wait for Success Message
        // ===============================
        WebElement msg = wait.until(
                ExpectedConditions.visibilityOfElementLocated(By.id("result"))
        );
        System.out.println("✔ Message Found: " + msg.getText());

        // ===============================
        // Task 03: Implicit Wait
        // ===============================
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        System.out.println("✔ Implicit wait set");

        driver.quit();
    }
}
