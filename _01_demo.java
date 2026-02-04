package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class _01_demo {

    public static void main(String[] args) throws InterruptedException {

        WebDriver driver = new ChromeDriver();
     try {
    	 
        driver.manage().window().maximize();

        driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_demo_page.html");
        Thread.sleep(2000);

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));

        // Wait until button is clickable, then click
        wait.until(ExpectedConditions.elementToBeClickable(By.id("demoBtn"))).click();
        Thread.sleep(2000);

        // Wait until result text is visible
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("result")));
        }
     catch (Exception e) {
        // Handle any exception
    	//Prints the error details in the Eclipse console for debugging
        e.printStackTrace();
    } 
        finally {
        // Always close browser || Checks if the browser was opened successfully.
            driver.quit();
        }
    }   
}
