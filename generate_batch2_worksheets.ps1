# PowerShell script to generate more Java Selenium worksheets - Batch 2

$worksheets = @{
    "ws_navigation.html" = @{
        topic = "Navigation Commands"
        questions = @(
            "Navigate to a URL using get() method",
            "Navigate back to previous page",
            "Navigate forward and refresh the page",
            "Get current URL and page title"
        )
        code = @"
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

WebDriver driver = new ChromeDriver();

// 1. Navigate to URL
driver.get("https://www.google.com");
// OR
driver.navigate().to("https://www.google.com");

// 2. Navigate Back
driver.navigate().back();

// 3. Navigate Forward
driver.navigate().forward();

// 4. Refresh Page
driver.navigate().refresh();

// Get current URL
String currentUrl = driver.getCurrentUrl();
System.out.println("Current URL: " + currentUrl);

// Get page title
String title = driver.getTitle();
System.out.println("Page Title: " + title);

driver.quit();
"@
    }
    
    "ws_basic_html.html" = @{
        topic = "Basic HTML Controls"
        questions = @(
            "Enter text in a text field",
            "Click a button",
            "Select a radio button",
            "Check/uncheck a checkbox"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

// 1. Text Field - Enter text
WebElement textField = driver.findElement(By.id("username"));
textField.sendKeys("testuser@example.com");

// Clear existing text
textField.clear();
textField.sendKeys("newuser@example.com");

// 2. Button - Click
WebElement button = driver.findElement(By.id("submitBtn"));
button.click();

// 3. Radio Button - Select
WebElement radioBtn = driver.findElement(By.id("male"));
if (!radioBtn.isSelected()) {
    radioBtn.click();
}

// 4. Checkbox - Check/Uncheck
WebElement checkbox = driver.findElement(By.id("terms"));
if (!checkbox.isSelected()) {
    checkbox.click(); // Check
}

// Verify if checkbox is selected
boolean isChecked = checkbox.isSelected();
System.out.println("Checkbox is checked: " + isChecked);
"@
    }
    
    "ws_advanced_html.html" = @{
        topic = "Advanced HTML Controls"
        questions = @(
            "Handle a date picker element",
            "Interact with a slider/range input",
            "Select a color from color picker",
            "Upload a file using file input"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.JavascriptExecutor;

JavascriptExecutor js = (JavascriptExecutor) driver;

// 1. Date Picker
WebElement datePicker = driver.findElement(By.id("dob"));
datePicker.sendKeys("12/25/2024");
// OR use JavaScript
js.executeScript("arguments[0].value='2024-12-25'", datePicker);

// 2. Slider/Range Input
WebElement slider = driver.findElement(By.id("priceRange"));
js.executeScript("arguments[0].value='75'", slider);

// 3. Color Picker
WebElement colorPicker = driver.findElement(By.id("favColor"));
js.executeScript("arguments[0].value='#FF5733'", colorPicker);

// 4. File Upload
WebElement fileInput = driver.findElement(By.id("fileUpload"));
fileInput.sendKeys("C:\\\\Users\\\\Documents\\\\test.pdf");

// Verify file name
String fileName = fileInput.getAttribute("value");
System.out.println("Uploaded file: " + fileName);
"@
    }
    
    "ws_multi_select.html" = @{
        topic = "Multi-Select Dropdown"
        questions = @(
            "Select multiple options from a multi-select dropdown",
            "Deselect a specific option",
            "Deselect all options",
            "Get all selected options"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import java.util.List;

WebElement multiSelectElement = driver.findElement(By.id("skills"));
Select select = new Select(multiSelectElement);

// 1. Select multiple options
select.selectByVisibleText("Java");
select.selectByVisibleText("Python");
select.selectByVisibleText("JavaScript");

// 2. Deselect a specific option
select.deselectByVisibleText("Python");

// 3. Deselect all options
select.deselectAll();

// 4. Get all selected options
List&lt;WebElement&gt; selectedOptions = select.getAllSelectedOptions();
for(WebElement option : selectedOptions) {
    System.out.println("Selected: " + option.getText());
}

// Check if multi-select
boolean isMultiple = select.isMultiple();
System.out.println("Is Multi-Select: " + isMultiple);
"@
    }
    
    "ws_iframes.html" = @{
        topic = "iFrame Handling"
        questions = @(
            "Switch to iframe by index",
            "Switch to iframe by name or ID",
            "Switch to iframe by WebElement",
            "Switch back to main content from iframe"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

// 1. Switch to iframe by index (0-based)
driver.switchTo().frame(0);

// 2. Switch to iframe by name or ID
driver.switchTo().frame("frameName");
driver.switchTo().frame("frameId");

// 3. Switch to iframe by WebElement
WebElement iframeElement = driver.findElement(By.id("myFrame"));
driver.switchTo().frame(iframeElement);

// Interact with elements inside iframe
WebElement elementInFrame = driver.findElement(By.id("insideFrame"));
elementInFrame.click();

// 4. Switch back to main content
driver.switchTo().defaultContent();

// Switch to parent frame (if nested iframes)
driver.switchTo().parentFrame();
"@
    }
    
    "ws_alerts.html" = @{
        topic = "Alerts & Popups"
        questions = @(
            "Handle a simple JavaScript alert",
            "Accept a confirmation dialog",
            "Dismiss a confirmation dialog",
            "Enter text in a prompt and submit"
        )
        code = @"
import org.openqa.selenium.Alert;

// 1. Simple Alert - Accept
Alert alert = driver.switchTo().alert();
String alertText = alert.getText();
System.out.println("Alert text: " + alertText);
alert.accept();

// 2. Confirmation Dialog - Accept
Alert confirmAlert = driver.switchTo().alert();
confirmAlert.accept(); // Click OK

// 3. Confirmation Dialog - Dismiss
Alert confirmAlert = driver.switchTo().alert();
confirmAlert.dismiss(); // Click Cancel

// 4. Prompt - Enter text and submit
Alert promptAlert = driver.switchTo().alert();
promptAlert.sendKeys("Test User");
promptAlert.accept();

// Get text from alert before accepting
String text = driver.switchTo().alert().getText();
driver.switchTo().alert().accept();
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

Write-Host "`nBatch 2 - Total worksheets created: $count" -ForegroundColor Cyan
