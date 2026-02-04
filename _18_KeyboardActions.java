package Selenium;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
public class _18_KeyboardActions {
	public static void main(String[] args) {
		
   try {
		// Launch Chrome
		 WebDriver driver = new ChromeDriver();
		            
	    // Open website
		 driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_keyboard.html");  //change ip according to your site link

		 Actions act = new Actions(driver);
	    // Task 01: Keyboard (ID hidden in solution - follow instruction!)
		 WebElement box1 = driver.findElement(By.xpath("//input[1]"));

	    // Task 01: Type in UPPERCASE
		 act.keyDown(Keys.SHIFT).sendKeys(box1, "selenium").keyUp(Keys.SHIFT).perform();
		 Thread.sleep(3000);

	   // Task 02: Copy and Paste Text
		  act.keyDown(Keys.CONTROL).sendKeys("a").sendKeys("c").keyUp(Keys.CONTROL).perform();
		  Thread.sleep(3000);
       // Task 02: Copy/Paste (ID hidden in solution - follow instruction!)
		  WebElement box2 = driver.findElement(By.xpath("//input[2]"));
		  act.click(box2).keyDown(Keys.CONTROL).sendKeys("v").keyUp(Keys.CONTROL).perform();
		  Thread.sleep(3000);

	   // Task 03: Press ENTER Key
		  box1.clear();
		  Thread.sleep(3000);
		  box1.sendKeys("automation");
		  box1.sendKeys(Keys.ENTER);
		  Thread.sleep(3000);
		  driver.quit();
       // Keep browser open for 3 seconds
		  Thread.sleep(3000);
		 } catch (Exception e) {
		       // Handle any exception
		       //Prints the error details in the Eclipse console for debugging
		         e.printStackTrace();
		        } 
		      }
		  }

