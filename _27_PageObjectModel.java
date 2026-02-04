package Selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class _27_PageObjectModel {

    // -------- PAGE OBJECT --------
    static class LoginPage {

        // Task 01: FindBy
        @FindBy(id = "user")
        WebElement username;

        @FindBy(id = "pass")
        WebElement password;

        // Task 02: PageFactory Initialization
        LoginPage(WebDriver driver) {
            PageFactory.initElements(driver, this);
        }

        void enterCredentials(WebDriverWait wait) {
            wait.until(ExpectedConditions.visibilityOf(username));
            username.sendKeys("admin");

            wait.until(ExpectedConditions.visibilityOf(password));
            password.sendKeys("admin123");
        }
    }

    // -------- TEST --------
    public static void main(String[] args) {

        WebDriver driver = null;

        try {
            System.out.println("--- Selenium Lab Session Started ---");

            driver = new ChromeDriver();
            driver.manage().window().maximize();

            WebDriverWait wait =
                new WebDriverWait(driver, Duration.ofSeconds(10));

            driver.get(
                "http://127.0.0.1:5502/Java_Selinium/worksheets/ws_pom.html"
            );

            System.out.println("Initializing Page Object...");
            LoginPage page = new LoginPage(driver);

            System.out.println("Entering credentials...");
            page.enterCredentials(wait);

            System.out.println("--- Selenium Lab Session Ended ---");
            Thread.sleep(2000);

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
