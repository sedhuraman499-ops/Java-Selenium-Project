#!/usr/bin/env python3
"""Generate all HTML files for Selenium Curriculum Modules 11-20"""

import os

base_path = r"c:\Users\sedhu\Downloads\Java_Selinium\Java_Selenium_Automation_Curriculum"

# Module data structure
modules = {
    13: {
        "name": "BDD_Framework_Cucumber",
        "title": "BDD Framework Cucumber",
        "sections": {
            1: ("Introduction", "fa-book", "Learn BDD and Cucumber framework for behavior-driven development with Selenium."),
            2: ("Feature Files", "fa-file", "Write Gherkin feature files to define test scenarios in BDD format."),
            3: ("Step Definitions", "fa-code", "Implement step definitions to connect feature files with Java code."),
            4: ("Runner Class", "fa-play", "Create test runner classes to execute Cucumber tests with TestNG."),
            5: ("Reports", "fa-chart-bar", "Generate comprehensive Cucumber reports with test execution details.")
        }
    },
    14: {
        "name": "API_and_Database_Testing",
        "title": "API and Database Testing",
        "sections": {
            1: ("REST Assured Basics", "fa-globe", "Learn REST Assured library for API testing with Java."),
            2: ("CRUD Operations", "fa-database", "Test Create, Read, Update, Delete operations via REST APIs."),
            3: ("Postman Collections", "fa-mail-bulk", "Integration with Postman for API test collections."),
            4: ("Database Verification", "fa-server", "Verify database state after API operations.")
        }
    },
    15: {
        "name": "Cloud_Testing",
        "title": "Cloud Testing Platforms",
        "sections": {
            1: ("BrowserStack", "fa-cloud", "Test web applications on BrowserStack cloud platform."),
            2: ("SauceLabs", "fa-droplet", "Execute tests on SauceLabs for cross-browser compatibility."),
            3: ("LambdaTest", "fa-flask", "Use LambdaTest for automated cross-browser testing."),
            4: ("CrossBrowserTesting", "fa-sitemap", "Test across multiple browsers with CrossBrowserTesting.")
        }
    },
    16: {
        "name": "Advanced_Topics",
        "title": "Advanced Topics in Selenium",
        "sections": {
            1: ("Headless Browsers", "fa-ghost", "Run tests in headless mode for faster execution."),
            2: ("Captcha Handling", "fa-shield", "Handle CAPTCHA and security challenges in automation."),
            3: ("File Upload Download", "fa-file-upload", "Automate file upload and download operations."),
            4: ("Shadow DOM", "fa-layer-group", "Handle Shadow DOM elements in web applications."),
            5: ("DevTools Integration", "fa-tools", "Use Chrome DevTools with Selenium for advanced debugging.")
        }
    },
    17: {
        "name": "Real_Time_Projects",
        "title": "Real Time Projects",
        "sections": {
            1: ("ECommerce Automation", "fa-shopping-cart", "Automate e-commerce workflows and transactions."),
            2: ("HRM Portal", "fa-users", "Test Human Resource Management system automation."),
            3: ("Banking App", "fa-university", "Automate banking application testing scenarios."),
            4: ("CRM System", "fa-chart-line", "Test Customer Relationship Management system.")
        }
    },
    18: {
        "name": "Interview_Preparation",
        "title": "Interview Preparation",
        "sections": {
            1: ("Java Questions", "fa-coffee", "Common Java interview questions for testers."),
            2: ("Selenium Questions", "fa-question", "Selenium specific interview questions."),
            3: ("Framework Questions", "fa-cube", "Framework design and architecture questions."),
            4: ("Scenario Based", "fa-tasks", "Scenario-based interview questions and answers."),
            5: ("Resume Tips", "fa-file-alt", "Tips for creating effective automation testing resume.")
        }
    },
    19: {
        "name": "Resources",
        "title": "Resources and References",
        "sections": {
            1: ("CheatSheets", "fa-list", "Quick reference cheat sheets for Selenium."),
            2: ("Tools", "fa-tools", "Useful tools for Selenium automation."),
            3: ("Books", "fa-book", "Recommended books for learning Selenium."),
            4: ("References", "fa-link", "Important documentation and references."),
            5: ("Practice Websites", "fa-globe", "Websites to practice automation testing.")
        }
    },
    20: {
        "name": "Extras",
        "title": "Extras and Additional Topics",
        "sections": {
            1: ("Performance Testing", "fa-rocket", "Performance testing with Selenium WebDriver."),
            2: ("Security Testing", "fa-lock", "Security testing approaches with Selenium."),
            3: ("Mobile Testing", "fa-mobile", "Mobile automation testing with Appium."),
            4: ("Accessibility Testing", "fa-universal-access", "Web accessibility testing automation.")
        }
    }
}

def create_html_template(module_num, module_title, section_num, section_title, section_icon, description):
    """Create HTML content template"""
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{section_title} - {module_title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {{ font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }}
        .sidebar {{ background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; }}
        .sidebar a {{ color: white; text-decoration: none; padding: 8px 12px; }}
        .sidebar a:hover {{ background: rgba(255,255,255,0.1); border-radius: 5px; }}
        .sidebar a.active {{ background: rgba(255,255,255,0.2); border-radius: 5px; }}
        .main-content {{ padding: 30px; }}
        .breadcrumb {{ background-color: #f8f9fa; }}
        .code-block {{ background: #f4f4f4; border-left: 4px solid #667eea; padding: 15px; margin: 20px 0; font-size: 0.9em; overflow-x: auto; }}
        .code-block pre {{ margin: 0; white-space: pre-wrap; word-wrap: break-word; }}
        .best-practices {{ background: #e3f2fd; border-left: 4px solid #2196F3; padding: 15px; margin: 20px 0; }}
        .quiz {{ background: #fff3e0; border-left: 4px solid #ff9800; padding: 15px; margin: 20px 0; }}
        .nav-buttons {{ margin-top: 40px; display: flex; justify-content: space-between; gap: 10px; }}
        h1, h2, h3 {{ color: #667eea; margin-top: 25px; }}
        h1 {{ margin-top: 0; }}
        .section-content {{ margin: 20px 0; }}
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 sidebar p-3">
                <h4 class="text-white mb-4"><i class="fas {section_icon}"></i> {module_title}</h4>
                <nav class="nav flex-column small">
                    <!-- Navigation items will be populated here -->
                </nav>
                <hr class="bg-white my-4">
                <h5 class="text-white">Navigation</h5>
                <nav class="nav flex-column">
                    <a class="nav-link" href="../../index.html"><i class="fas fa-home"></i> Home</a>
                </nav>
            </div>

            <div class="col-md-9 main-content">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="../../index.html">Home</a></li>
                        <li class="breadcrumb-item">Module {module_num:02d}</li>
                        <li class="breadcrumb-item active">{section_title}</li>
                    </ol>
                </nav>

                <h1><i class="fas {section_icon}"></i> {section_title}</h1>
                <p class="lead">{description}</p>

                <div class="section-content">
                    <h2>Overview</h2>
                    <p>This section covers comprehensive knowledge and practical skills for {section_title.lower()} in Selenium automation testing with Java.</p>
                    
                    <h2>Key Concepts</h2>
                    <ul>
                        <li>Understanding core principles and best practices</li>
                        <li>Implementation strategies and patterns</li>
                        <li>Real-world use cases and examples</li>
                        <li>Common pitfalls and how to avoid them</li>
                        <li>Performance optimization techniques</li>
                    </ul>

                    <h2>Java Code Example</h2>
                    <div class="code-block">
                        <strong>Sample Implementation:</strong>
                        <pre>public class {section_title.replace(' ', '')}Example {{
    // Implementation example for {section_title}
    public void demonstrateUsage() {{
        // Write your test code here
        System.out.println("{section_title} example");
    }}
}}</pre>
                    </div>

                    <h2>Advanced Techniques</h2>
                    <ul>
                        <li>Advanced configuration options</li>
                        <li>Integration with other tools and frameworks</li>
                        <li>Scalability considerations</li>
                        <li>Troubleshooting common issues</li>
                    </ul>
                </div>

                <div class="best-practices">
                    <h3><i class="fas fa-star"></i> Best Practices</h3>
                    <ul>
                        <li>Follow SOLID principles in test code design</li>
                        <li>Maintain clean and readable code structure</li>
                        <li>Use appropriate design patterns for maintainability</li>
                        <li>Implement proper error handling and logging</li>
                        <li>Regular refactoring and code reviews</li>
                        <li>Document your code and maintain knowledge base</li>
                    </ul>
                </div>

                <div class="quiz">
                    <h3><i class="fas fa-question-circle"></i> Quiz Questions</h3>
                    <ol>
                        <li>What are the key components of {section_title}?</li>
                        <li>How do you implement {section_title.lower()} in your projects?</li>
                        <li>What are the common challenges and solutions?</li>
                        <li>How does {section_title.lower()} improve test efficiency?</li>
                        <li>What are the best practices for {section_title.lower()}?</li>
                    </ol>
                </div>

                <div class="nav-buttons">
                    <a href="#" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Previous</a>
                    <a href="#" class="btn btn-primary">Next <i class="fas fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>"""

# Create all files
created_count = 0
for module_num, module_info in modules.items():
    module_name = module_info["name"]
    module_title = module_info["title"]
    
    for section_num, (section_title, section_icon, description) in module_info["sections"].items():
        # Create directory
        section_dir_name = f"{section_num:02d}_{section_title.replace(' ', '_')}"
        module_dir_name = f"{module_num}. {module_name}"
        full_path = os.path.join(base_path, module_dir_name, section_dir_name)
        os.makedirs(full_path, exist_ok=True)
        
        # Create file
        file_name = f"{section_num:02d}_{section_title.replace(' ', '_')}.html"
        file_path = os.path.join(full_path, file_name)
        
        html_content = create_html_template(module_num, module_title, section_num, section_title, section_icon, description)
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        created_count += 1
        print(f"Created: {file_path}")

print(f"\nTotal files created: {created_count}")
