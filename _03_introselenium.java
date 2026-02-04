package Selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class _03_introselenium {

    public static void main(String[] args) {

        WebDriver driver = null;

        try {
            // Launch Chrome (ChromeDriver must be in PATH)
            driver = new ChromeDriver();

            // Open worksheet
            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_intro.html");
            Thread.sleep(2000);

            // ===============================
            // Task 01: Dependencies
            // ===============================
            System.out.println("Task 01: Selenium Maven Dependency");
            System.out.println(
                "<dependency>\n" +
                "    <groupId>org.seleniumhq.selenium</groupId>\n" +
                "    <artifactId>selenium-java</artifactId>\n" +
                "    <version>4.10.0</version>\n" +
                "</dependency>"
            );

            // ===============================
            // Task 02: Setup
            // ===============================
            System.out.println("\nTask 02: WebDriverManager Setup Line");
            System.out.println("WebDriverManager.chromedriver().setup();");

            Thread.sleep(2000);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (driver != null) {
                driver.quit();
            }
        }
    }
}
