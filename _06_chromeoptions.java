package Selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import java.util.Collections;

public class _06_chromeoptions {

    public static void main(String[] args) {

        WebDriver driver = null;

        try {
            // Step 1: Create ChromeOptions
            ChromeOptions options = new ChromeOptions();

            // Task 01: Incognito
            options.addArguments("--incognito");

            // Task 02: Disable automation info bar
            options.setExperimentalOption(
                    "excludeSwitches",
                    Collections.singletonList("enable-automation")
            );

            // Step 3: Launch Chrome WITH options
            driver = new ChromeDriver(options);

            // Step 4: Open worksheet
            driver.get(
                "http://127.0.0.1:5502/Java_Selinium/worksheets/ws_chrome_options.html"   //change ip according to your site link
            );

            Thread.sleep(3000);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (driver != null) {
                driver.quit();
            }
        }
    }
}