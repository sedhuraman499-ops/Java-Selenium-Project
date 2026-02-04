package Selenium;
 
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.WebElement;
import java.util.List;
import java.time.Duration;
 
public class _09_Xpath {

    public static void main(String[] args) throws InterruptedException {

        System.out.println("--- Selenium Lab Session Started ---");
        WebDriver driver = new ChromeDriver();

        // FIX: Implicit wait added to avoid element-not-found issue
        // This ensures Selenium waits for elements before failing
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

        try {
 
            System.out.println("Navigating to XPath Basics worksheet...");
            driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_01_xpath_basics.html");
            Thread.sleep(3000);
 
            // Task 01: Simple Attribute XPath
            System.out.println("Executing Task 01: Locating 'First Name' via ID attribute...");
            driver.findElement(By.xpath("//input[@id='fname']"));
 
            // Task 02: Text-based XPath
            System.out.println("Executing Task 02: Locating 'Login' button via text()...");
            driver.findElement(By.xpath("//button[text()='Login']"));
 
            // Task 03: Multiple Attributes
            System.out.println("Executing Task 03: Locating 'Email' via multiple attributes...");
            driver.findElement(By.xpath("//input[@name='user_email_addr' and @type='email']"));
 
            // Task 04: Partial Text Match
            System.out.println("Executing Task 04: Locating checkbox via contains() text...");
            driver.findElement(By.xpath("//label[contains(text(), 'Remember')]/input"));
 
            // Task 05: Index-based XPath
            System.out.println("Executing Task 05: Locating second row in table via index...");
            driver.findElement(By.xpath("//tbody/tr[2]"));
 
            // Task 06: Sibling Navigation
            System.out.println("Executing Task 06: Locating password input via sibling label...");
            driver.findElement(By.xpath("//label[text()='Password']/following-sibling::input"));
   
            //--------------------------------------------------------------------------------------------------
            System.out.println("Navigating to XPath Advanced worksheet...");
            driver.navigate().to("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_02_xpath_advanced.html");

            // Wait for advanced page to load
            Thread.sleep(3000);
 
            // Task 01: Parent Navigation
            System.out.println("Executing Task 01: Finding parent of 'price-tag' element...");
            driver.findElement(By.xpath("//p[@class='price-tag']/parent::div"));
 
            // Task 02: Sibling Traversal
            System.out.println("Executing Task 02: Finding sibling a-tags after 'Home' link...");
            driver.findElements(By.xpath("//a[text()='Home']/following-sibling::a"));
 
            // Task 03: Complex Conditions
            System.out.println("Executing Task 03: Finding 'In Stock' products with price > $50...");
            driver.findElements(By.xpath("//div[contains(., 'In Stock')]//p[number(substring-after(text(), '$')) > 50]"));
 
            // Task 04: Descendant Selection
            System.out.println("Executing Task 04: Finding button as descendant of product_1...");
            driver.findElement(By.xpath("//div[@id='product_1']//descendant::button"));
 
            // Task 05: OR Operator
            System.out.println("Executing Task 05: Collecting both buttons and links via OR...");
            List<WebElement> elements = driver.findElements(By.xpath("//button | //a"));
 
            // Task 06: Case-Insensitive Match
            System.out.println("Executing Task 06: Finding 'Submit' button ignoring case...");
            driver.findElement(By.xpath(
                "//button[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'submit']"
            ));
 
            System.out.println("--- Selenium Lab Session Ended ---");
            Thread.sleep(3000);

        } catch (Exception e) {
            // Handle any exception
            // Prints the error details in the Eclipse console for debugging
            e.printStackTrace();
        } finally {
            // Always close browser || Checks if the browser was opened successfully.
            driver.quit();
        }
    }
}
