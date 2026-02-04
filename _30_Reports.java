package Selenium;


import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;

public class _30_Reports {
    public static void main(String[] args) throws InterruptedException {

  WebDriver driver=new ChromeDriver();
       driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_reports.html");
        // Task 01: Setup Extent Reports
        // Initialize ExtentReports and ExtentSparkReporter
      try {
        ExtentSparkReporter spark =
                new ExtentSparkReporter(System.getProperty("user.dir") + "/report.html");

        ExtentReports extent = new ExtentReports();
        extent.attachReporter(spark);
       

        // ================================
        // Task 02: Log Status
        // Create a test and log PASS status with a message
        // ================================
        ExtentTest test = extent.createTest("Login Test");
        test.pass("Login Successful");
        System.out.println("Login Successful");
        Thread.sleep(3000);
        
        // ================================
        // Final Step: Flush Report
        // Writes the report data to report.html
        // ================================
        extent.flush();
      }
     catch (Exception e) {
        System.out.println("❌ ERROR OCCURRED");
        e.printStackTrace();

    } finally {
        if (driver != null) {
        	Thread.sleep(3000);
            driver.quit();
            System.out.println("Browser closed");
        }
    }
    }
}
   

