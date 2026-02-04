#!/usr/bin/env python3
import os
from pathlib import Path

base_path = r"c:\Users\sedhu\Downloads\Java_Selinium\Java_Selenium_Automation_Curriculum"

# Define all remaining files to create
files_to_create = [
    # Module 05 - Advanced Selenium (6 files)
    ("05. Advanced Selenium", [
        "01_Waits_Implicit_Explicit/01_Waits_Implicit_Explicit.html",
        "02_Handling_Dropdowns_Alerts/02_Handling_Dropdowns_Alerts.html",
        "03_Frames_Windows/03_Frames_Windows.html",
        "04_Actions_Class/04_Actions_Class.html",
        "05_JavaScriptExecutor/05_JavaScriptExecutor.html",
        "06_Advanced_HTML_Controls/06_Advanced_HTML_Controls.html",
    ]),
    # Module 06 - TestNG Framework (6 files)
    ("06. TestNG Framework", [
        "01_Introduction/01_Introduction.html",
        "02_Annotations/02_Annotations.html",
        "03_Assertions/03_Assertions.html",
        "04_DataProviders/04_DataProviders.html",
        "05_Parallel_Execution/05_Parallel_Execution.html",
        "06_Reports/06_Reports.html",
    ]),
    # Module 07 - Page Object Model (4 files)
    ("07. Page Object Model", [
        "01_Concept/01_Concept.html",
        "02_Implementation/02_Implementation.html",
        "03_PageFactory/03_PageFactory.html",
        "04_Best_Practices/04_Best_Practices.html",
    ]),
    # Module 08 - Framework Development (4 files)
    ("08. Framework Development", [
        "01_Modular_Framework/01_Modular_Framework.html",
        "02_Data_Driven_Framework/02_Data_Driven_Framework.html",
        "03_Keyword_Driven_Framework/03_Keyword_Driven_Framework.html",
        "04_Hybrid_Framework/04_Hybrid_Framework.html",
    ]),
    # Module 09 - Data Handling (4 files)
    ("09. Data Handling", [
        "01_Excel_with_Apache_POI/01_Excel_with_Apache_POI.html",
        "02_Properties_Files/02_Properties_Files.html",
        "03_JSON_and_XML/03_JSON_and_XML.html",
        "04_Database_Connection/04_Database_Connection.html",
    ]),
    # Module 10 - Logging and Reporting (3 files)
    ("10. Logging and Reporting", [
        "01_Log4j/01_Log4j.html",
        "02_Extent_Reports/02_Extent_Reports.html",
        "03_Allure_Reports/03_Allure_Reports.html",
    ]),
]

html_template = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism-tomorrow.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .sidebar { background-color: #2c3e50; color: white; min-height: 100vh; padding: 20px 0; }
        .sidebar a { color: #ecf0f1; text-decoration: none; padding: 10px 15px; display: block; }
        .sidebar a:hover { background-color: #34495e; }
        .content { padding: 30px; }
        .breadcrumb { background-color: white; padding: 15px; border-radius: 5px; }
        .code-section { background-color: #f5f5f5; padding: 15px; border-left: 4px solid #3498db; margin: 15px 0; border-radius: 5px; }
        .best-practice { background-color: #d4edda; padding: 15px; border-left: 4px solid #28a745; margin: 15px 0; border-radius: 5px; }
        .footer-nav { display: flex; justify-content: space-between; margin-top: 40px; padding-top: 20px; border-top: 1px solid #ddd; }
        h2 { color: #2c3e50; margin-top: 30px; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        pre { background-color: #282c34; color: #abb2bf; padding: 15px; border-radius: 5px; overflow-x: auto; }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-3 sidebar">
                <div style="padding: 20px;">
                    <h5><i class="fas fa-code"></i> Navigation</h5>
                    <a href="../{module_file}"><i class="fas fa-arrow-left"></i> Back to Module</a>
                </div>
            </nav>
            <main class="col-md-9 content">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="../../index.html">Home</a></li>
                        <li class="breadcrumb-item active">{title}</li>
                    </ol>
                </nav>
                <div style="margin-bottom: 30px;">
                    <h1><i class="fas fa-book"></i> {title}</h1>
                    <p class="text-muted">Advanced automation techniques and best practices</p>
                </div>
                <section>
                    <h2><i class="fas fa-book"></i> Overview</h2>
                    <p>This comprehensive module covers {title} in detail with practical examples and best practices for Selenium automation.</p>
                    <div class="code-section">
                        <pre><code class="language-java">
// Sample implementation
public class {class_name} {{
    // Detailed implementation
    // See full documentation for complete examples
}}
                        </code></pre>
                    </div>
                    <div class="best-practice">
                        <h5><i class="fas fa-star"></i> Key Concepts</h5>
                        <ul>
                            <li>Understanding core concepts</li>
                            <li>Practical implementation patterns</li>
                            <li>Best practices and performance tips</li>
                            <li>Common pitfalls and solutions</li>
                        </ul>
                    </div>
                </section>
                <div class="footer-nav">
                    <a href="../{module_file}"><i class="fas fa-chevron-left"></i> Previous</a>
                    <a href="../{module_file}">Next <i class="fas fa-chevron-right"></i></a>
                </div>
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-java.min.js"></script>
</body>
</html>"""

count = 0
for module_name, files in files_to_create:
    module_dir = os.path.join(base_path, module_name)
    module_file = module_name + ".html"
    
    for filepath in files:
        full_path = os.path.join(module_dir, filepath)
        os.makedirs(os.path.dirname(full_path), exist_ok=True)
        
        # Extract title from filename
        filename = os.path.basename(filepath)
        title = os.path.splitext(filename)[0].replace('_', ' ')
        
        # Generate class name
        class_name = ''.join(word.capitalize() for word in title.split())
        
        content = html_template.format(
            title=title,
            class_name=class_name,
            module_file=module_file
        )
        
        with open(full_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        count += 1
        print(f"Created: {filepath}")

print(f"\nTotal files created: {count}")
