package Selenium;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

public class _13_DropDownHandling {
	public static void main(String[] args) {
		// Launch Chrome
		 WebDriver driver = new ChromeDriver();
		      
		        try {
	  
		            // Open website
		            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_dropdown.html");//change ip according to your site link
		            // Task 01: Dropdown Selection (ID hidden in solution - follow instruction!)
		            WebElement dd = driver.findElement(By.name("dest_country"));
		            Select select = new Select(dd);

		            // Task 01: Select by Visible Text
		            select.selectByVisibleText("India");
		            Thread.sleep(3000);
		            // Task 02: Select by Index
		            select.selectByIndex(3);
		            Thread.sleep(3000);

		            // Task 03: Get All Options
		            List<WebElement> allOptions = select.getOptions();
		            for(WebElement option : allOptions) {
		                System.out.println(option.getText());
		            }

		           
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



