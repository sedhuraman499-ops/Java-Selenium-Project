package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class _07_Locators {

    public static void main(String[] args) {

        WebDriver driver = null;

        try {
            // Step 01: Launch Chrome
            driver = new ChromeDriver();
            driver.manage().window().maximize();

            // Step 02: Open Worksheet
            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_locators.html");
            Thread.sleep(2000);

            // =================================================
            // Task 01: Locate Email using CSS (type=email)
            // =================================================
            WebElement email =
                    driver.findElement(By.cssSelector("input[type='email']"));
            email.sendKeys("test@example.com");
            Thread.sleep(2000);

            // =================================================
            // Task 01: Locate Password using CSS (type=password)
            // =================================================
            WebElement password =
                    driver.findElement(By.cssSelector("input[type='password']"));
            password.sendKeys("sample@gmail.com");
            Thread.sleep(2000);

            System.out.println("✔ Task 01 completed");

            // =================================================
            // Task 02: LinkText Locator
            // =================================================
            WebElement forgotPwd =
                    driver.findElement(By.linkText("Forgot Password?"));
            forgotPwd.click();
            Thread.sleep(2000);

            System.out.println("✔ Task 02 completed");

            // =================================================
            // Task 03: XPath with ID
            // =================================================
            WebElement signInBtn =
                    driver.findElement(By.xpath("//button[@id='login_button_123']"));
            signInBtn.click();
            Thread.sleep(3000);

            System.out.println("✔ Task 03 completed");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (driver != null) {
                driver.quit();
            }
        }
    }
}
