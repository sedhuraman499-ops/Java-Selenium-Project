package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
public class _19_MouseActions {
	public static void main(String[] args) {
		// Launch Chrome
    	WebDriver driver = new ChromeDriver();
		        try {
        
		            // Open website
		            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_mouse.html");  //change ip according to your site link
		            Actions act = new Actions(driver);
		            // Task 01 & 03: Mouse Actions (IDs hidden in solution - follow instruction!)
		            WebElement box = driver.findElement(By.className("action-area"));

		            // Task 01: Right Click (Context Click)
		            act.contextClick(box).perform();
		            Thread.sleep(3000);

		            // Task 02: Mouse Hover (ID hidden in solution - follow instruction!)
		            WebElement menu = driver.findElement(By.tagName("button"));
		            act.moveToElement(menu).perform();
		            Thread.sleep(3000);

		            // Task 03: Double Click
		            act.doubleClick(box).perform();
		            Thread.sleep(3000);

		            driver.quit();
         
		            // Keep browser open for 3 seconds
		            Thread.sleep(3000);
		        } catch (Exception e) {
		            // Handle any exception
		        	//Prints the error details in the Eclipse console for debugging
		            e.printStackTrace();
		        } finally {
		            // Always close browser || Checks if the browser was opened successfully.
		                driver.quit();
		            }
		        }
		    }

