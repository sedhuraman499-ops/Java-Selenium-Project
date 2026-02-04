package Selenium;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class _12_AdvancedHtmlcontrols {
    public static void main(String[] args) throws InterruptedException {

        WebDriver driver = new ChromeDriver();

        System.out.println("Navigating to Radios & Checks worksheet...");
        driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_advanced_html.html");   //change ip according to your site links
        Thread.sleep(3000);
        // Task 01: Radio Buttons
        System.out.println("Executing Task 01: Selecting Male Radio Button...");
        driver.findElement(By.id("m")).click();
        System.out.println("Male radio button selected.");
        Thread.sleep(3000);

        // Task 02: Checkboxes
        System.out.println("Executing Task 02: Checking 'Subscribe' only if not selected...");
        WebElement chk = driver.findElement(By.id("news"));
        if (!chk.isSelected()) {
            chk.click();
            System.out.println("'Subscribe' checkbox was checked.");
        } else {
            System.out.println("'Subscribe' checkbox was already selected.");
        }
        Thread.sleep(3000);

        // Task 03: Validation
        System.out.println("Executing Task 03: Verifying if Save button is enabled...");
        boolean isEnabled = driver.findElement(By.tagName("button")).isEnabled();
        System.out.println("Is Save button enabled: " + isEnabled);
        Thread.sleep(3000);
        driver.quit();
    }
}