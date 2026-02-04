#!/usr/bin/env python3
import os
import json

# Define all HTML files to create with their content templates
files_config = {
    # Module 04 - Selenium Basics
    "04. Selenium Basics/02_Browser_Commands/02_Browser_Commands.html": ("Browser Commands", "Selenium Basics", "../04_Selenium_Basics.html", "Browser Operations", "Get and manage browser windows", [
        ("Maximize Window", "driver.manage().window().maximize();"),
        ("Set Window Size", "driver.manage().window().setSize(new Dimension(1920, 1080));"),
        ("Get Window Size", "Dimension size = driver.manage().window().getSize();"),
        ("Refresh Page", "driver.navigate().refresh();"),
        ("Navigate Back", "driver.navigate().back();"),
        ("Navigate Forward", "driver.navigate().forward();"),
    ], "../02_Browser_Commands/02_Browser_Commands.html", "../01_WebDriver_Overview/01_WebDriver_Overview.html", "../03_Navigation_Commands/03_Navigation_Commands.html"),
    
    "04. Selenium Basics/03_Navigation_Commands/03_Navigation_Commands.html": ("Navigation Commands", "Selenium Basics", "../04_Selenium_Basics.html", "Navigation Operations", "Navigate between pages and manage history", [
        ("Get Current URL", "String url = driver.getCurrentUrl();"),
        ("Get Page Title", "String title = driver.getTitle();"),
        ("Navigate to URL", "driver.navigate().to(\"https://example.com\");"),
        ("Go Back", "driver.navigate().back();"),
        ("Go Forward", "driver.navigate().forward();"),
        ("Refresh Page", "driver.navigate().refresh();"),
    ], "../03_Navigation_Commands/03_Navigation_Commands.html", "../02_Browser_Commands/02_Browser_Commands.html", "../04_Locators/04_Locators.html"),
    
    "04. Selenium Basics/04_Locators/04_Locators.html": ("Locators", "Selenium Basics", "../04_Selenium_Basics.html", "Finding Elements", "Strategies for locating web elements", [
        ("By ID", "driver.findElement(By.id(\"elementId\"));"),
        ("By Name", "driver.findElement(By.name(\"elementName\"));"),
        ("By Class Name", "driver.findElement(By.className(\"className\"));"),
        ("By CSS Selector", "driver.findElement(By.cssSelector(\"input[type=text]\"));"),
        ("By XPath", "driver.findElement(By.xpath(\"//button[@id='submit']\"));"),
        ("By Link Text", "driver.findElement(By.linkText(\"Click Here\"));"),
    ], "../04_Locators/04_Locators.html", "../03_Navigation_Commands/03_Navigation_Commands.html", "../05_WebElement_Methods/05_WebElement_Methods.html"),
    
    "04. Selenium Basics/05_WebElement_Methods/05_WebElement_Methods.html": ("WebElement Methods", "Selenium Basics", "../04_Selenium_Basics.html", "Element Interactions", "Methods for interacting with web elements", [
        ("Click", "element.click();"),
        ("SendKeys", "element.sendKeys(\"text\");"),
        ("Clear", "element.clear();"),
        ("Get Text", "String text = element.getText();"),
        ("Get Attribute", "String value = element.getAttribute(\"value\");"),
        ("Is Displayed", "boolean displayed = element.isDisplayed();"),
    ], "../05_WebElement_Methods/05_WebElement_Methods.html", "../04_Locators/04_Locators.html", "../06_Basic_HTML_Controls/06_Basic_HTML_Controls.html"),
    
    "04. Selenium Basics/06_Basic_HTML_Controls/06_Basic_HTML_Controls.html": ("Basic HTML Controls", "Selenium Basics", "../04_Selenium_Basics.html", "HTML Form Elements", "Working with common HTML controls", [
        ("Text Input", "element.sendKeys(\"value\");"),
        ("Checkbox", "element.click(); // Toggle checkbox"),
        ("Radio Button", "element.click(); // Select radio"),
        ("Dropdown", "new Select(element).selectByValue(\"option\");"),
        ("Button", "element.click();"),
        ("Submit Form", "element.submit();"),
    ], "../06_Basic_HTML_Controls/06_Basic_HTML_Controls.html", "../05_WebElement_Methods/05_WebElement_Methods.html", "../../05.%20Advanced%20Selenium/05_Advanced_Selenium.html"),
}

html_template = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title} - {module}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism-tomorrow.min.css" rel="stylesheet">
    <style>
        body {{ background-color: #f8f9fa; }}
        .sidebar {{ background-color: #2c3e50; color: white; min-height: 100vh; padding: 20px 0; }}
        .sidebar a {{ color: #ecf0f1; text-decoration: none; padding: 10px 15px; display: block; }}
        .sidebar a:hover {{ background-color: #34495e; }}
        .content {{ padding: 30px; }}
        .breadcrumb {{ background-color: white; padding: 15px; border-radius: 5px; }}
        .code-section {{ background-color: #f5f5f5; padding: 15px; border-left: 4px solid #3498db; margin: 15px 0; border-radius: 5px; }}
        .key-concept {{ background-color: #e8f4f8; padding: 15px; border-left: 4px solid #2980b9; margin: 15px 0; border-radius: 5px; }}
        .best-practice {{ background-color: #d4edda; padding: 15px; border-left: 4px solid #28a745; margin: 15px 0; border-radius: 5px; }}
        .quiz-section {{ background-color: #fff3cd; padding: 15px; border-left: 4px solid #ffc107; margin: 15px 0; border-radius: 5px; }}
        .toc {{ background-color: white; padding: 20px; border-radius: 5px; border: 1px solid #ddd; margin-bottom: 20px; }}
        .toc ul {{ list-style: none; padding: 0; }}
        .toc li {{ padding: 8px 0; }}
        .toc a {{ color: #3498db; text-decoration: none; }}
        .toc a:hover {{ text-decoration: underline; }}
        h2 {{ color: #2c3e50; margin-top: 30px; margin-bottom: 15px; border-bottom: 2px solid #3498db; padding-bottom: 10px; }}
        h3 {{ color: #34495e; margin-top: 20px; margin-bottom: 10px; }}
        pre {{ background-color: #282c34; color: #abb2bf; padding: 15px; border-radius: 5px; overflow-x: auto; }}
        .footer-nav {{ display: flex; justify-content: space-between; margin-top: 40px; padding-top: 20px; border-top: 1px solid #ddd; }}
        .footer-nav a {{ color: #3498db; text-decoration: none; }}
        .footer-nav a:hover {{ text-decoration: underline; }}
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 sidebar">
                <div style="padding: 20px;">
                    <h5><i class="fas fa-globe"></i> Navigation</h5>
                    <a href="{module_link}"><i class="fas fa-arrow-left"></i> Back to Module</a>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 content">
                <!-- Breadcrumb -->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="../../index.html">Home</a></li>
                        <li class="breadcrumb-item active">{title}</li>
                    </ol>
                </nav>

                <!-- Header -->
                <div style="margin-bottom: 30px;">
                    <h1><i class="fas fa-terminal"></i> {title}</h1>
                    <p class="text-muted">{description}</p>
                </div>

                <!-- Content -->
                <section>
                    <h2><i class="fas fa-book"></i> {topic_title}</h2>
                    <p>{topic_description}</p>
                    
                    {code_examples}
                    
                    <div class="best-practice">
                        <h5><i class="fas fa-check"></i> Best Practices</h5>
                        <ul>
                            <li>Use appropriate locators for reliability</li>
                            <li>Add waits for dynamic elements</li>
                            <li>Handle exceptions properly</li>
                            <li>Keep code maintainable and readable</li>
                        </ul>
                    </div>

                    <div class="quiz-section">
                        <h5><i class="fas fa-question-circle"></i> Quick Quiz</h5>
                        <p>Practice using these elements and commands in your test scripts.</p>
                    </div>
                </section>

                <!-- Footer Navigation -->
                <div class="footer-nav">
                    <a href="{prev_link}"><i class="fas fa-chevron-left"></i> Previous</a>
                    <a href="{next_link}">Next <i class="fas fa-chevron-right"></i></a>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-java.min.js"></script>
</body>
</html>"""

base_path = r"c:\Users\sedhu\Downloads\Java_Selinium\Java_Selenium_Automation_Curriculum"

for filepath, (title, module, module_link, topic_title, topic_desc, examples, current_link, prev_link, next_link) in files_config.items():
    # Generate code examples HTML
    code_examples_html = ""
    for ex_title, ex_code in examples:
        code_examples_html += f'<h3>{ex_title}</h3>\n<div class="code-section"><pre><code class="language-java">{ex_code}</code></pre></div>\n'
    
    # Generate full HTML
    html_content = html_template.format(
        title=title,
        module=module,
        module_link=module_link,
        topic_title=topic_title,
        topic_description=topic_desc,
        code_examples=code_examples_html,
        current_link=current_link,
        prev_link=prev_link,
        next_link=next_link
    )
    
    full_path = os.path.join(base_path, filepath)
    os.makedirs(os.path.dirname(full_path), exist_ok=True)
    
    with open(full_path, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print(f"Created: {filepath}")

print("All files generated successfully!")
