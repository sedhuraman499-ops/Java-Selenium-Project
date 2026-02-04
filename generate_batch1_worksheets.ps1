# PowerShell script to generate all remaining Java Selenium worksheets
# This creates the HTML content for each worksheet with proper branding

$worksheets = @{
    "ws_java_prerequisites.html" = @{
        topic = "Java Prerequisites"
        questions = @(
            "Create a simple Java class with main method",
            "Demonstrate inheritance with parent and child classes",
            "Use ArrayList to store and iterate through elements",
            "Explain the difference between class and object"
        )
        code = @"
// 1. Simple Java Class
public class SeleniumTest {
    public static void main(String[] args) {
        System.out.println("Hello Java Selenium!");
    }
}

// 2. Inheritance Example
class Browser {
    String name;
    void launch() {
        System.out.println(name + " browser launched");
    }
}

class Chrome extends Browser {
    Chrome() { this.name = "Chrome"; }
    void openDevTools() {
        System.out.println("DevTools opened");
    }
}

// 3. ArrayList Example
import java.util.ArrayList;
ArrayList&lt;String&gt; browsers = new ArrayList&lt;&gt;();
browsers.add("Chrome");
browsers.add("Firefox");
browsers.add("Edge");

for(String browser : browsers) {
    System.out.println("Browser: " + browser);
}
"@
    }
    
    "ws_auto_webdriver.html" = @{
        topic = "Auto WebDriver Manager"
        questions = @(
            "Set up WebDriverManager for Chrome browser",
            "Launch browser using WebDriverManager",
            "Explain benefits of WebDriverManager over manual setup",
            "Use WebDriverManager for Firefox"
        )
        code = @"
import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

// Setup WebDriverManager
WebDriverManager.chromedriver().setup();

// Create driver instance
WebDriver driver = new ChromeDriver();
driver.get("https://www.google.com");

System.out.println("Page Title: " + driver.getTitle());

// Benefits:
// 1. Automatic driver binary management
// 2. No manual downloads needed
// 3. Always uses compatible driver version
// 4. Cross-platform support
// 5. Handles driver updates automatically

driver.quit();
"@
    }
    
    "ws_chrome_options.html" = @{
        topic = "Chrome Options"
        questions = @(
            "Launch Chrome in headless mode (no UI)",
            "Start Chrome in incognito/private mode",
            "Disable Chrome extensions and notifications",
            "Set a custom download directory"
        )
        code = @"
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.chrome.ChromeDriver;
import java.util.HashMap;
import java.util.Map;

ChromeOptions options = new ChromeOptions();

// 1. Headless mode
options.addArguments("--headless");

// 2. Incognito mode
options.addArguments("--incognito");

// 3. Disable extensions &amp; notifications
options.addArguments("--disable-extensions");
options.addArguments("--disable-notifications");

// 4. Set download directory
Map&lt;String, Object&gt; prefs = new HashMap&lt;&gt;();
prefs.put("download.default_directory", "C:\\Downloads");
options.setExperimentalOption("prefs", prefs);

// 5. Maximize window
options.addArguments("--start-maximized");

WebDriver driver = new ChromeDriver(options);
"@
    }
    
    "ws_page_load_strategy.html" = @{
        topic = "Page Load Strategy"
        questions = @(
            "Use NORMAL page load strategy (wait for full page load)",
            "Implement EAGER strategy for faster test execution",
            "Use NONE strategy and explain when appropriate",
            "Compare all three strategies"
        )
        code = @"
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.chrome.ChromeDriver;

ChromeOptions options = new ChromeOptions();

// 1. NORMAL - Wait for full page load (default)
options.setPageLoadStrategy(PageLoadStrategy.NORMAL);

// 2. EAGER - Wait for DOMContentLoaded
options.setPageLoadStrategy(PageLoadStrategy.EAGER);

// 3. NONE - Don't wait, return immediately
options.setPageLoadStrategy(PageLoadStrategy.NONE);

WebDriver driver = new ChromeDriver(options);
driver.get("https://example.com");

// When to use:
// NORMAL: Default, most reliable
// EAGER: Faster, good for most tests
// NONE: Advanced, manual sync needed
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

Write-Host "`nTotal worksheets created: $count" -ForegroundColor Cyan
