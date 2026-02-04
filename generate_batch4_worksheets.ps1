# PowerShell script to generate final Java Selenium worksheets - Batch 4

$worksheets = @{
    "ws_screenshots.html" = @{
        topic = "Screenshots"
        questions = @(
            "Take a full page screenshot",
            "Take a screenshot of a specific element",
            "Save screenshot with timestamp",
            "Take screenshot on test failure"
        )
        code = @"
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.io.FileHandler;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

// 1. Full Page Screenshot
TakesScreenshot ts = (TakesScreenshot) driver;
File source = ts.getScreenshotAs(OutputType.FILE);
File destination = new File("C:\\\\Screenshots\\\\fullpage.png");
FileHandler.copy(source, destination);

// 2. Element Screenshot
WebElement element = driver.findElement(By.id("logo"));
File elementScreenshot = element.getScreenshotAs(OutputType.FILE);
FileHandler.copy(elementScreenshot, new File("C:\\\\Screenshots\\\\element.png"));

// 3. Screenshot with Timestamp
String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
File timestampFile = new File("C:\\\\Screenshots\\\\screenshot_" + timestamp + ".png");
FileHandler.copy(source, timestampFile);

// 4. Screenshot on Failure
try {
    driver.findElement(By.id("submit")).click();
} catch(Exception e) {
    File failureScreenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
    FileHandler.copy(failureScreenshot, new File("C:\\\\Screenshots\\\\failure.png"));
    throw e;
}
"@
    }
    
    "ws_file_upload.html" = @{
        topic = "File Upload"
        questions = @(
            "Upload a file using sendKeys",
            "Upload multiple files",
            "Verify file upload success",
            "Handle file upload dialog"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;
import java.time.Duration;

// 1. Simple File Upload
WebElement fileInput = driver.findElement(By.id("fileUpload"));
fileInput.sendKeys("C:\\\\Users\\\\Documents\\\\test.pdf");

// 2. Upload Multiple Files
WebElement multiFileInput = driver.findElement(By.id("multiFileUpload"));
String file1 = "C:\\\\Users\\\\Documents\\\\file1.pdf";
String file2 = "C:\\\\Users\\\\Documents\\\\file2.pdf";
multiFileInput.sendKeys(file1 + "\\n" + file2);

// 3. Verify Upload
String fileName = fileInput.getAttribute("value");
System.out.println("Uploaded file: " + fileName);

// 4. Click Upload Button
WebElement uploadBtn = driver.findElement(By.id("uploadBtn"));
uploadBtn.click();

// Wait for upload success message
WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
WebElement successMsg = wait.until(
    ExpectedConditions.visibilityOfElementLocated(By.id("uploadSuccess"))
);
System.out.println("Upload status: " + successMsg.getText());
"@
    }
    
    "ws_exceptions.html" = @{
        topic = "Common Selenium Exceptions"
        questions = @(
            "Handle NoSuchElementException",
            "Handle StaleElementReferenceException",
            "Handle TimeoutException",
            "Handle ElementNotInteractableException"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.ElementNotInteractableException;

// 1. NoSuchElementException
try {
    driver.findElement(By.id("nonExistent")).click();
} catch(NoSuchElementException e) {
    System.out.println("Element not found: " + e.getMessage());
}

// 2. StaleElementReferenceException
try {
    WebElement element = driver.findElement(By.id("dynamic"));
    driver.navigate().refresh();
    element.click(); // This will throw stale exception
} catch(StaleElementReferenceException e) {
    // Re-find the element
    WebElement freshElement = driver.findElement(By.id("dynamic"));
    freshElement.click();
}

// 3. TimeoutException
try {
    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
    wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("slow")));
} catch(TimeoutException e) {
    System.out.println("Element did not appear in time");
}

// 4. ElementNotInteractableException
try {
    driver.findElement(By.id("hidden")).click();
} catch(ElementNotInteractableException e) {
    System.out.println("Element is not interactable");
}
"@
    }
    
    "ws_webdriver_commands.html" = @{
        topic = "WebDriver Commands"
        questions = @(
            "Launch browser and navigate to URL",
            "Get page title and current URL",
            "Close current window vs quit browser",
            "Maximize and minimize browser window"
        )
        code = @"
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;

// 1. Launch browser and navigate
WebDriver driver = new ChromeDriver();
driver.get("https://www.google.com");

// 2. Get page details
String title = driver.getTitle();
String currentUrl = driver.getCurrentUrl();
String pageSource = driver.getPageSource();

System.out.println("Title: " + title);
System.out.println("URL: " + currentUrl);

// 3. Close vs Quit
driver.close();  // Closes current window
driver.quit();   // Closes all windows and ends session

// 4. Window management
driver.manage().window().maximize();
driver.manage().window().minimize();
driver.manage().window().fullscreen();

// Set window size
driver.manage().window().setSize(new Dimension(1024, 768));

// Set window position
driver.manage().window().setPosition(new Point(0, 0));
"@
    }
    
    "ws_testng.html" = @{
        topic = "TestNG Framework"
        questions = @(
            "Create a basic TestNG test class",
            "Use @BeforeMethod and @AfterMethod annotations",
            "Implement data-driven testing with @DataProvider",
            "Run tests in parallel"
        )
        code = @"
import org.testng.annotations.*;
import org.testng.Assert;

public class TestNGExample {
    WebDriver driver;
    
    @BeforeClass
    public void setupClass() {
        System.out.println("Before Class - Setup");
    }
    
    @BeforeMethod
    public void setup() {
        driver = new ChromeDriver();
        driver.get("https://example.com");
    }
    
    @Test(priority = 1)
    public void testLogin() {
        // Test code
        Assert.assertEquals(driver.getTitle(), "Expected Title");
    }
    
    @Test(priority = 2, dataProvider = "loginData")
    public void testWithData(String username, String password) {
        // Data-driven test
        System.out.println("Testing with: " + username);
    }
    
    @DataProvider(name = "loginData")
    public Object[][] getData() {
        return new Object[][] {
            {"user1", "pass1"},
            {"user2", "pass2"}
        };
    }
    
    @AfterMethod
    public void teardown() {
        driver.quit();
    }
    
    @AfterClass
    public void teardownClass() {
        System.out.println("After Class - Cleanup");
    }
}
"@
    }
    
    "ws_maven.html" = @{
        topic = "Maven Project Structure"
        questions = @(
            "Create a Maven project structure",
            "Add Selenium dependencies to pom.xml",
            "Understand Maven lifecycle phases",
            "Run tests using Maven commands"
        )
        code = @"
&lt;!-- pom.xml structure --&gt;
&lt;project&gt;
    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
    &lt;groupId&gt;com.javaselenium&lt;/groupId&gt;
    &lt;artifactId&gt;selenium-automation&lt;/artifactId&gt;
    &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
    
    &lt;dependencies&gt;
        &lt;!-- Selenium Java --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.seleniumhq.selenium&lt;/groupId&gt;
            &lt;artifactId&gt;selenium-java&lt;/artifactId&gt;
            &lt;version&gt;4.15.0&lt;/version&gt;
        &lt;/dependency&gt;
        
        &lt;!-- TestNG --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.testng&lt;/groupId&gt;
            &lt;artifactId&gt;testng&lt;/artifactId&gt;
            &lt;version&gt;7.8.0&lt;/version&gt;
        &lt;/dependency&gt;
    &lt;/dependencies&gt;
&lt;/project&gt;

// Maven Commands:
// mvn clean - Clean the project
// mvn compile - Compile source code
// mvn test - Run tests
// mvn package - Create JAR/WAR
// mvn install - Install to local repository
"@
    }
    
    "ws_pom.html" = @{
        topic = "Page Object Model"
        questions = @(
            "Create a Page Object class",
            "Use @FindBy annotation",
            "Implement PageFactory pattern",
            "Write test using Page Objects"
        )
        code = @"
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

// Page Object Class
public class LoginPage {
    WebDriver driver;
    
    // Page Elements using @FindBy
    @FindBy(id = "username")
    WebElement usernameField;
    
    @FindBy(id = "password")
    WebElement passwordField;
    
    @FindBy(id = "loginBtn")
    WebElement loginButton;
    
    // Constructor
    public LoginPage(WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this);
    }
    
    // Page Methods
    public void enterUsername(String username) {
        usernameField.sendKeys(username);
    }
    
    public void enterPassword(String password) {
        passwordField.sendKeys(password);
    }
    
    public void clickLogin() {
        loginButton.click();
    }
    
    public void login(String username, String password) {
        enterUsername(username);
        enterPassword(password);
        clickLogin();
    }
}

// Test Class
public class LoginTest {
    @Test
    public void testLogin() {
        WebDriver driver = new ChromeDriver();
        LoginPage loginPage = new LoginPage(driver);
        loginPage.login("testuser", "password123");
    }
}
"@
    }
    
    "ws_reports.html" = @{
        topic = "Test Reports"
        questions = @(
            "Generate TestNG HTML reports",
            "Create ExtentReports",
            "Add screenshots to reports",
            "Customize report appearance"
        )
        code = @"
import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;
import com.aventstack.extentreports.Status;

public class ReportExample {
    static ExtentReports extent;
    static ExtentTest test;
    
    @BeforeClass
    public void setupReport() {
        // Create ExtentReports instance
        extent = new ExtentReports();
        ExtentSparkReporter spark = new ExtentSparkReporter("reports/TestReport.html");
        extent.attachReporter(spark);
        
        // Add system info
        extent.setSystemInfo("OS", "Windows 11");
        extent.setSystemInfo("Browser", "Chrome");
        extent.setSystemInfo("Tester", "Java Selenium Team");
    }
    
    @Test
    public void testExample() {
        test = extent.createTest("Login Test");
        test.log(Status.INFO, "Starting test");
        test.log(Status.PASS, "Login successful");
        
        // Add screenshot
        String screenshotPath = "screenshots/login.png";
        test.addScreenCaptureFromPath(screenshotPath);
    }
    
    @AfterClass
    public void teardownReport() {
        extent.flush();
    }
}

// TestNG default reports location:
// test-output/index.html
"@
    }
    
    "ws_localhost.html" = @{
        topic = "Connect with LocalHost"
        questions = @(
            "Connect to localhost application",
            "Test local development server",
            "Handle different ports",
            "Test local file paths"
        )
        code = @"
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

// 1. Connect to localhost with default port
WebDriver driver = new ChromeDriver();
driver.get("http://localhost:8080");

// 2. Connect to specific port
driver.get("http://localhost:3000");
driver.get("http://localhost:4200"); // Angular
driver.get("http://localhost:5000"); // Flask

// 3. Connect to local IP
driver.get("http://127.0.0.1:8080");

// 4. Open local HTML file
driver.get("file:///C:/Users/Projects/index.html");

// 5. Test local application
driver.get("http://localhost:8080/login");
System.out.println("Page Title: " + driver.getTitle());

// 6. Handle localhost with HTTPS
ChromeOptions options = new ChromeOptions();
options.setAcceptInsecureCerts(true);
WebDriver driver2 = new ChromeDriver(options);
driver2.get("https://localhost:8443");

driver.quit();
"@
    }
    
    "ws_demo_page.html" = @{
        topic = "Demo Practice Page"
        questions = @(
            "Practice all learned concepts",
            "Create end-to-end test scenario",
            "Combine multiple techniques",
            "Build a complete test suite"
        )
        code = @"
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.*;

public class DemoTest {
    WebDriver driver;
    
    @BeforeMethod
    public void setup() {
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://demo.automationtesting.in/Register.html");
    }
    
    @Test
    public void completeFormTest() {
        // Fill form fields
        driver.findElement(By.xpath("//input[@placeholder='First Name']"))
              .sendKeys("Java");
        driver.findElement(By.xpath("//input[@placeholder='Last Name']"))
              .sendKeys("Selenium");
        
        // Select radio button
        driver.findElement(By.xpath("//input[@value='Male']")).click();
        
        // Select checkbox
        driver.findElement(By.id("checkbox1")).click();
        
        // Select dropdown
        Select skillDropdown = new Select(driver.findElement(By.id("Skills")));
        skillDropdown.selectByVisibleText("Java");
        
        // Take screenshot
        TakesScreenshot ts = (TakesScreenshot) driver;
        File screenshot = ts.getScreenshotAs(OutputType.FILE);
        
        // Submit form
        driver.findElement(By.id("submitbtn")).click();
    }
    
    @AfterMethod
    public void teardown() {
        driver.quit();
    }
}
"@
    }
    
    "ws_extras.html" = @{
        topic = "Extras & Best Practices"
        questions = @(
            "Implement implicit and explicit waits properly",
            "Use try-catch for exception handling",
            "Follow naming conventions",
            "Implement logging and reporting"
        )
        code = @"
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class BestPractices {
    private static final Logger logger = LogManager.getLogger(BestPractices.class);
    
    // 1. Use constants for locators
    private static final String USERNAME_ID = "username";
    private static final String PASSWORD_ID = "password";
    
    // 2. Implement proper waits
    public WebElement waitForElement(By locator) {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        return wait.until(ExpectedConditions.visibilityOfElementLocated(locator));
    }
    
    // 3. Exception handling
    public void safeClick(By locator) {
        try {
            WebElement element = waitForElement(locator);
            element.click();
            logger.info("Clicked on element: " + locator);
        } catch(Exception e) {
            logger.error("Failed to click: " + e.getMessage());
            takeScreenshot("error_" + System.currentTimeMillis());
        }
    }
    
    // 4. Reusable methods
    public void login(String username, String password) {
        driver.findElement(By.id(USERNAME_ID)).sendKeys(username);
        driver.findElement(By.id(PASSWORD_ID)).sendKeys(password);
        safeClick(By.id("loginBtn"));
    }
    
    // 5. Clean up resources
    @AfterClass
    public void cleanup() {
        if(driver != null) {
            driver.quit();
        }
    }
}
"@
    }
}

# HTML Template function
function Get-WorksheetHTML {
    param($topic, $questions, $code)
    
    $questionsHTML = ""
    for ($i = 0; $i -lt $questions.Count; $i++) {
        $num = $i + 1
        $questionsHTML += "<div class=`"question-item`"><h3>Question $num</h3><p>$($questions[$i])</p></div>`r`n                "
    }
    
    return @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Selenium - $topic</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #1e1e1e 0%, #2d2d2d 100%); color: #333; min-height: 100vh; padding: 20px; }
        .worksheet-container { max-width: 1400px; margin: 0 auto; background-color: #fff; border-radius: 10px; overflow: hidden; box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3); }
        .header { background: linear-gradient(135deg, #00e676 0%, #00c853 100%); color: white; padding: 30px 40px; text-align: center; }
        .header h1 { font-size: 2rem; margin-bottom: 10px; }
        .header h2 { font-size: 1.5rem; margin: 10px 0; }
        .header p { font-size: 1rem; opacity: 0.95; }
        .split-container { display: grid; grid-template-columns: 45% 55%; min-height: 600px; }
        .questions-panel { background-color: #f8f9fa; padding: 40px; border-right: 3px solid #00e676; overflow-y: auto; max-height: 800px; }
        .code-panel { background-color: #1e1e1e; padding: 40px; overflow-y: auto; max-height: 800px; }
        .questions-panel h2 { color: #00e676; font-size: 1.5rem; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #00e676; }
        .question-item { background-color: white; padding: 20px; margin-bottom: 20px; border-radius: 8px; border-left: 4px solid #00e676; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); }
        .question-item h3 { color: #2c3e50; font-size: 1.1rem; margin-bottom: 10px; }
        .question-item p { color: #555; line-height: 1.6; }
        .code-panel h2 { color: #00e676; font-size: 1.5rem; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #00e676; }
        .code-snippet { background-color: #2d2d2d; color: #f8f8f2; padding: 20px; border-radius: 8px; font-family: 'Consolas', 'Monaco', 'Courier New', monospace; font-size: 14px; line-height: 1.6; overflow-x: auto; margin-bottom: 20px; border: 1px solid #00e676; }
        .code-snippet pre { margin: 0; white-space: pre-wrap; word-wrap: break-word; }
        .code-label { color: #00e676; font-size: 0.9rem; font-weight: bold; margin-bottom: 10px; display: block; }
        .footer { background-color: #2c3e50; padding: 20px 40px; text-align: center; }
        .btn-back { display: inline-block; padding: 12px 30px; background-color: #00e676; color: #1e1e1e; text-decoration: none; border-radius: 5px; font-weight: bold; transition: all 0.3s ease; }
        .btn-back:hover { background-color: #00c853; transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0, 230, 118, 0.4); }
        @media (max-width: 1024px) { .split-container { grid-template-columns: 1fr; } .questions-panel { border-right: none; border-bottom: 3px solid #00e676; max-height: none; } .code-panel { max-height: none; } }
    </style>
</head>
<body>
    <div class="worksheet-container">
        <div class="header">
            <h1>Java Selenium</h1>
            <h2>$topic</h2>
            <p>Practice Worksheet - Questions &amp; Solutions</p>
        </div>
        <div class="split-container">
            <div class="questions-panel">
                <h2>📝 Practice Questions</h2>
                $questionsHTML
            </div>
            <div class="code-panel">
                <h2>💻 Code Solutions</h2>
                <span class="code-label">Complete Solution:</span>
                <div class="code-snippet"><pre>$code</pre></div>
            </div>
        </div>
        <div class="footer">
            <a href="#" onclick="window.close();" class="btn-back">← Close Worksheet</a>
        </div>
    </div>
</body>
</html>
"@
}

# Generate worksheets
$count = 0
foreach ($file in $worksheets.Keys) {
    $ws = $worksheets[$file]
    $html = Get-WorksheetHTML -topic $ws.topic -questions $ws.questions -code $ws.code
    $path = "c:\Users\sedhu\Downloads\Java_Selinium\worksheets\$file"
    $html | Out-File -FilePath $path -Encoding UTF8
    Write-Host "Created: $file" -ForegroundColor Green
    $count++
}

Write-Host "`nBatch 4 (Final) - Total worksheets created: $count" -ForegroundColor Cyan
Write-Host "`n========================================" -ForegroundColor Green
Write-Host "ALL WORKSHEETS COMPLETED!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
