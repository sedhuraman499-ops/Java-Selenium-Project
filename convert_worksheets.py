#!/usr/bin/env python3
"""
Convert all worksheets to split-view layout
Questions on left, code solutions on right
"""

import os

WORKSHEET_DIR = r"c:\Users\sedhu\Downloads\Java_Selinium\worksheets"

# Define all worksheets with their content
WORKSHEETS = [
    {
        "file": "ws_intro.html",
        "topic": "Introduction to Automation Testing",
        "questions": [
            "Write pseudo-code logic for a basic automation test",
            "Explain when automation testing should be used over manual testing",
            "List the key advantages of using Selenium for web automation"
        ],
        "code": """// Pseudo-code logic for Automation Test
String actualTitle = driver.getTitle();
String expectedTitle = "Expected Page Title";

if (actualTitle.equals(expectedTitle)) {
    System.out.println("Test Passed!");
} else {
    System.out.println("Test Failed!");
}

// When to Automate:
// 1. Repetitive tests (Regression testing)
// 2. Critical business flows
// 3. Time-consuming manual tests
// 4. Load/Performance testing
// 5. Cross-browser testing

// Selenium Advantages:
// - Open Source (Free)
// - Multi-browser support
// - Multi-language support
// - Platform independent
// - Large community support"""
    },
    {
        "file": "ws_java_prerequisites.html",
        "topic": "Java Prerequisites",
        "questions": [
            "Create a simple Java class with a main method",
            "Demonstrate inheritance with parent and child classes",
            "Use ArrayList to store and iterate through browser names"
        ],
        "code": """// 1. Simple Java Class
public class SeleniumTest {
    public static void main(String[] args) {
        System.out.println("Hello Selenium Automation!");
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
    Chrome() {
        this.name = "Chrome";
    }
    
    void openDevTools() {
        System.out.println("DevTools opened in Chrome");
    }
}

// 3. ArrayList Example
import java.util.ArrayList;

ArrayList<String> browsers = new ArrayList<>();
browsers.add("Chrome");
browsers.add("Firefox");
browsers.add("Edge");
browsers.add("Safari");

for(String browser : browsers) {
    System.out.println("Browser: " + browser);
}"""
    },
    {
        "file": "ws_auto_webdriver.html",
        "topic": "Auto WebDriver Manager",
        "questions": [
            "Set up WebDriverManager for Chrome browser",
            "Launch Chrome browser using WebDriverManager",
            "Explain the benefits of using WebDriverManager over manual driver setup"
        ],
        "code": """import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class WebDriverManagerDemo {
    public static void main(String[] args) {
        // Setup WebDriverManager (No manual download needed!)
        WebDriverManager.chromedriver().setup();
        
        // Create driver instance
        WebDriver driver = new ChromeDriver();
        
        // Navigate to URL
        driver.get("https://www.google.com");
        
        System.out.println("Page Title: " + driver.getTitle());
        
        // Close browser
        driver.quit();
    }
}

// Benefits of WebDriverManager:
// 1. Automatic driver binary management
// 2. No manual downloads needed
// 3. Always uses compatible driver version
// 4. Cross-platform support (Windows/Mac/Linux)
// 5. Handles driver updates automatically"""
    },
    {
        "file": "ws_chrome_options.html",
        "topic": "Chrome Options",
        "questions": [
            "Launch Chrome in headless mode (no UI)",
            "Start Chrome in incognito/private mode",
            "Disable Chrome extensions and notifications",
            "Set a custom download directory"
        ],
        "code": """import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import java.util.HashMap;
import java.util.Map;

ChromeOptions options = new ChromeOptions();

// 1. Headless mode (No UI)
options.addArguments("--headless");

// 2. Incognito mode
options.addArguments("--incognito");

// 3. Disable extensions
options.addArguments("--disable-extensions");

// 4. Disable notifications
options.addArguments("--disable-notifications");

// 5. Maximize window
options.addArguments("--start-maximized");

// 6. Set download directory
Map<String, Object> prefs = new HashMap<>();
prefs.put("download.default_directory", "C:\\\\Downloads");
options.setExperimentalOption("prefs", prefs);

// 7. Disable images (faster loading)
options.addArguments("--blink-settings=imagesEnabled=false");

WebDriver driver = new ChromeDriver(options);
driver.get("https://example.com");"""
    },
    {
        "file": "ws_page_load_strategy.html",
        "topic": "Page Load Strategy",
        "questions": [
            "Use NORMAL page load strategy (wait for full page load)",
            "Implement EAGER strategy for faster test execution",
            "Use NONE strategy and explain when it's appropriate"
        ],
        "code": """import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.chrome.ChromeDriver;

ChromeOptions options = new ChromeOptions();

// 1. NORMAL - Wait for full page load (default)
// Waits for all resources (images, CSS, JS)
options.setPageLoadStrategy(PageLoadStrategy.NORMAL);

// 2. EAGER - Wait for DOMContentLoaded event
// Faster, doesn't wait for images/stylesheets
options.setPageLoadStrategy(PageLoadStrategy.EAGER);

// 3. NONE - Don't wait, return immediately
// Use when you know exact element timing
options.setPageLoadStrategy(PageLoadStrategy.NONE);

WebDriver driver = new ChromeDriver(options);
driver.get("https://example.com");

// When to use each strategy:
// NORMAL: Default, most reliable
// EAGER: Faster execution, good for most tests
// NONE: Advanced usage, manual synchronization needed"""
    },
    {
        "file": "ws_locators.html",
        "topic": "Locators",
        "questions": [
            "Find element by ID",
            "Find element by Name and ClassName",
            "Find element by CSS Selector",
            "Find element by XPath (absolute and relative)"
        ],
        "code": """import org.openqa.selenium.By;
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
WebElement element = driver.findElement(By.xpath("//button[text()='Submit']"));"""
    },
    {
        "file": "ws_navigation.html",
        "topic": "Navigation Commands",
        "questions": [
            "Navigate to a URL",
            "Navigate back to previous page",
            "Navigate forward and refresh the page"
        ],
        "code": """import org.openqa.selenium.WebDriver;
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

driver.quit();"""
    },
    {
        "file": "ws_basic_html.html",
        "topic": "Basic HTML Controls",
        "questions": [
            "Enter text in a text field",
            "Click a button",
            "Select a radio button",
            "Check/uncheck a checkbox"
        ],
        "code": """import org.openqa.selenium.By;
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
System.out.println("Checkbox is checked: " + isChecked);"""
    },
    {
        "file": "ws_advanced_html.html",
        "topic": "Advanced HTML Controls",
        "questions": [
            "Handle a date picker element",
            "Interact with a slider/range input",
            "Select a color from color picker and upload a file"
        ],
        "code": """import org.openqa.selenium.By;
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
// Set value using JavaScript
js.executeScript("arguments[0].value='75'", slider);

// 3. Color Picker
WebElement colorPicker = driver.findElement(By.id("favColor"));
js.executeScript("arguments[0].value='#FF5733'", colorPicker);

// 4. File Upload
WebElement fileInput = driver.findElement(By.id("fileUpload"));
fileInput.sendKeys("C:\\\\Users\\\\Documents\\\\test.pdf");

// Verify file name
String fileName = fileInput.getAttribute("value");
System.out.println("Uploaded file: " + fileName);"""
    },
    {
        "file": "ws_dropdown.html",
        "topic": "Dropdown Handling",
        "questions": [
            "Select dropdown option by visible text",
            "Select by value attribute",
            "Select by index",
            "Get all dropdown options and print them"
        ],
        "code": """import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import java.util.List;

WebElement countryDrp = driver.findElement(By.id("country"));

Select select = new Select(countryDrp);

// 1. Select using visible text
select.selectByVisibleText("India");

// 2. Select using value attribute <option value="US">USA</option>
select.selectByValue("US");

// 3. Select by index (0-based)
select.selectByIndex(0);

// 4. Get all options
List<WebElement> allOptions = select.getOptions();
System.out.println("Total options: " + allOptions.size());

for(WebElement option : allOptions) {
    System.out.println(option.getText());
}

// Get selected option
WebElement selectedOption = select.getFirstSelectedOption();
System.out.println("Selected: " + selectedOption.getText());"""
    }
]

# HTML template
HTML_TEMPLATE = """<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Practice Worksheet - {topic}</title>
    <style>
        * {{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }}

        body {{
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e1e1e 0%, #2d2d2d 100%);
            color: #333;
            min-height: 100vh;
            padding: 20px;
        }}

        .worksheet-container {{
            max-width: 1400px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
        }}

        .header {{
            background: linear-gradient(135deg, #00e676 0%, #00c853 100%);
            color: white;
            padding: 30px 40px;
            text-align: center;
        }}

        .header h1 {{
            font-size: 2rem;
            margin-bottom: 10px;
        }}

        .header p {{
            font-size: 1rem;
            opacity: 0.95;
        }}

        .split-container {{
            display: grid;
            grid-template-columns: 45% 55%;
            min-height: 600px;
        }}

        .questions-panel {{
            background-color: #f8f9fa;
            padding: 40px;
            border-right: 3px solid #00e676;
            overflow-y: auto;
            max-height: 800px;
        }}

        .code-panel {{
            background-color: #1e1e1e;
            padding: 40px;
            overflow-y: auto;
            max-height: 800px;
        }}

        .questions-panel h2 {{
            color: #00e676;
            font-size: 1.5rem;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #00e676;
        }}

        .question-item {{
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            border-left: 4px solid #00e676;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }}

        .question-item h3 {{
            color: #2c3e50;
            font-size: 1.1rem;
            margin-bottom: 10px;
        }}

        .question-item p {{
            color: #555;
            line-height: 1.6;
        }}

        .code-panel h2 {{
            color: #00e676;
            font-size: 1.5rem;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #00e676;
        }}

        .code-snippet {{
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
        }}

        .code-snippet pre {{
            margin: 0;
            white-space: pre-wrap;
            word-wrap: break-word;
        }}

        .code-label {{
            color: #00e676;
            font-size: 0.9rem;
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }}

        .footer {{
            background-color: #2c3e50;
            padding: 20px 40px;
            text-align: center;
        }}

        .btn-back {{
            display: inline-block;
            padding: 12px 30px;
            background-color: #00e676;
            color: #1e1e1e;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: all 0.3s ease;
        }}

        .btn-back:hover {{
            background-color: #00c853;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 230, 118, 0.4);
        }}

        @media (max-width: 1024px) {{
            .split-container {{
                grid-template-columns: 1fr;
            }}

            .questions-panel {{
                border-right: none;
                border-bottom: 3px solid #00e676;
                max-height: none;
            }}
            
            .code-panel {{
                max-height: none;
            }}
        }}
    </style>
</head>

<body>

    <div class="worksheet-container">
        <div class="header">
            <h1>{topic}</h1>
            <p>Practice Worksheet - Questions & Solutions</p>
        </div>

        <div class="split-container">
            <div class="questions-panel">
                <h2>📝 Practice Questions</h2>
{questions_html}
            </div>

            <div class="code-panel">
                <h2>💻 Code Solutions</h2>
{code_html}
            </div>
        </div>

        <div class="footer">
            <a href="#" onclick="window.close();" class="btn-back">← Close Worksheet</a>
        </div>
    </div>

</body>

</html>"""


def generate_questions_html(questions):
    """Generate HTML for questions"""
    html = ""
    for i, question in enumerate(questions, 1):
        html += f"""
                <div class="question-item">
                    <h3>Question {i}</h3>
                    <p>{question}</p>
                </div>"""
    return html


def generate_code_html(code):
    """Generate HTML for code"""
    return f"""
                <span class="code-label">Complete Solution:</span>
                <div class="code-snippet">
                    <pre>{code}</pre>
                </div>"""


def main():
    print("=" * 50)
    print("Worksheet Conversion to Split-View Layout")
    print("=" * 50)
    print()
    
    success_count = 0
    fail_count = 0
    
    for ws in WORKSHEETS:
        filepath = os.path.join(WORKSHEET_DIR, ws["file"])
        print(f"Processing: {ws['file']}")
        
        try:
            # Generate HTML content
            questions_html = generate_questions_html(ws["questions"])
            code_html = generate_code_html(ws["code"])
            
            # Fill template
            html_content = HTML_TEMPLATE.format(
                topic=ws["topic"],
                questions_html=questions_html,
                code_html=code_html
            )
            
            # Write file
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(html_content)
            
            print(f"  ✓ Converted successfully")
            success_count += 1
        except Exception as e:
            print(f"  ✗ Error: {e}")
            fail_count += 1
    
    print()
    print("=" * 50)
    print("Conversion Summary")
    print("=" * 50)
    print(f"Successful: {success_count}")
    print(f"Failed: {fail_count}")
    print()
    print("Conversion complete!")


if __name__ == "__main__":
    main()
