package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class _24_FileUpload {

    public static void main(String[] args) throws InterruptedException {

        WebDriver driver = new ChromeDriver();
        driver.manage().window().maximize();

        driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_file_upload.html");
        Thread.sleep(2000);

        // ==================================================
        // Task 01: Upload resume.pdf
        // ==================================================
        WebElement fileInput = driver.findElement(By.id("upload"));
        fileInput.sendKeys("C:\\resume.pdf");
        System.out.println("✔ resume.pdf uploaded");

        Thread.sleep(2000);

        // ==================================================
        // Task 02: Verify resume.pdf
        // ==================================================
        String value1 = fileInput.getAttribute("value");
        System.out.println("File value: " + value1);

        if (value1.contains("resume.pdf")) {
            System.out.println("✔ resume.pdf verified");
        } else {
            System.out.println("❌ resume.pdf verification failed");
        }

        Thread.sleep(2000);

        // ==================================================
        // Task 03: Upload certificate.pdf (REPLACES resume)
        // ==================================================
        fileInput.sendKeys("C:\\Users\\kumar\\OneDrive\\Documents\\certificate.pdf");
        System.out.println("✔ certificate.pdf uploaded");

        Thread.sleep(2000);

        // ==================================================
        // Click Submit button
        // ==================================================
        driver.findElement(By.className("btn-upload")).click();
        System.out.println("✔ Submit button clicked");

        Thread.sleep(2000);

        // ==================================================
        // Verify status message
        // ==================================================
        String status = driver.findElement(By.id("status")).getText();
        if (status.contains("Application Submitted")) {
            System.out.println("✅ FINAL STATUS VERIFIED");
        } else {
            System.out.println("❌ Status not displayed");
        }

        Thread.sleep(2000);
        driver.quit();
        System.out.println("--- Selenium Lab Session Ended ---");
    }
}
