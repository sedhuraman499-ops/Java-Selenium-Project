package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class _26_CommonExceptions {

    public static void main(String[] args) {

        System.out.println("--- Selenium Lab Session Started ---");

        WebDriver driver = new ChromeDriver();
        driver.manage().window().maximize();

        driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_exceptions.html");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        // ==================================================
        // TASK 01: StaleElementReferenceException
        // ==================================================
        System.out.println("\nTASK 01: StaleElementReferenceException");

        System.out.println(
            "CAUSE: StaleElementReferenceException occurs when an element is located,\n" +
            "but the DOM gets refreshed or changed and Selenium tries to use the old reference."
        );

        WebElement btn = driver.findElement(By.id("btn"));

        // DOM change
        driver.navigate().refresh();

        try {
            btn.click(); // ❌ stale reference
        } catch (StaleElementReferenceException e) {

            System.out.println(
                "FIX: Re-locate the element after DOM change and then perform action again."
            );

            // FIX
            btn = driver.findElement(By.id("btn"));
            btn.click();

            System.out.println("✔ StaleElementReferenceException fixed successfully");
        }

        // ==================================================
        // TASK 02: NoSuchElementException
        // ==================================================
        System.out.println("\nTASK 02: NoSuchElementException");

        System.out.println(
            "CAUSE: Locator is correct, but element is not yet present in the DOM\n" +
            "when Selenium tries to find it (timing issue)."
        );

        try {
            driver.findElement(By.id("dynamicBtn")).click(); // ❌ too early
        } catch (NoSuchElementException e) {

            System.out.println(
                "FIX: Use Explicit Wait (WebDriverWait) to wait until the element is visible."
            );
        }

        // FIX USING WAIT
        WebElement dynamicBtn = wait.until(
                ExpectedConditions.visibilityOfElementLocated(By.id("dynamicBtn"))
        );
        dynamicBtn.click();

        System.out.println("✔ NoSuchElementException fixed using WebDriverWait");

        // ==================================================
        // END
        // ==================================================
        System.out.println("\n--- Selenium Lab Session Ended ---");
        driver.quit();
    }
}
