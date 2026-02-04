package Selenium;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
public class _21_Multiselectdropdown {
	public static void main(String[] args) {
		// Launch Chrome
    	WebDriver driver = new ChromeDriver();

		 try {
		        // Open website
		            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_multi_select.html");  //change ip according to your site link
		         // Task 01-03: Multi-Select (ID hidden in solution - follow instruction!)
		            Select select = new Select(driver.findElement(By.name("fruit_selection")));

		            // Task 01: Check Multi
		            boolean isMulti = select.isMultiple();
		            System.out.println("Is Multi-Select: " + isMulti);
		            Thread.sleep(3000);

		            // Task 02: Select All
		            if (isMulti) {
		                select.selectByVisibleText("Apple");
		                select.selectByVisibleText("Banana");
		            }
		            Thread.sleep(3000);

		            // Task 03: Deselect
		            select.deselectAll();
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

