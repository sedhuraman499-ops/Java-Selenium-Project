package Selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class _31_Extras {

    public static void main(String[] args) {

        WebDriver driver = null;

        try {
            // ================================
            // Task 02: Command Line Params
            // mvn test -Dbrowser=chrome
            // ================================
            String browser = System.getProperty("browser", "chrome");
            System.out.println("Browser passed from Maven command: " + browser);

            // ================================
            // Task 01: Headless Mode
            // ================================
            if (browser.equalsIgnoreCase("chrome")) {

                ChromeOptions options = new ChromeOptions();
                options.addArguments("--headless"); // No UI
                options.addArguments("--disable-gpu");

                driver = new ChromeDriver(options);
                System.out.println("Chrome launched in Headless mode");

            } else {
                throw new RuntimeException("Only Chrome is supported in this task");
            }

            driver.get("https://www.google.com");
            Thread.sleep(2000);

            System.out.println("Tasks executed successfully ✅");

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
