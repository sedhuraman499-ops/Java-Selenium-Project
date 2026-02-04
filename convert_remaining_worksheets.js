// Node.js script to convert all worksheets to split-view layout
const fs = require('fs');
const path = require('path');

const WORKSHEET_DIR = 'c:\\Users\\sedhu\\Downloads\\Java_Selinium\\worksheets';

// Define all worksheets with their content
const WORKSHEETS = [
    {
        file: "ws_locators.html",
        topic: "Locators",
        questions: [
            "Find element by ID",
            "Find element by Name and ClassName",
            "Find element by CSS Selector",
            "Find element by XPath (absolute and relative)"
        ],
        code: `import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

// 1. By ID (Most reliable)
WebElement element = driver.findElement(By.id("username"));

// 2. By Name
WebElement element = driver.findElement(By.name("email"));

// 3. By ClassName
WebElement element = driver.findElement(By.className("btn-primary"));

// 4. By TagName
WebElement element = driver.findElement(By.tagName("input"));

// 5. By LinkText
WebElement element = driver.findElement(By.linkText("Click Here"));

// 6. By PartialLinkText
WebElement element = driver.findElement(By.partialLinkText("Click"));

// 7. By CSS Selector
WebElement element = driver.findElement(By.cssSelector("#username"));
WebElement element = driver.findElement(By.cssSelector(".btn-primary"));
WebElement element = driver.findElement(By.cssSelector("input[name='email']"));

// 8. By XPath
WebElement element = driver.findElement(By.xpath("//input[@id='username']"));
WebElement element = driver.findElement(By.xpath("//button[text()='Submit']"));`
    },
    {
        file: "ws_waits.html",
        topic: "Waits & Synchronization",
        questions: [
            "Implement Implicit Wait",
            "Use Explicit Wait (WebDriverWait)",
            "Create Fluent Wait with custom polling",
            "Wait for element to be clickable"
        ],
        code: `import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import java.time.Duration;

// 1. Implicit Wait (Global wait for all elements)
driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

// 2. Explicit Wait (WebDriverWait)
WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
WebElement element = wait.until(
    ExpectedConditions.visibilityOfElementLocated(By.id("username"))
);

// 3. Fluent Wait (Custom polling)
FluentWait<WebDriver> fluentWait = new FluentWait<>(driver)
    .withTimeout(Duration.ofSeconds(30))
    .pollingEvery(Duration.ofSeconds(2))
    .ignoring(NoSuchElementException.class);

WebElement element = fluentWait.until(
    driver -> driver.findElement(By.id("dynamic-element"))
);

// 4. Wait for element to be clickable
WebElement button = wait.until(
    ExpectedConditions.elementToBeClickable(By.id("submitBtn"))
);
button.click();`
    },
    {
        file: "ws_alerts.html",
        topic: "Alerts & Popups",
        questions: [
            "Handle a simple JavaScript alert",
            "Accept a confirmation dialog",
            "Dismiss a confirmation dialog",
            "Enter text in a prompt and submit"
        ],
        code: `import org.openqa.selenium.Alert;

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
driver.switchTo().alert().accept();`
    },
    {
        file: "ws_iframes.html",
        topic: "iFrame Handling",
        questions: [
            "Switch to iframe by index",
            "Switch to iframe by name or ID",
            "Switch to iframe by WebElement",
            "Switch back to main content from iframe"
        ],
        code: `import org.openqa.selenium.By;
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
driver.switchTo().parentFrame();`
    },
    {
        file: "ws_keyboard.html",
        topic: "Keyboard Actions",
        questions: [
            "Press Enter key",
            "Perform Ctrl+A (Select All)",
            "Copy and Paste text using keyboard",
            "Press multiple keys simultaneously"
        ],
        code: `import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

Actions actions = new Actions(driver);

// 1. Press Enter key
WebElement textField = driver.findElement(By.id("search"));
textField.sendKeys("Selenium" + Keys.ENTER);

// 2. Ctrl+A (Select All)
textField.sendKeys(Keys.CONTROL + "a");

// 3. Copy and Paste
textField.sendKeys(Keys.CONTROL + "c"); // Copy
textField.sendKeys(Keys.CONTROL + "v"); // Paste

// 4. Using Actions class for complex key combinations
actions.keyDown(Keys.CONTROL)
       .sendKeys("a")
       .keyUp(Keys.CONTROL)
       .perform();

// Press Tab key
textField.sendKeys(Keys.TAB);

// Press multiple special keys
textField.sendKeys(Keys.SHIFT, Keys.HOME); // Select from cursor to start`
    },
    {
        file: "ws_mouse.html",
        topic: "Mouse Actions",
        questions: [
            "Perform mouse hover on an element",
            "Right-click (context click) on an element",
            "Double-click on an element",
            "Click and hold an element"
        ],
        code: `import org.openqa.selenium.By;
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
actions.release().perform();`
    },
    {
        file: "ws_drag_drop.html",
        topic: "Drag & Drop",
        questions: [
            "Drag and drop an element to another element",
            "Drag an element by offset (x, y coordinates)",
            "Perform drag and drop using clickAndHold",
            "Verify drag and drop was successful"
        ],
        code: `import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

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
       .perform();`
    },
    {
        file: "ws_scrolling.html",
        topic: "Scrolling Page",
        questions: [
            "Scroll to bottom of page",
            "Scroll to a specific element",
            "Scroll by pixel coordinates",
            "Scroll element into view"
        ],
        code: `import org.openqa.selenium.By;
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
js.executeScript("window.scrollBy(500, 0)"); // Scroll right 500px`
    },
    {
        file: "ws_window_handling.html",
        topic: "Window Handling",
        questions: [
            "Get current window handle",
            "Switch to a new window/tab",
            "Switch between multiple windows",
            "Close a specific window and switch back"
        ],
        code: `import org.openqa.selenium.WindowType;
import java.util.Set;

// 1. Get current window handle
String mainWindow = driver.getWindowHandle();
System.out.println("Main window: " + mainWindow);

// 2. Open new tab
driver.switchTo().newWindow(WindowType.TAB);

// 3. Open new window
driver.switchTo().newWindow(WindowType.WINDOW);

// 4. Get all window handles
Set<String> allWindows = driver.getWindowHandles();
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
driver.switchTo().window(mainWindow);`
    },
    {
        file: "ws_screenshots.html",
        topic: "Screenshots",
        questions: [
            "Take a full page screenshot",
            "Take a screenshot of a specific element",
            "Save screenshot with timestamp",
            "Take screenshot on test failure"
        ],
        code: `import org.openqa.selenium.OutputType;
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

// 4. Screenshot on Failure (in try-catch)
try {
    // Test code here
    driver.findElement(By.id("submit")).click();
} catch(Exception e) {
    File failureScreenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
    FileHandler.copy(failureScreenshot, new File("C:\\\\Screenshots\\\\failure.png"));
    throw e;
}`
    },
    {
        file: "ws_file_upload.html",
        topic: "File Upload",
        questions: [
            "Upload a file using sendKeys",
            "Upload multiple files",
            "Verify file upload success",
            "Handle file upload dialog using AutoIT (concept)"
        ],
        code: `import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

// 1. Simple File Upload
WebElement fileInput = driver.findElement(By.id("fileUpload"));
fileInput.sendKeys("C:\\\\Users\\\\Documents\\\\test.pdf");

// 2. Upload Multiple Files (if input allows multiple)
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

// Note: For Windows file dialogs, use Robot class or AutoIT`
    }
];

// HTML template
const HTML_TEMPLATE = (topic, questionsHtml, codeHtml) => `<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practice Worksheet - ${topic}</title>
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
                max-height: none;
            }
            
            .code-panel {
                max-height: none;
            }
        }
    </style>
</head>

<body>

    <div class="worksheet-container">
        <div class="header">
            <h1>${topic}</h1>
            <p>Practice Worksheet - Questions & Solutions</p>
        </div>

        <div class="split-container">
            <div class="questions-panel">
                <h2>📝 Practice Questions</h2>
${questionsHtml}
            </div>

            <div class="code-panel">
                <h2>💻 Code Solutions</h2>
${codeHtml}
            </div>
        </div>

        <div class="footer">
            <a href="#" onclick="window.close();" class="btn-back">← Close Worksheet</a>
        </div>
    </div>

</body>

</html>`;

function generateQuestionsHtml(questions) {
    return questions.map((q, i) => `
                <div class="question-item">
                    <h3>Question ${i + 1}</h3>
                    <p>${q}</p>
                </div>`).join('');
}

function generateCodeHtml(code) {
    // Escape HTML entities
    const escapedCode = code
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;');

    return `
                <span class="code-label">Complete Solution:</span>
                <div class="code-snippet">
                    <pre>${escapedCode}</pre>
                </div>`;
}

console.log('='.repeat(50));
console.log('Worksheet Conversion to Split-View Layout');
console.log('='.repeat(50));
console.log('');

let successCount = 0;
let failCount = 0;

WORKSHEETS.forEach(ws => {
    const filepath = path.join(WORKSHEET_DIR, ws.file);
    console.log(`Processing: ${ws.file}`);

    try {
        const questionsHtml = generateQuestionsHtml(ws.questions);
        const codeHtml = generateCodeHtml(ws.code);
        const htmlContent = HTML_TEMPLATE(ws.topic, questionsHtml, codeHtml);

        fs.writeFileSync(filepath, htmlContent, 'utf8');
        console.log('  ✓ Converted successfully');
        successCount++;
    } catch (error) {
        console.log(`  ✗ Error: ${error.message}`);
        failCount++;
    }
});

console.log('');
console.log('='.repeat(50));
console.log('Conversion Summary');
console.log('='.repeat(50));
console.log(`Successful: ${successCount}`);
console.log(`Failed: ${failCount}`);
console.log('');
console.log('Conversion complete!');
