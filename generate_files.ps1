$baseDir = "c:\Users\sedhu\Downloads\Java_Selinium\Java_Selenium_Automation_Curriculum"

# Template function to create HTML files
function Create-HTMLFile {
    param(
        [string]$ModuleNum,
        [string]$ModuleName,
        [string]$TopicFolder,
        [string]$TopicName,
        [string]$FilePath
    )
    
    $topicNameClean = $TopicName -replace '\s+', ' '
    $moduleNumFormatted = [int]$ModuleNum
    
    # Create directory if it doesn't exist
    $directory = Split-Path $FilePath
    if (-not (Test-Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
    }
    
    $backLink = "../{0:D2}_{1}.html" -f $moduleNumFormatted, ($ModuleName -replace ' ', '_')
    $breadcrumb = "Module {0:D2}" -f $moduleNumFormatted
    
    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$TopicName | Module $($moduleNumFormatted:D2) | Java Selenium Curriculum</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/themes/prism-tomorrow.min.css">
    <link rel="stylesheet" href="../../../assets/css/main.css">
</head>
<body>
    <div class="app-container">
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header"><h5><i class="fas fa-file-alt me-2"></i> $TopicName</h5></div>
            <ul class="list-unstyled components">
                <li><a href="../../../index.html"><i class="fas fa-home me-2"></i> Home</a></li>
                <li><a href="$backLink"><i class="fas fa-arrow-left me-2"></i> Back to Module</a></li>
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
                        <h4 class="mb-0"><i class="fas fa-file-alt me-2"></i> $TopicName</h4>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="../../../index.html">Home</a></li>
                                <li class="breadcrumb-item"><a href="$backLink">$breadcrumb</a></li>
                                <li class="breadcrumb-item active">$TopicName</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </nav>

            <div class="content-wrapper p-4">
                <section class="mb-5" id="overview">
                    <h2><i class="fas fa-file-alt me-2"></i> $TopicName</h2>
                    <p class="lead">This section covers $($topicNameClean.ToLower()), an essential topic in Java Selenium automation testing.</p>
                    
                    <div class="alert alert-info">
                        <i class="fas fa-lightbulb me-2"></i>
                        <strong>Learning Objective:</strong> Understand and implement $($topicNameClean.ToLower()) in your automation tests.
                    </div>
                </section>

                <section class="mb-5" id="key-concepts">
                    <h3><i class="fas fa-key me-2"></i> Key Concepts</h3>
                    
                    <h5 class="mt-4 mb-3">Introduction</h5>
                    <p>$TopicName is an important aspect of test automation. It allows you to:</p>
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
// Example code for $TopicName
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
                        <li>$TopicName is essential for robust automation testing</li>
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
                        <li>What are the main benefits of $($topicNameClean.ToLower())?</li>
                        <li>How would you implement $($topicNameClean.ToLower()) in your tests?</li>
                        <li>What are the best practices for $($topicNameClean.ToLower())?</li>
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
                                <a href="$backLink" class="btn btn-sm btn-outline-primary me-2">Back to Module</a>
                                <a href="#" class="btn btn-sm btn-primary">Next Topic <i class="fas fa-arrow-right ms-2"></i></a>
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
"@
    
    Set-Content -Path $FilePath -Value $html -Encoding UTF8
}

# Module structure
$modules = @(
    @{
        ModuleNum = "02"
        ModuleName = "Core Java for Selenium"
        Topics = @(
            @{ Folder = "01_Basics_and_Syntax"; Name = "Basics and Syntax" }
            @{ Folder = "02_OOPs_Concepts"; Name = "OOPs Concepts" }
            @{ Folder = "03_Collections_Framework"; Name = "Collections Framework" }
            @{ Folder = "04_Exception_Handling"; Name = "Exception Handling" }
            @{ Folder = "05_File_Handling"; Name = "File Handling" }
            @{ Folder = "06_Streams_and_Lambda"; Name = "Streams and Lambda" }
        )
    }
    @{
        ModuleNum = "03"
        ModuleName = "Environment Setup"
        Topics = @(
            @{ Folder = "01_JDK_and_IDE"; Name = "JDK and IDE" }
            @{ Folder = "02_Maven_and_Gradle"; Name = "Maven and Gradle" }
            @{ Folder = "04_Browser_Drivers"; Name = "Browser Drivers" }
            @{ Folder = "05_Git_and_GitHub"; Name = "Git and GitHub" }
        )
    }
    @{
        ModuleNum = "04"
        ModuleName = "Selenium Basics"
        Topics = @(
            @{ Folder = "01_WebDriver_Overview"; Name = "WebDriver Overview" }
            @{ Folder = "02_Browser_Commands"; Name = "Browser Commands" }
            @{ Folder = "03_Navigation_Commands"; Name = "Navigation Commands" }
            @{ Folder = "04_Locators"; Name = "Locators" }
            @{ Folder = "05_WebElement_Methods"; Name = "WebElement Methods" }
            @{ Folder = "06_Basic_HTML_Controls"; Name = "Basic HTML Controls" }
        )
    }
    @{
        ModuleNum = "05"
        ModuleName = "Advanced Selenium"
        Topics = @(
            @{ Folder = "01_Waits_Implicit_Explicit"; Name = "Waits - Implicit & Explicit" }
            @{ Folder = "02_Handling_Dropdowns_Alerts"; Name = "Handling Dropdowns & Alerts" }
            @{ Folder = "03_Frames_Windows"; Name = "Frames and Windows" }
            @{ Folder = "04_Actions_Class"; Name = "Actions Class" }
            @{ Folder = "05_JavaScriptExecutor"; Name = "JavaScriptExecutor" }
            @{ Folder = "06_Advanced_HTML_Controls"; Name = "Advanced HTML Controls" }
        )
    }
    @{
        ModuleNum = "06"
        ModuleName = "TestNG Framework"
        Topics = @(
            @{ Folder = "01_Introduction"; Name = "TestNG Introduction" }
            @{ Folder = "02_Annotations"; Name = "TestNG Annotations" }
            @{ Folder = "03_Assertions"; Name = "Assertions" }
            @{ Folder = "04_DataProviders"; Name = "DataProviders" }
            @{ Folder = "05_Parallel_Execution"; Name = "Parallel Execution" }
            @{ Folder = "06_Reports"; Name = "Test Reports" }
        )
    }
    @{
        ModuleNum = "07"
        ModuleName = "Page Object Model"
        Topics = @(
            @{ Folder = "01_Concept"; Name = "POM Concept" }
            @{ Folder = "02_Implementation"; Name = "POM Implementation" }
            @{ Folder = "03_PageFactory"; Name = "PageFactory" }
            @{ Folder = "04_Best_Practices"; Name = "POM Best Practices" }
        )
    }
    @{
        ModuleNum = "08"
        ModuleName = "Framework Development"
        Topics = @(
            @{ Folder = "01_Modular_Framework"; Name = "Modular Framework" }
            @{ Folder = "02_Data_Driven_Framework"; Name = "Data Driven Framework" }
            @{ Folder = "03_Keyword_Driven_Framework"; Name = "Keyword Driven Framework" }
            @{ Folder = "04_Hybrid_Framework"; Name = "Hybrid Framework" }
        )
    }
    @{
        ModuleNum = "09"
        ModuleName = "Data Handling"
        Topics = @(
            @{ Folder = "01_Excel_with_Apache_POI"; Name = "Excel with Apache POI" }
            @{ Folder = "02_Properties_Files"; Name = "Properties Files" }
            @{ Folder = "03_JSON_and_XML"; Name = "JSON and XML" }
            @{ Folder = "04_Database_Connection"; Name = "Database Connection" }
        )
    }
    @{
        ModuleNum = "10"
        ModuleName = "Logging and Reporting"
        Topics = @(
            @{ Folder = "01_Log4j"; Name = "Log4j Logging" }
            @{ Folder = "02_Extent_Reports"; Name = "Extent Reports" }
            @{ Folder = "03_Allure_Reports"; Name = "Allure Reports" }
        )
    }
)

Write-Host "Starting HTML file generation for modules 02-10...`n" -ForegroundColor Green

$totalCreated = 0

foreach ($module in $modules) {
    $moduleFolderName = "{0}. {1}" -f $module.ModuleNum, $module.ModuleName
    Write-Host "Processing: $moduleFolderName" -ForegroundColor Cyan
    
    foreach ($topic in $module.Topics) {
        $htmlFileName = $topic.Folder + ".html"
        $filePath = Join-Path -Path $baseDir -ChildPath $moduleFolderName -AdditionalChildPath $topic.Folder, $htmlFileName
        
        if (-not (Test-Path $filePath)) {
            Create-HTMLFile -ModuleNum $module.ModuleNum -ModuleName $module.ModuleName -TopicFolder $topic.Folder -TopicName $topic.Name -FilePath $filePath
            Write-Host "  ✓ Created: $($topic.Folder)/$htmlFileName" -ForegroundColor Green
            $totalCreated++
        } else {
            Write-Host "  ⊘ Already exists: $($topic.Folder)/$htmlFileName" -ForegroundColor Gray
        }
    }
}

Write-Host "`n✓ Total files created: $totalCreated" -ForegroundColor Green
