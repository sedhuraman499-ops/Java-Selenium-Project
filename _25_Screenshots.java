package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public class _25_Screenshots {

    public static void main(String[] args) {

        WebDriver driver = new ChromeDriver();

        try {
            driver.manage().window().maximize();
            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_screenshots.html");
            Thread.sleep(3000);

            // ===============================
            // Task 01: Capture Page Screenshot
            // ===============================
            TakesScreenshot ts = (TakesScreenshot) driver;
            File pageSrc = ts.getScreenshotAs(OutputType.FILE);

            File pageDest = new File("error.png");

            Files.copy(
                pageSrc.toPath(),
                pageDest.toPath(),
                StandardCopyOption.REPLACE_EXISTING
            );

            System.out.println("Page screenshot saved at:");
            System.out.println(pageDest.getAbsolutePath());

            // ===============================
            // Task 02: Element Screenshot
            // ===============================
            WebElement submitBtn = driver.findElement(By.id("submit"));
            File elementSrc = submitBtn.getScreenshotAs(OutputType.FILE);

            File elementDest = new File("button.png");

            Files.copy(
                elementSrc.toPath(),
                elementDest.toPath(),
                StandardCopyOption.REPLACE_EXISTING
            );

            System.out.println("Element screenshot saved at:");
            System.out.println(elementDest.getAbsolutePath());

            System.out.println("ALL SCREENSHOT TASKS COMPLETED ✅");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }
}
