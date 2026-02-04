import os
import shutil

base_path = r"c:\Users\sedhu\Downloads\Java_Selinium\Java_Selenium_Automation_Curriculum"

def create_html_file(module_num, module_name, section_num, section_name, section_icon, content_snippet):
    """Create an HTML file with proper structure"""
    
    module_dir = f"{module_num:02d}. {module_name}"
    section_dir = f"{section_num:02d}_{section_name.replace(' ', '_')}"
    
    dir_path = os.path.join(base_path, module_dir, section_dir)
    os.makedirs(dir_path, exist_ok=True)
    
    file_name = f"{section_num:02d}_{section_name.replace(' ', '_')}.html"
    file_path = os.path.join(dir_path, file_name)
    
    # Get navigation context based on module
    nav_links = ""
    if module_num == 11:
        nav_links = '''<a class="nav-link" href="../../10. Logging and Reporting/10_Logging_and_Reporting.html"><i class="fas fa-arrow-left"></i> Previous Module</a>'''
    elif module_num == 12:
        nav_links = '''<a class="nav-link" href="../../11. Selenium Grid and Parallel Testing/04_Parallel_TestNG/04_Parallel_TestNG.html"><i class="fas fa-arrow-left"></i> Previous Module</a>'''
    
    html_content = f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{section_name} - {module_name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {{ font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }}
        .sidebar {{ background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; }}
        .sidebar a {{ color: white; text-decoration: none; }}
        .sidebar a:hover {{ background: rgba(255,255,255,0.1); border-radius: 5px; }}
        .main-content {{ padding: 30px; }}
        .breadcrumb {{ background-color: #f8f9fa; }}
        .code-block {{ background: #f4f4f4; border-left: 4px solid #667eea; padding: 15px; margin: 20px 0; }}
        .best-practices {{ background: #e3f2fd; border-left: 4px solid #2196F3; padding: 15px; margin: 20px 0; }}
        .quiz {{ background: #fff3e0; border-left: 4px solid #ff9800; padding: 15px; margin: 20px 0; }}
        .nav-buttons {{ margin-top: 40px; display: flex; justify-content: space-between; }}
        h1, h2, h3 {{ color: #667eea; }}
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 sidebar p-3">
                <h4 class="text-white mb-4"><i class="fas {section_icon}"></i> {module_name}</h4>
                <nav class="nav flex-column">
                    {content_snippet.get('nav_items', '')}
                </nav>
                <hr class="bg-white my-4">
                <h5 class="text-white">Navigation</h5>
                <nav class="nav flex-column">
                    <a class="nav-link" href="../../index.html"><i class="fas fa-home"></i> Home</a>
                    {nav_links}
                </nav>
            </div>

            <div class="col-md-9 main-content">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="../../index.html">Home</a></li>
                        <li class="breadcrumb-item">Module {module_num}</li>
                        <li class="breadcrumb-item active">{section_name}</li>
                    </ol>
                </nav>

                <h1><i class="fas {section_icon}"></i> {section_name}</h1>
                <p class="lead">{content_snippet.get('description', '')}</p>

                {content_snippet.get('main_content', '')}

                <div class="best-practices">
                    <h3><i class="fas fa-star"></i> Best Practices</h3>
                    <ul>
                        {content_snippet.get('best_practices', '<li>Follow proper coding standards</li>')}
                    </ul>
                </div>

                <div class="quiz">
                    <h3><i class="fas fa-question-circle"></i> Quiz Questions</h3>
                    <ol>
                        {content_snippet.get('quiz', '<li>What are the key concepts of this topic?</li>')}
                    </ol>
                </div>

                <div class="nav-buttons">
                    {content_snippet.get('prev_button', '')}
                    {content_snippet.get('next_button', '')}
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>"""
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print(f"Created: {file_path}")
    return file_path


# Module 11 sections
m11_sections = {
    "03_Docker_Selenium_Grid": {
        "title": "Docker Selenium Grid",
        "icon": "fa-docker",
        "description": "Learn to containerize Selenium Grid using Docker for easy deployment and scalability.",
        "content": """
<h2>Docker Selenium Images</h2>
<p>Selenium provides pre-built Docker images for Hub, Chrome, Firefox, and Edge nodes.</p>

<h2>Docker Compose Setup</h2>
<div class="code-block">
    <strong>docker-compose.yml:</strong>
    <pre>version: '3'
services:
  selenium-hub:
    image: selenium/hub:latest
    ports:
      - "4444:4444"
    environment:
      SE_SESSION_REQUEST_TIMEOUT: 300
      SE_SESSION_RETRY_INTERVAL: 5
      
  chrome:
    image: selenium/node-chrome:latest
    depends_on:
      - selenium-hub
    environment:
      SE_HUB_URL: http://selenium-hub:4444
      SE_HUB_HOST: selenium-hub
      SE_NODE_MAX_INSTANCES: 3
      
  firefox:
    image: selenium/node-firefox:latest
    depends_on:
      - selenium-hub
    environment:
      SE_HUB_URL: http://selenium-hub:4444</pre>
</div>

<h2>Starting Grid with Docker Compose</h2>
<div class="code-block">
    <strong>Commands:</strong>
    <pre>docker-compose up -d
docker-compose logs -f
docker-compose down</pre>
</div>

<h2>Java Test with Docker Grid</h2>
<div class="code-block">
    <strong>DockerGridTest.java:</strong>
    <pre>public class DockerGridTest {
    public static void main(String[] args) throws Exception {
        URL hubURL = new URL("http://localhost:4444");
        ChromeOptions options = new ChromeOptions();
        WebDriver driver = new RemoteWebDriver(hubURL, options);
        driver.navigate().to("https://www.google.com");
        driver.quit();
    }
}</pre>
</div>
"""
    },
    "04_Parallel_TestNG": {
        "title": "Parallel TestNG",
        "icon": "fa-tasks",
        "description": "Execute TestNG tests in parallel using Selenium Grid for faster test execution.",
        "content": """
<h2>TestNG Parallel Execution Modes</h2>
<ul>
    <li><strong>Methods:</strong> Run test methods in parallel</li>
    <li><strong>Tests:</strong> Run test classes in parallel</li>
    <li><strong>Classes:</strong> Run test classes in separate threads</li>
    <li><strong>Instances:</strong> Run test instances in parallel</li>
</ul>

<h2>TestNG XML Configuration for Parallel Execution</h2>
<div class="code-block">
    <strong>testng.xml:</strong>
    <pre><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">
<suite name="Parallel Suite" parallel="methods" thread-count="5">
    <test name="Grid Tests">
        <classes>
            <class name="com.example.GridTests"/>
        </classes>
    </test>
</suite></pre>
</div>

<h2>Parallel Test Implementation</h2>
<div class="code-block">
    <strong>ParallelGridTests.java:</strong>
    <pre>public class ParallelGridTests {
    private WebDriver driver;
    
    @BeforeMethod
    public void setup() throws Exception {
        URL hubURL = new URL("http://localhost:4444");
        driver = new RemoteWebDriver(hubURL, new ChromeOptions());
    }
    
    @Test
    public void test1() {
        driver.navigate().to("https://www.google.com");
        Assert.assertTrue(driver.getTitle().contains("Google"));
    }
    
    @AfterMethod
    public void teardown() {
        driver.quit();
    }
}</pre>
</div>
"""
    }
}

# Module 12 sections
m12_sections = {
    "01_Jenkins": {
        "title": "Jenkins",
        "icon": "fa-server",
        "description": "Integrate Selenium tests with Jenkins CI/CD pipeline for automated testing.",
        "content": """
<h2>Jenkins Setup for Selenium</h2>
<p>Jenkins is a powerful CI/CD tool that automates testing and deployment processes.</p>

<h2>Jenkins Job Configuration</h2>
<ol>
    <li>Install Jenkins plugins: Selenium, TestNG, Git</li>
    <li>Create a new Freestyle Job</li>
    <li>Configure Git repository</li>
    <li>Add build step to run tests</li>
    <li>Configure post-build actions for reports</li>
</ol>

<h2>Build Step Command</h2>
<div class="code-block">
    <strong>Maven Command:</strong>
    <pre>mvn clean test -Dgroups="smoke"</pre>
</div>

<h2>Java Selenium with Jenkins</h2>
<div class="code-block">
    <strong>JenkinsIntegration.java:</strong>
    <pre>public class JenkinsIntegration {
    public static void main(String[] args) {
        String env = System.getProperty("env", "dev");
        String browser = System.getProperty("browser", "chrome");
        
        System.out.println("Environment: " + env);
        System.out.println("Browser: " + browser);
    }
}</pre>
</div>
"""
    },
    "02_GitHub_Actions": {
        "title": "GitHub Actions",
        "icon": "fa-github",
        "description": "Automate Selenium test execution using GitHub Actions workflows.",
        "content": """
<h2>GitHub Actions Workflow for Selenium</h2>
<p>GitHub Actions provides CI/CD directly in your GitHub repository.</p>

<h2>Workflow File (.github/workflows/tests.yml)</h2>
<div class="code-block">
    <strong>GitHub Actions Workflow:</strong>
    <pre>name: Selenium Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-java@v2
        with:
          java-version: '11'
      
      - name: Run tests
        run: mvn clean test
      
      - name: Upload reports
        if: always()
        uses: actions/upload-artifact@v2
        with:
          name: test-reports
          path: target/surefire-reports/</pre>
</div>
"""
    },
    "03_Maven_Integration": {
        "title": "Maven Integration",
        "icon": "fa-cube",
        "description": "Configure Maven for running Selenium tests with proper dependencies and plugins.",
        "content": """
<h2>Maven POM Configuration</h2>
<div class="code-block">
    <strong>pom.xml:</strong>
    <pre><dependencies>
    <dependency>
        <groupId>org.seleniumhq.selenium</groupId>
        <artifactId>selenium-java</artifactId>
        <version>4.0.0</version>
    </dependency>
    <dependency>
        <groupId>org.testng</groupId>
        <artifactId>testng</artifactId>
        <version>7.5.1</version>
    </dependency>
</dependencies></pre>
</div>

<h2>Maven Surefire Plugin</h2>
<div class="code-block">
    <strong>Surefire Configuration:</strong>
    <pre><plugins>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>2.22.2</version>
        <configuration>
            <suiteXmlFiles>
                <suiteXmlFile>testng.xml</suiteXmlFile>
            </suiteXmlFiles>
        </configuration>
    </plugin>
</plugins></pre>
</div>
"""
    },
    "04_TestNG_Jenkins": {
        "title": "TestNG Jenkins Integration",
        "icon": "fa-link",
        "description": "Combine TestNG and Jenkins for comprehensive test execution and reporting.",
        "content": """
<h2>TestNG with Jenkins Best Practices</h2>
<ul>
    <li>Use TestNG XML files for test organization</li>
    <li>Implement proper test groups and dependencies</li>
    <li>Configure Jenkins pipeline with TestNG reports</li>
    <li>Set up email notifications for test results</li>
</ul>

<h2>Jenkins Pipeline with TestNG</h2>
<div class="code-block">
    <strong>Jenkinsfile:</strong>
    <pre>pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Report') {
            steps {
                junit 'target/surefire-reports/*.xml'
            }
        }
    }
}</pre>
</div>
"""
    }
}

# Create Module 11 files
print("Creating Module 11 files...")
for section_dir, data in m11_sections.items():
    section_num = int(section_dir[:2])
    section_name = data["title"]
    
    # Create nav items for all sections
    nav_items = f'''<a class="nav-link" href="../01_Grid_Setup/01_Grid_Setup.html"><i class="fas fa-cube"></i> Grid Setup</a>
<a class="nav-link" href="../02_Remote_Execution/02_Remote_Execution.html"><i class="fas fa-network-wired"></i> Remote Execution</a>
<a class="nav-link" href="../03_Docker_Selenium_Grid/03_Docker_Selenium_Grid.html"><i class="fas fa-docker"></i> Docker Selenium Grid</a>
<a class="nav-link" href="../04_Parallel_TestNG/04_Parallel_TestNG.html"><i class="fas fa-tasks"></i> Parallel TestNG</a>'''
    
    prev_section = section_num - 1 if section_num > 1 else None
    next_section = section_num + 1 if section_num < 4 else None
    
    prev_button = ""
    next_button = ""
    
    if prev_section:
        prev_names = ["Grid Setup", "Remote Execution", "Docker Selenium Grid"]
        if prev_section <= len(prev_names):
            prev_name = prev_names[prev_section - 1].replace(" ", "_")
            prev_button = f'<a href="../{prev_section:02d}_{prev_name}/{prev_section:02d}_{prev_name}.html" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Previous</a>'
    
    if next_section:
        next_names = ["Remote Execution", "Docker Selenium Grid", "Parallel TestNG"]
        if next_section <= len(next_names) + 1:
            next_name = next_names[next_section - 2].replace(" ", "_") if next_section <= len(next_names) + 1 else ""
            if next_name:
                next_button = f'<a href="../{next_section:02d}_{next_name}/{next_section:02d}_{next_name}.html" class="btn btn-primary">Next <i class="fas fa-arrow-right"></i></a>'
    
    content = {
        'description': data['description'],
        'main_content': data['content'],
        'nav_items': nav_items,
        'best_practices': '<li>Follow industry best practices</li><li>Maintain clean code structure</li>',
        'quiz': '<li>Key concepts questions</li>',
        'prev_button': prev_button,
        'next_button': next_button
    }
    
    create_html_file(11, "Selenium Grid and Parallel Testing", section_num, section_name, data['icon'], content)

# Create Module 12 files
print("\nCreating Module 12 files...")
for section_dir, data in m12_sections.items():
    section_num = int(section_dir[:2])
    section_name = data["title"]
    
    nav_items = '''<a class="nav-link" href="../01_Jenkins/01_Jenkins.html"><i class="fas fa-server"></i> Jenkins</a>
<a class="nav-link" href="../02_GitHub_Actions/02_GitHub_Actions.html"><i class="fas fa-github"></i> GitHub Actions</a>
<a class="nav-link" href="../03_Maven_Integration/03_Maven_Integration.html"><i class="fas fa-cube"></i> Maven Integration</a>
<a class="nav-link" href="../04_TestNG_Jenkins/04_TestNG_Jenkins.html"><i class="fas fa-link"></i> TestNG Jenkins</a>'''
    
    prev_button = ""
    next_button = ""
    
    if section_num > 1:
        prev_sections = ["Jenkins", "GitHub_Actions", "Maven_Integration"]
        if section_num - 1 <= len(prev_sections):
            prev_name = prev_sections[section_num - 2]
            prev_button = f'<a href="../{section_num - 1:02d}_{prev_name}/{section_num - 1:02d}_{prev_name}.html" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Previous</a>'
    
    if section_num < 4:
        next_sections = ["GitHub_Actions", "Maven_Integration", "TestNG_Jenkins"]
        if section_num <= len(next_sections):
            next_name = next_sections[section_num - 1]
            next_button = f'<a href="../{section_num + 1:02d}_{next_name}/{section_num + 1:02d}_{next_name}.html" class="btn btn-primary">Next <i class="fas fa-arrow-right"></i></a>'
    
    content = {
        'description': data['description'],
        'main_content': data['content'],
        'nav_items': nav_items,
        'best_practices': '<li>Follow CI/CD best practices</li>',
        'quiz': '<li>CI/CD integration questions</li>',
        'prev_button': prev_button,
        'next_button': next_button
    }
    
    create_html_file(12, "CI_CD_Integration", section_num, section_name, data['icon'], content)

print("\nModule files creation completed!")
