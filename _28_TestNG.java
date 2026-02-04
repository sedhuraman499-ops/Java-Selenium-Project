package Selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class _28_TestNG {

    WebDriver driver;

    // ===============================
    // Task 01: Annotations
    // @BeforeClass runs ONCE before all tests
    // ===============================
    @BeforeClass
    public void beforeClassSetup() {
        System.out.println("BeforeClass: Runs once before all tests");
    }

    // ===============================
    // Task 01: Setup
    // @BeforeMethod runs BEFORE EACH test method
    // ===============================
    @BeforeMethod
    public void setup() {
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        System.out.println("BeforeMethod: Browser launched");
    }

    // ===============================
    // Task 02: Assertions
    // ===============================
    @Test
    public void loginTest() {
        driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_testng.html");  //change ip according to your site link

        String actualTitle = driver.getTitle();
        String expectedTitle = "TestNG Worksheet";

        Assert.assertEquals(actualTitle, expectedTitle);
        System.out.println("Title verified successfully");
    }

    // ===============================
    // Cleanup
    // ===============================
    @AfterMethod
    public void tearDown() {
        driver.quit();
        System.out.println("Browser closed");
    }
}
