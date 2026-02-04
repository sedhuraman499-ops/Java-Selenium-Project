package Selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class _29_MavenProjectStructure {
	public static void main(String[] args) {
		
		 // Launch Chrome
		    WebDriver   driver = new ChromeDriver();
		        try {

		            // Open website
		            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_maven.html"); //change ip according to your site link
		         // Task 01: POM.xml Dependency
		            String dependency = 
		                "<dependency>\n" +
		                "    <groupId>org.seleniumhq.selenium</groupId>\n" +
		                "    <artifactId>selenium-java</artifactId>\n" +
		                "    <version>4.10.0</version>\n" +
		                "</dependency>";
		            
		            System.out.println("Add this to your pom.xml:\n" + dependency);

		            // Task 02: Execution Command
		            String cmd = "mvn clean test";
		            System.out.println("\nRun this command in terminal: " + cmd);
		      
		           
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
