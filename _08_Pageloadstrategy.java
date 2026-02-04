package Selenium;

import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class _08_Pageloadstrategy {

    public static void main(String[] args) {

        WebDriver driver = null;

        try {
            // Chrome Options
            ChromeOptions options = new ChromeOptions();

            // Task 01: EAGER - implemented
            options.setPageLoadStrategy(PageLoadStrategy.EAGER);

            // Task 02: NORMAL - default strategy (no code needed)
           System.out.println("Normal is the default because it gives the complete page state before Selenium starts interacting with elements.");
            // Task 03: NONE - shown for learning (not executed)
            // options.setPageLoadStrategy(PageLoadStrategy.NONE);

            // Launch Chrome WITH options
            driver = new ChromeDriver(options);

            // Open Page Load Strategy worksheet
            driver.get(
                "http://127.0.0.1:5502/Java_Selinium/worksheets/ws_page_load_strategy.html"  //change ip according to your site links
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
