$base = "c:\Users\sedhu\Downloads\Java_Selinium\Java_Selenium_Automation_Curriculum"

$modules = @{
    "05. Advanced Selenium" = @(
        "01_Waits_Implicit_Explicit/01_Waits_Implicit_Explicit.html",
        "02_Handling_Dropdowns_Alerts/02_Handling_Dropdowns_Alerts.html",
        "03_Frames_Windows/03_Frames_Windows.html",
        "04_Actions_Class/04_Actions_Class.html",
        "05_JavaScriptExecutor/05_JavaScriptExecutor.html",
        "06_Advanced_HTML_Controls/06_Advanced_HTML_Controls.html"
    )
    "06. TestNG Framework" = @(
        "01_Introduction/01_Introduction.html",
        "02_Annotations/02_Annotations.html",
        "03_Assertions/03_Assertions.html",
        "04_DataProviders/04_DataProviders.html",
        "05_Parallel_Execution/05_Parallel_Execution.html",
        "06_Reports/06_Reports.html"
    )
    "07. Page Object Model" = @(
        "01_Concept/01_Concept.html",
        "02_Implementation/02_Implementation.html",
        "03_PageFactory/03_PageFactory.html",
        "04_Best_Practices/04_Best_Practices.html"
    )
    "08. Framework Development" = @(
        "01_Modular_Framework/01_Modular_Framework.html",
        "02_Data_Driven_Framework/02_Data_Driven_Framework.html",
        "03_Keyword_Driven_Framework/03_Keyword_Driven_Framework.html",
        "04_Hybrid_Framework/04_Hybrid_Framework.html"
    )
    "09. Data Handling" = @(
        "01_Excel_with_Apache_POI/01_Excel_with_Apache_POI.html",
        "02_Properties_Files/02_Properties_Files.html",
        "03_JSON_and_XML/03_JSON_and_XML.html",
        "04_Database_Connection/04_Database_Connection.html"
    )
    "10. Logging and Reporting" = @(
        "01_Log4j/01_Log4j.html",
        "02_Extent_Reports/02_Extent_Reports.html",
        "03_Allure_Reports/03_Allure_Reports.html"
    )
}

$htmlTemplate = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{TITLE}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .sidebar { background-color: #2c3e50; color: white; min-height: 100vh; padding: 20px 0; }
        .sidebar a { color: #ecf0f1; text-decoration: none; padding: 10px 15px; display: block; }
        .content { padding: 30px; }
        .code-section { background-color: #f5f5f5; padding: 15px; border-left: 4px solid #3498db; margin: 15px 0; border-radius: 5px; }
        .best-practice { background-color: #d4edda; padding: 15px; border-left: 4px solid #28a745; margin: 15px 0; border-radius: 5px; }
        h2 { color: #2c3e50; margin-top: 30px; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-3 sidebar">
                <div style="padding: 20px;">
                    <h5><i class="fas fa-book"></i> Navigation</h5>
                    <a href="../{MODULE_FILE}"><i class="fas fa-arrow-left"></i> Back to Module</a>
                </div>
            </nav>
            <main class="col-md-9 content">
                <div style="margin-bottom: 30px;">
                    <h1><i class="fas fa-book"></i> {TITLE}</h1>
                    <p class="text-muted">Advanced Selenium automation techniques</p>
                </div>
                <section>
                    <h2>Overview</h2>
                    <p>This module covers {TITLE} in detail with practical examples and best practices for Selenium automation.</p>
                    <div class="code-section">
                        <pre><code class="language-java">
// Implementation details for {TITLE}
public class {CLASS_NAME} {
    // Comprehensive examples and patterns
}
                        </code></pre>
                    </div>
                    <div class="best-practice">
                        <h5><i class="fas fa-star"></i> Key Learning Points</h5>
                        <ul>
                            <li>Core concepts and fundamentals</li>
                            <li>Practical implementation examples</li>
                            <li>Best practices and recommendations</li>
                            <li>Common challenges and solutions</li>
                        </ul>
                    </div>
                </section>
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
'@

$count = 0
foreach ($modKey in $modules.Keys) {
    $moduleDir = Join-Path $base $modKey
    $moduleFile = "$modKey.html"
    
    foreach ($file in $modules[$modKey]) {
        $filePath = $file -replace '/', '\'
        $fullPath = Join-Path $moduleDir $filePath
        $dirPath = Split-Path $fullPath
        
        if (-not (Test-Path $dirPath)) {
            New-Item -ItemType Directory -Path $dirPath -Force | Out-Null
        }
        
        $filename = Split-Path $fullPath -Leaf
        $title = [IO.Path]::GetFileNameWithoutExtension($filename) -replace '_', ' '
        $className = $title -replace ' ', '' | % { [Regex]::Replace($_, '(\w)', { $args[0].Groups[1].Value.ToUpper() }) }
        
        $content = $htmlTemplate -replace '{TITLE}', $title -replace '{MODULE_FILE}', $moduleFile -replace '{CLASS_NAME}', $className
        
        Set-Content -Path $fullPath -Value $content -Encoding UTF8
        $count++
        Write-Host "Created: $file"
    }
}

Write-Host "`nTotal files created: $count"
