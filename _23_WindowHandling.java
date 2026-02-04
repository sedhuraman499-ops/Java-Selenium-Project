package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.Set;

public class _23_WindowHandling {

    public static void main(String[] args) {
    	
    	// Launch Chrome
        WebDriver driver = new ChromeDriver();

        try {
    
            driver.manage().window().maximize();

            System.out.println("Opening Window Handling Worksheet...");
            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_window_handling.html");   //change ip according to your site link

            // ==================================================
            // Task 01: Get Parent Window Handle
            // ==================================================
            String parentID = driver.getWindowHandle();
            System.out.println("TASK 01:");
            System.out.println("Parent Window ID   : " + parentID);
            System.out.println("Parent Window Title: " + driver.getTitle());
            System.out.println("Parent Window URL  : " + driver.getCurrentUrl());

            // ==================================================
            // Task 02: Switch to Child Window
            // ==================================================
            System.out.println("\nTASK 02: Opening child window...");
            driver.findElement(By.linkText("Click Here")).click();

            Thread.sleep(3000);

            Set<String> allWindows = driver.getWindowHandles();

            for (String windowID : allWindows) {
                if (!windowID.equals(parentID)) {
                    driver.switchTo().window(windowID);
                    System.out.println("Switched to Child Window");
                    System.out.println("Child Window ID   : " + windowID);
                    System.out.println("Child Window Title: " + driver.getTitle());
                    System.out.println("Child Window URL  : " + driver.getCurrentUrl());
                }
            }

            Thread.sleep(3000);

            // ==================================================
            // Task 03: Close Child and Return to Parent
            // ==================================================
            System.out.println("\nTASK 03: Closing child window...");
            driver.close();

            driver.switchTo().window(parentID);
            System.out.println("Returned to Parent Window");
            System.out.println("Parent Window Title: " + driver.getTitle());
            System.out.println("Parent Window URL  : " + driver.getCurrentUrl());

            System.out.println("\nALL WINDOW HANDLING TASKS COMPLETED SUCCESSFULLY ✅");

            Thread.sleep(3000);

        } catch (Exception e) {
            System.out.println("❌ ERROR OCCURRED");
            e.printStackTrace();

        } finally {
            if (driver != null) {
                driver.quit();
                System.out.println("Browser closed");
            }
        }
    }
}
