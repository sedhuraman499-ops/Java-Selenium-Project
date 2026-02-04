import os
import re

base_dir = r"c:\Users\sedhu\Downloads\Java_Selinium\Java_Selenium_Automation_Curriculum"

# HTML Template function
def create_html_template(module_num, module_name, topic_name, topic_file, next_topic=None, prev_topic=None):
    breadcrumb_link = f"Module {module_num:02d}"
    back_link = f"../{module_num:02d}_{module_name.replace(' ', '_')}.html"
    
    next_link = f"<a href=\"{next_topic}\" class=\"btn btn-sm btn-primary\">Next Topic <i class=\"fas fa-arrow-right ms-2\"></i></a>" if next_topic else ""
    prev_link = f"<a href=\"{prev_topic}\" class=\"btn btn-sm btn-outline-primary me-2\">Previous Topic <i class=\"fas fa-arrow-left ms-2\"></i></a>" if prev_topic else f"<a href=\"../{module_num:02d}_{module_name.replace(' ', '_')}.html\" class=\"btn btn-sm btn-outline-primary me-2\">Back to Module</a>"
    
    icon_map = {
        "Basics": "fas fa-code",
        "OOPs": "fas fa-cube",
        "Collections": "fas fa-list",
        "Exception": "fas fa-exclamation-triangle",
        "File": "fas fa-file",
        "Streams": "fas fa-stream",
        "JDK": "fas fa-java",
        "Maven": "fas fa-cube",
        "Browser": "fas fa-chrome",
        "Git": "fas fa-code-branch",
        "WebDriver": "fas fa-globe",
        "Locators": "fas fa-search",
        "Waits": "fas fa-hourglass",
        "Dropdowns": "fas fa-bars",
        "Frames": "fas fa-window",
        "Actions": "fas fa-mouse",
        "JavaScript": "fas fa-js",
        "TestNG": "fas fa-flask",
        "Annotations": "fas fa-tags",
        "Assertions": "fas fa-check",
        "DataProviders": "fas fa-database",
        "Parallel": "fas fa-sync",
        "Reports": "fas fa-chart-bar",
        "Page": "fas fa-layer-group",
        "Framework": "fas fa-building",
        "Data": "fas fa-database",
        "Log4j": "fas fa-file-alt",
        "Excel": "fas fa-table",
        "JSON": "fas fa-code",
        "Database": "fas fa-database",
    }
    
    icon = "fas fa-file-alt"
    for key, val in icon_map.items():
        if key.lower() in topic_name.lower():
            icon = val
            break
    
    html = f'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{topic_name} | Module {module_num:02d} | Java Selenium Curriculum</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/themes/prism-tomorrow.min.css">
    <link rel="stylesheet" href="../../../assets/css/main.css">
</head>
<body>
    <div class="app-container">
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header"><h5><i class="{icon} me-2"></i> {topic_name}</h5></div>
            <ul class="list-unstyled components">
                <li><a href="../../../index.html"><i class="fas fa-home me-2"></i> Home</a></li>
                <li><a href="{back_link}"><i class="fas fa-arrow-left me-2"></i> Back to Module</a></li>
                <li class="mt-3">
                    <strong style="font-size: 12px; text-transform: uppercase; opacity: 0.7;">Table of Contents</strong>
                </li>
                <li><a href="#overview"><i class="fas fa-arrow-right me-2"></i> Overview</a></li>
                <li><a href="#key-concepts"><i class="fas fa-arrow-right me-2"></i> Key Concepts</a></li>
                <li><a href="#examples"><i class="fas fa-arrow-right me-2"></i> Examples</a></li>
                <li><a href="#best-practices"><i class="fas fa-arrow-right me-2"></i> Best Practices</a></li>
            </ul>
        </div>

        <div class="main-content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="btn btn-light d-lg-none sidebar-toggle" type="button"><i class="fas fa-bars"></i></button>
                    <div class="ms-3">
                        <h4 class="mb-0"><i class="{icon} me-2"></i> {topic_name}</h4>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="../../../index.html">Home</a></li>
                                <li class="breadcrumb-item"><a href="{back_link}">{breadcrumb_link}</a></li>
                                <li class="breadcrumb-item active">{topic_name}</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </nav>

            <div class="content-wrapper p-4">
                <section class="mb-5" id="overview">
                    <h2><i class="{icon} me-2"></i> {topic_name}</h2>
                    <p class="lead">This section covers {topic_name.lower()}, an essential topic in Java Selenium automation testing.</p>
                    
                    <div class="alert alert-info">
                        <i class="fas fa-lightbulb me-2"></i>
                        <strong>Learning Objective:</strong> Understand and implement {topic_name.lower()} in your automation tests.
                    </div>
                </section>

                <section class="mb-5" id="key-concepts">
                    <h3><i class="fas fa-key me-2"></i> Key Concepts</h3>
                    
                    <h5 class="mt-4 mb-3">Introduction</h5>
                    <p>{topic_name} is an important aspect of test automation. It allows you to:</p>
                    <ul>
                        <li>Improve test reliability and consistency</li>
                        <li>Reduce maintenance overhead</li>
                        <li>Enhance code reusability</li>
                        <li>Follow industry best practices</li>
                        <li>Build scalable test frameworks</li>
                    </ul>

                    <h5 class="mt-4 mb-3">Core Principles</h5>
                    <ol>
                        <li><strong>Modularity:</strong> Break tests into small, independent units</li>
                        <li><strong>Reusability:</strong> Create reusable components and methods</li>
                        <li><strong>Maintainability:</strong> Write clean, well-documented code</li>
                        <li><strong>Scalability:</strong> Design for growth and expansion</li>
                        <li><strong>Performance:</strong> Optimize for speed and efficiency</li>
                    </ol>
                </section>

                <section class="mb-5" id="examples">
                    <h3><i class="fas fa-code me-2"></i> Practical Examples</h3>
                    
                    <h5 class="mt-4 mb-3">Example 1: Basic Implementation</h5>
                    <pre><code class="language-java">
// Example code for {topic_name}
// Add your practical examples here
// This section demonstrates real-world usage
// Remember to follow best practices and conventions
                    </code></pre>

                    <h5 class="mt-4 mb-3">Example 2: Advanced Usage</h5>
                    <pre><code class="language-java">
// Advanced implementation example
// Shows more complex scenarios
// Demonstrates real-world applications
// Includes error handling and edge cases
                    </code></pre>
                </section>

                <section class="mb-5" id="best-practices">
                    <h3><i class="fas fa-lightbulb me-2"></i> Best Practices</h3>
                    
                    <div class="card p-4 mb-4" style="background-color: #d4edda; border-left: 4px solid var(--success-color);">
                        <h5><i class="fas fa-check me-2"></i> Do's</h5>
                        <ul class="mt-3">
                            <li>Follow naming conventions consistently</li>
                            <li>Write clear and maintainable code</li>
                            <li>Document your code thoroughly</li>
                            <li>Use meaningful variable and method names</li>
                            <li>Test your code thoroughly</li>
                            <li>Review and refactor regularly</li>
                            <li>Use version control</li>
                        </ul>
                    </div>

                    <div class="card p-4 mb-4" style="background-color: #f8d7da; border-left: 4px solid var(--danger-color);">
                        <h5><i class="fas fa-times me-2"></i> Don'ts</h5>
                        <ul class="mt-3">
                            <li>Don't write complex, hard-to-read code</li>
                            <li>Don't skip documentation</li>
                            <li>Don't ignore code reviews</li>
                            <li>Don't create brittle tests</li>
                            <li>Don't repeat code unnecessarily</li>
                            <li>Don't skip error handling</li>
                            <li>Don't ignore performance issues</li>
                        </ul>
                    </div>
                </section>

                <section class="card bg-light p-4 mb-5">
                    <h4><i class="fas fa-graduation-cap me-2"></i> Key Takeaways</h4>
                    <ul class="mt-3">
                        <li>{topic_name} is essential for robust automation testing</li>
                        <li>Follow best practices to create maintainable code</li>
                        <li>Focus on modularity and reusability</li>
                        <li>Document your implementation</li>
                        <li>Test thoroughly before deployment</li>
                        <li>Continue learning and improving</li>
                    </ul>
                </section>

                <section class="mb-5">
                    <h3><i class="fas fa-question me-2"></i> Quick Quiz</h3>
                    <p>Test your understanding:</p>
                    <ul>
                        <li>What are the main benefits of {topic_name.lower()}?</li>
                        <li>How would you implement {topic_name.lower()} in your tests?</li>
                        <li>What are the best practices for {topic_name.lower()}?</li>
                        <li>What challenges might you face?</li>
                        <li>How would you troubleshoot issues?</li>
                    </ul>
                </section>

                <footer class="bg-light py-4 mt-5 border-top">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="mb-0">© 2025 Java Selenium Automation Curriculum. All rights reserved.</p>
                            </div>
                            <div class="col-md-6 text-md-end">
                                {prev_link}
                                {next_link}
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/prism.min.js"></script>
    <script src="../../../assets/js/main.js"></script>
</body>
</html>
'''
    return html

# File mapping
modules = {
    2: ("Core Java for Selenium", {
        "01_Basics_and_Syntax": "Basics and Syntax",
        "02_OOPs_Concepts": "OOPs Concepts",
        "03_Collections_Framework": "Collections Framework",
        "04_Exception_Handling": "Exception Handling",
        "05_File_Handling": "File Handling",
        "06_Streams_and_Lambda": "Streams and Lambda",
    }),
    3: ("Environment Setup", {
        "01_JDK_and_IDE": "JDK and IDE",
        "02_Maven_and_Gradle": "Maven and Gradle",
        "04_Browser_Drivers": "Browser Drivers",
        "05_Git_and_GitHub": "Git and GitHub",
    }),
    4: ("Selenium Basics", {
        "01_WebDriver_Overview": "WebDriver Overview",
        "02_Browser_Commands": "Browser Commands",
        "03_Navigation_Commands": "Navigation Commands",
        "04_Locators": "Locators",
        "05_WebElement_Methods": "WebElement Methods",
        "06_Basic_HTML_Controls": "Basic HTML Controls",
    }),
    5: ("Advanced Selenium", {
        "01_Waits_Implicit_Explicit": "Waits - Implicit & Explicit",
        "02_Handling_Dropdowns_Alerts": "Handling Dropdowns & Alerts",
        "03_Frames_Windows": "Frames and Windows",
        "04_Actions_Class": "Actions Class",
        "05_JavaScriptExecutor": "JavaScriptExecutor",
        "06_Advanced_HTML_Controls": "Advanced HTML Controls",
    }),
    6: ("TestNG Framework", {
        "01_Introduction": "TestNG Introduction",
        "02_Annotations": "TestNG Annotations",
        "03_Assertions": "Assertions",
        "04_DataProviders": "DataProviders",
        "05_Parallel_Execution": "Parallel Execution",
        "06_Reports": "Test Reports",
    }),
    7: ("Page Object Model", {
        "01_Concept": "POM Concept",
        "02_Implementation": "POM Implementation",
        "03_PageFactory": "PageFactory",
        "04_Best_Practices": "POM Best Practices",
    }),
    8: ("Framework Development", {
        "01_Modular_Framework": "Modular Framework",
        "02_Data_Driven_Framework": "Data Driven Framework",
        "03_Keyword_Driven_Framework": "Keyword Driven Framework",
        "04_Hybrid_Framework": "Hybrid Framework",
    }),
    9: ("Data Handling", {
        "01_Excel_with_Apache_POI": "Excel with Apache POI",
        "02_Properties_Files": "Properties Files",
        "03_JSON_and_XML": "JSON and XML",
        "04_Database_Connection": "Database Connection",
    }),
    10: ("Logging and Reporting", {
        "01_Log4j": "Log4j Logging",
        "02_Extent_Reports": "Extent Reports",
        "03_Allure_Reports": "Allure Reports",
    }),
}

created_count = 0
for module_num, (module_name, topics) in modules.items():
    module_folder = f"{module_num:02d}. {module_name}"
    module_path = os.path.join(base_dir, module_folder)
    
    for topic_folder, topic_name in topics.items():
        file_name = topic_folder + ".html"
        file_path = os.path.join(module_path, topic_folder, file_name)
        
        if not os.path.exists(file_path):
            os.makedirs(os.path.dirname(file_path), exist_ok=True)
            html_content = create_html_template(module_num, module_name, topic_name, file_name)
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(html_content)
            print(f"✓ Created: {module_folder}/{topic_folder}/{file_name}")
            created_count += 1
        else:
            print(f"⊘ Already exists: {module_folder}/{topic_folder}/{file_name}")

print(f"\n✓ Total files created: {created_count}")
