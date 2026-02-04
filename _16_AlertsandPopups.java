package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class _16_AlertsandPopups {

    public static void main(String[] args) {

    	WebDriver driver = new ChromeDriver();

        try {
            driver = new ChromeDriver();
            driver.manage().window().maximize();

            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_alerts.html");  //change ip according to your site link

            // ==================================================
            // TASK 01: Alert
            // ==================================================
            System.out.println("TASK 01: Alert");

            driver.findElement(By.xpath("//button[text()='Alert Me']")).click();
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("mockAlert")));
            Thread.sleep(2000);

            driver.findElement(By.xpath("//div[@id='mockAlert']//button")).click();
            System.out.println("Alert accepted");

            Thread.sleep(2000);

            // ==================================================
            // TASK 02: Confirm (Cancel)
            // ==================================================
            System.out.println("TASK 02: Confirm");

            driver.findElement(By.xpath("//button[text()='Confirm Me']")).click();
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("mockConfirm")));
            Thread.sleep(2000);

            driver.findElement(By.xpath("//div[@id='mockConfirm']//button[text()='Cancel']")).click();
            System.out.println("Confirm cancelled");

            Thread.sleep(2000);

            // ==================================================
            // TASK 03: Prompt
            // ==================================================
            System.out.println("TASK 03: Prompt");

            driver.findElement(By.xpath("//button[text()='Prompt Me']")).click();
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("mockPrompt")));
            Thread.sleep(2000);

            driver.findElement(By.id("promptInput")).sendKeys("Kumar");
            System.out.println("Entered text in prompt");

            Thread.sleep(2000);

            driver.findElement(By.xpath("//div[@id='mockPrompt']//button[text()='OK']")).click();
            System.out.println("Prompt accepted");

            Thread.sleep(3000);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (driver != null) {
                driver.quit();
                System.out.println("Browser closed");
            }
        }
    }
}
