# Script to convert all worksheets to split-view layout
# This script reads existing worksheet files and converts them to the new split-view format

$worksheetDir = "c:\Users\sedhu\Downloads\Java_Selinium\worksheets"
$worksheets = @(
    @{file="ws_intro.html"; topic="Introduction to Automation Testing"; 
      questions=@("Write pseudo-code logic for basic automation test", "Explain when to use automation vs manual testing", "List the advantages of using Selenium");
      code=@'
// Pseudo-code logic for Automation
if (actualTitle.equals(expectedTitle)) {
    System.out.println("Test Passed!");
} else {
    System.out.println("Test Failed!");
}

// When to automate
// 1. Repetitive tests (Regression)
// 2. Critical business flows
// 3. Time-consuming manual tests
// 4. Load/Performance testing
'@},
    
    @{file="ws_java_prerequisites.html"; topic="Java Prerequisites"; 
      questions=@("Create a simple Java class with main method", "Demonstrate inheritance with two classes", "Use ArrayList to store and iterate elements");
      code=@'
// Simple Java Class
public class SeleniumTest {
    public static void main(String[] args) {
        System.out.println("Hello Selenium!");
    }
}

// Inheritance Example
class Browser {
    void launch() {
        System.out.println("Browser launched");
    }
}

class Chrome extends Browser {
    void openDevTools() {
        System.out.println("DevTools opened");
    }
}

// ArrayList Example
import java.util.ArrayList;

ArrayList<String> browsers = new ArrayList<>();
browsers.add("Chrome");
browsers.add("Firefox");
browsers.add("Edge");

for(String browser : browsers) {
    System.out.println(browser);
}
'@},

    @{file="ws_auto_webdriver.html"; topic="Auto WebDriver Manager"; 
      questions=@("Set up WebDriverManager for Chrome", "Launch browser using WebDriverManager", "Explain the benefits of WebDriverManager");
      code=@'
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

// Setup WebDriverManager
WebDriverManager.chromedriver().setup();

// Create driver instance
WebDriver driver = new ChromeDriver();

// Navigate to URL
driver.get("https://www.google.com");

// Benefits:
// 1. Automatic driver binary management
// 2. No manual downloads needed
// 3. Always uses compatible driver version
// 4. Cross-platform support

driver.quit();
'@},

    @{file="ws_chrome_options.html"; topic="Chrome Options"; 
      questions=@("Launch Chrome in headless mode", "Start Chrome in incognito mode", "Disable Chrome extensions", "Set custom download directory");
      code=@'
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

ChromeOptions options = new ChromeOptions();

// Headless mode
options.addArguments("--headless");

// Incognito mode
options.addArguments("--incognito");

// Disable extensions
options.addArguments("--disable-extensions");

// Set download directory
options.addArguments("--download.default_directory=C:\\Downloads");

// Maximize window
options.addArguments("--start-maximized");

// Disable notifications
options.addArguments("--disable-notifications");

WebDriver driver = new ChromeDriver(options);
driver.get("https://example.com");
'@},

    @{file="ws_page_load_strategy.html"; topic="Page Load Strategy"; 
      questions=@("Use NORMAL page load strategy", "Implement EAGER strategy for faster execution", "Use NONE strategy and explain when to use it");
      code=@'
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.chrome.ChromeDriver;

ChromeOptions options = new ChromeOptions();

// NORMAL - Wait for full page load (default)
options.setPageLoadStrategy(PageLoadStrategy.NORMAL);

// EAGER - Wait for DOMContentLoaded event
options.setPageLoadStrategy(PageLoadStrategy.EAGER);

// NONE - Don't wait, return immediately
options.setPageLoadStrategy(PageLoadStrategy.NONE);

WebDriver driver = new ChromeDriver(options);
driver.get("https://example.com");

// Use EAGER for faster test execution
// Use NONE when you know exact element timing
'@},

    @{file="ws_dropdown.html"; topic="Dropdown Handling"; 
      questions=@("Select dropdown option by visible text", "Select by value attribute", "Select by index", "Get all dropdown options and print them");
      code=@'
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import java.util.List;

WebElement countryDrp = driver.findElement(By.id("country"));

Select select = new Select(countryDrp);

// Select using visible text
select.selectByVisibleText("India");

// Select using value attribute <option value="US">USA</option>
select.selectByValue("US");

// Select the first option
select.selectByIndex(0);

// Get all options to print them
List<WebElement> allOptions = select.getOptions();
for(WebElement option : allOptions) {
    System.out.println(option.getText());
}
'@}
)

Write-Host "Starting worksheet conversion to split-view layout..." -ForegroundColor Green

foreach ($ws in $worksheets) {
    $filePath = Join-Path $worksheetDir $ws.file
    
    if (Test-Path $filePath) {
        Write-Host "Processing: $($ws.file)" -ForegroundColor Yellow
        
        # Build questions HTML
        $questionsHtml = ""
        $qNum = 1
        foreach ($q in $ws.questions) {
            $questionsHtml += @"

                <div class="question-item">
                    <h3>Question $qNum</h3>
                    <p>$q</p>
                </div>
"@
            $qNum++
        }
        
        # Build code HTML
        $codeHtml = @"

                <span class="code-label">Complete Solution:</span>
                <div class="code-snippet">
                    <pre>$($ws.code)</pre>
                </div>
"@
        
        # Create new content
        $newContent = @"
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practice Worksheet - $($ws.topic)</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e1e1e 0%, #2d2d2d 100%);
            color: #333;
            min-height: 100vh;
            padding: 20px;
        }

        .worksheet-container {
            max-width: 1400px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
        }

        .header {
            background: linear-gradient(135deg, #00e676 0%, #00c853 100%);
            color: white;
            padding: 30px 40px;
            text-align: center;
        }

        .header h1 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 1rem;
            opacity: 0.95;
        }

        .split-container {
            display: grid;
            grid-template-columns: 45% 55%;
            min-height: 600px;
        }

        .questions-panel {
            background-color: #f8f9fa;
            padding: 40px;
            border-right: 3px solid #00e676;
            overflow-y: auto;
            max-height: 800px;
        }

        .code-panel {
            background-color: #1e1e1e;
            padding: 40px;
            overflow-y: auto;
            max-height: 800px;
        }

        .questions-panel h2 {
            color: #00e676;
            font-size: 1.5rem;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #00e676;
        }

        .question-item {
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            border-left: 4px solid #00e676;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .question-item h3 {
            color: #2c3e50;
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        .question-item p {
            color: #555;
            line-height: 1.6;
        }

        .code-panel h2 {
            color: #00e676;
            font-size: 1.5rem;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #00e676;
        }

        .code-snippet {
            background-color: #2d2d2d;
            color: #f8f8f2;
            padding: 20px;
            border-radius: 8px;
            font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
            font-size: 14px;
            line-height: 1.6;
            overflow-x: auto;
            margin-bottom: 20px;
            border: 1px solid #00e676;
        }

        .code-snippet pre {
            margin: 0;
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        .code-label {
            color: #00e676;
            font-size: 0.9rem;
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }

        .footer {
            background-color: #2c3e50;
            padding: 20px 40px;
            text-align: center;
        }

        .btn-back {
            display: inline-block;
            padding: 12px 30px;
            background-color: #00e676;
            color: #1e1e1e;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background-color: #00c853;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 230, 118, 0.4);
        }

        @media (max-width: 1024px) {
            .split-container {
                grid-template-columns: 1fr;
            }

            .questions-panel {
                border-right: none;
                border-bottom: 3px solid #00e676;
            }
        }
    </style>
</head>

<body>

    <div class="worksheet-container">
        <div class="header">
            <h1>$($ws.topic)</h1>
            <p>Practice Worksheet - Questions & Solutions</p>
        </div>

        <div class="split-container">
            <div class="questions-panel">
                <h2>📝 Practice Questions</h2>
$questionsHtml
            </div>

            <div class="code-panel">
                <h2>💻 Code Solutions</h2>
$codeHtml
            </div>
        </div>

        <div class="footer">
            <a href="#" onclick="window.close();" class="btn-back">← Close Worksheet</a>
        </div>
    </div>

</body>

</html>
"@
        
        # Write new content
        $newContent | Out-File -FilePath $filePath -Encoding UTF8
        Write-Host "  ✓ Converted successfully" -ForegroundColor Green
    }
    else {
        Write-Host "  ✗ File not found: $filePath" -ForegroundColor Red
    }
}

Write-Host "`nConversion complete!" -ForegroundColor Green
