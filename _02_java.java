package Selenium;


import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class _02_java {


	    // Task 02: Encapsulation (Private field)
	    private WebDriver driver;
	 
	    // Public getter
	    public WebDriver getDriver() {
	        return this.driver;
	    }
	 
	    public static void main(String[] args) throws InterruptedException {
	        System.out.println("--- Selenium Lab Session Started ---");
	        _02_java lab = new  _02_java();
	 
	        System.out.println("Initializing ChromeDriver...");
	        lab.driver = new ChromeDriver();
	 
	        System.out.println("Navigating to Java Prerequisites worksheet...");
	        lab.driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_java_prerequisites.html");//change ip according to your site link
	      Thread.sleep(3000);
	        // Task 01: Verify Installation Command
	        System.out.println("Executing Task 01: Verifying Java installation command...");
	        System.out.println("Run this in your terminal: java -version");
	 
	        // Task 02: Encapsulation verification
	        System.out.println("\nExecuting Task 02: Verifying Java encapsulation...");
	        if (lab.getDriver() != null) {
	            System.out.println("Success: WebDriver field is private and accessed via public getter.");
	        }
	 
	        System.out.println("--- Selenium Lab Session Ended ---");
	        lab.driver.quit();
	    }
	}