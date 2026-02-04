# PowerShell script to generate more Java Selenium worksheets - Batch 3

$worksheets = @{
    "ws_drag_drop.html" = @{
        topic = "Drag & Drop"
        questions = @(
            "Drag and drop an element to another element",
            "Drag an element by offset (x, y coordinates)",
            "Perform drag and drop using clickAndHold",
            "Verify drag and drop was successful"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import java.time.Duration;

Actions actions = new Actions(driver);

// 1. Drag and Drop (Element to Element)
WebElement source = driver.findElement(By.id("draggable"));
WebElement target = driver.findElement(By.id("droppable"));
actions.dragAndDrop(source, target).perform();

// 2. Drag by Offset
WebElement element = driver.findElement(By.id("draggable"));
actions.dragAndDropBy(element, 100, 50).perform();

// 3. Manual Drag and Drop
actions.clickAndHold(source)
       .moveToElement(target)
       .release()
       .perform();

// 4. Drag with pause
actions.clickAndHold(source)
       .pause(Duration.ofSeconds(1))
       .moveToElement(target)
       .pause(Duration.ofSeconds(1))
       .release()
       .perform();
"@
    }
    
    "ws_keyboard.html" = @{
        topic = "Keyboard Actions"
        questions = @(
            "Press Enter key",
            "Perform Ctrl+A (Select All)",
            "Copy and Paste text using keyboard",
            "Press multiple keys simultaneously"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

Actions actions = new Actions(driver);

// 1. Press Enter key
WebElement textField = driver.findElement(By.id("search"));
textField.sendKeys("Java Selenium" + Keys.ENTER);

// 2. Ctrl+A (Select All)
textField.sendKeys(Keys.CONTROL + "a");

// 3. Copy and Paste
textField.sendKeys(Keys.CONTROL + "c"); // Copy
textField.sendKeys(Keys.CONTROL + "v"); // Paste

// 4. Using Actions class for complex combinations
actions.keyDown(Keys.CONTROL)
       .sendKeys("a")
       .keyUp(Keys.CONTROL)
       .perform();

// Press Tab key
textField.sendKeys(Keys.TAB);

// Press multiple special keys
textField.sendKeys(Keys.SHIFT, Keys.HOME);
"@
    }
    
    "ws_mouse.html" = @{
        topic = "Mouse Actions"
        questions = @(
            "Perform mouse hover on an element",
            "Right-click (context click) on an element",
            "Double-click on an element",
            "Click and hold an element"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

Actions actions = new Actions(driver);

// 1. Mouse Hover
WebElement menu = driver.findElement(By.id("mainMenu"));
actions.moveToElement(menu).perform();

// 2. Right Click (Context Click)
WebElement element = driver.findElement(By.id("rightClickMe"));
actions.contextClick(element).perform();

// 3. Double Click
WebElement doubleClickElement = driver.findElement(By.id("doubleClickBtn"));
actions.doubleClick(doubleClickElement).perform();

// 4. Click and Hold
WebElement dragElement = driver.findElement(By.id("draggable"));
actions.clickAndHold(dragElement).perform();

// Move to element with offset
actions.moveToElement(element, 10, 20).perform();

// Release mouse button
actions.release().perform();
"@
    }
    
    "ws_scrolling.html" = @{
        topic = "Scrolling Page"
        questions = @(
            "Scroll to bottom of page",
            "Scroll to a specific element",
            "Scroll by pixel coordinates",
            "Scroll element into view"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;

JavascriptExecutor js = (JavascriptExecutor) driver;

// 1. Scroll to bottom of page
js.executeScript("window.scrollTo(0, document.body.scrollHeight)");

// 2. Scroll to top of page
js.executeScript("window.scrollTo(0, 0)");

// 3. Scroll to specific element
WebElement element = driver.findElement(By.id("footer"));
js.executeScript("arguments[0].scrollIntoView(true);", element);

// 4. Scroll by pixel coordinates
js.executeScript("window.scrollBy(0, 500)"); // Scroll down 500px

// 5. Scroll element into view (center)
js.executeScript("arguments[0].scrollIntoView({block: 'center'});", element);

// 6. Horizontal scroll
js.executeScript("window.scrollBy(500, 0)"); // Scroll right 500px
"@
    }
    
    "ws_window_handling.html" = @{
        topic = "Window Handling"
        questions = @(
            "Get current window handle",
            "Switch to a new window/tab",
            "Switch between multiple windows",
            "Close a specific window and switch back"
        )
        code = @"
import org.openqa.selenium.WindowType;
import java.util.Set;

// 1. Get current window handle
String mainWindow = driver.getWindowHandle();
System.out.println("Main window: " + mainWindow);

// 2. Open new tab
driver.switchTo().newWindow(WindowType.TAB);

// 3. Open new window
driver.switchTo().newWindow(WindowType.WINDOW);

// 4. Get all window handles
Set&lt;String&gt; allWindows = driver.getWindowHandles();
System.out.println("Total windows: " + allWindows.size());

// 5. Switch to new window
for(String window : allWindows) {
    if(!window.equals(mainWindow)) {
        driver.switchTo().window(window);
        break;
    }
}

// 6. Close current window and switch back
driver.close();
driver.switchTo().window(mainWindow);

// 7. Close all windows except main
for(String window : driver.getWindowHandles()) {
    if(!window.equals(mainWindow)) {
        driver.switchTo().window(window);
        driver.close();
    }
}
driver.switchTo().window(mainWindow);
"@
    }
    
    "ws_find_all_links.html" = @{
        topic = "Find All Links"
        questions = @(
            "Find all links on a page",
            "Print all link texts",
            "Count total number of links",
            "Click on a specific link by text"
        )
        code = @"
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import java.util.List;

// 1. Find all links (anchor tags)
List&lt;WebElement&gt; allLinks = driver.findElements(By.tagName("a"));

// 2. Print all link texts
for(WebElement link : allLinks) {
    String linkText = link.getText();
    String linkHref = link.getAttribute("href");
    System.out.println("Text: " + linkText + " | URL: " + linkHref);
}

// 3. Count total links
int totalLinks = allLinks.size();
System.out.println("Total links: " + totalLinks);

// 4. Click on specific link by text
for(WebElement link : allLinks) {
    if(link.getText().equals("Contact Us")) {
        link.click();
        break;
    }
}

// Find links in a specific section
WebElement footer = driver.findElement(By.id("footer"));
List&lt;WebElement&gt; footerLinks = footer.findElements(By.tagName("a"));
System.out.println("Footer links: " + footerLinks.size());
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

Write-Host "`nBatch 3 - Total worksheets created: $count" -ForegroundColor Cyan
