package Selenium;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import java.util.List;
public class _22_FindAllLinksonpage {
	public static void main(String[] args) {
		
        // Launch Chrome
		    WebDriver driver = new ChromeDriver();
		        try {	      
		          	// Open website 
		            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_find_all_links.html");  //change ip according to your site link
		         // Task 01: Find All Anchors
		            List<WebElement> links = driver.findElements(By.tagName("a"));
		            System.out.println("Total Links Found: " + links.size());
		            Thread.sleep(3000);

		            // Task 02: Iterate & Print href
		            for(WebElement link : links) {
		                String href = link.getAttribute("href");
		                if(href != null) {
		                    System.out.println(href);
		                }
		            }
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