$baseDir = "c:\Users\sedhu\Downloads\Java_Selinium\Java_Selenium_Automation_Curriculum"

# Array of modules with their topic folders and files
$modules = @{
    "02. Core Java for Selenium" = @{
        "01_Basics_and_Syntax" = "01_Basics_and_Syntax.html"
        "02_OOPs_Concepts" = "02_OOPs_Concepts.html"
        "03_Collections_Framework" = "03_Collections_Framework.html"
        "04_Exception_Handling" = "04_Exception_Handling.html"
        "05_File_Handling" = "05_File_Handling.html"
        "06_Streams_and_Lambda" = "06_Streams_and_Lambda.html"
    }
    "03. Environment Setup" = @{
        "01_JDK_and_IDE" = "01_JDK_and_IDE.html"
        "02_Maven_and_Gradle" = "02_Maven_and_Gradle.html"
        "04_Browser_Drivers" = "04_Browser_Drivers.html"
        "05_Git_and_GitHub" = "05_Git_and_GitHub.html"
    }
    "04. Selenium Basics" = @{
        "01_WebDriver_Overview" = "01_WebDriver_Overview.html"
        "02_Browser_Commands" = "02_Browser_Commands.html"
        "03_Navigation_Commands" = "03_Navigation_Commands.html"
        "04_Locators" = "04_Locators.html"
        "05_WebElement_Methods" = "05_WebElement_Methods.html"
        "06_Basic_HTML_Controls" = "06_Basic_HTML_Controls.html"
    }
    "05. Advanced Selenium" = @{
        "01_Waits_Implicit_Explicit" = "01_Waits_Implicit_Explicit.html"
        "02_Handling_Dropdowns_Alerts" = "02_Handling_Dropdowns_Alerts.html"
        "03_Frames_Windows" = "03_Frames_Windows.html"
        "04_Actions_Class" = "04_Actions_Class.html"
        "05_JavaScriptExecutor" = "05_JavaScriptExecutor.html"
        "06_Advanced_HTML_Controls" = "06_Advanced_HTML_Controls.html"
    }
    "06. TestNG Framework" = @{
        "01_Introduction" = "01_Introduction.html"
        "02_Annotations" = "02_Annotations.html"
        "03_Assertions" = "03_Assertions.html"
        "04_DataProviders" = "04_DataProviders.html"
        "05_Parallel_Execution" = "05_Parallel_Execution.html"
        "06_Reports" = "06_Reports.html"
    }
    "07. Page Object Model" = @{
        "01_Concept" = "01_Concept.html"
        "02_Implementation" = "02_Implementation.html"
        "03_PageFactory" = "03_PageFactory.html"
        "04_Best_Practices" = "04_Best_Practices.html"
    }
    "08. Framework Development" = @{
        "01_Modular_Framework" = "01_Modular_Framework.html"
        "02_Data_Driven_Framework" = "02_Data_Driven_Framework.html"
        "03_Keyword_Driven_Framework" = "03_Keyword_Driven_Framework.html"
        "04_Hybrid_Framework" = "04_Hybrid_Framework.html"
    }
    "09. Data Handling" = @{
        "01_Excel_with_Apache_POI" = "01_Excel_with_Apache_POI.html"
        "02_Properties_Files" = "02_Properties_Files.html"
        "03_JSON_and_XML" = "03_JSON_and_XML.html"
        "04_Database_Connection" = "04_Database_Connection.html"
    }
    "10. Logging and Reporting" = @{
        "01_Log4j" = "01_Log4j.html"
        "02_Extent_Reports" = "02_Extent_Reports.html"
        "03_Allure_Reports" = "03_Allure_Reports.html"
    }
}

Write-Host "Generating all remaining HTML files..." -ForegroundColor Green

$totalCreated = 0

foreach ($module in $modules.Keys) {
    Write-Host "`nProcessing Module: $module" -ForegroundColor Cyan
    
    $topics = $modules[$module]
    
    foreach ($topicFolder in $topics.Keys) {
        $htmlFile = $topics[$topicFolder]
        $filePath = "$baseDir\$module\$topicFolder\$htmlFile"
        
        # Check if file exists
        if (-not (Test-Path $filePath)) {
            Write-Host "Creating: $topicFolder/$htmlFile" -ForegroundColor Yellow
            $totalCreated++
        } else {
            Write-Host "Already exists: $topicFolder/$htmlFile" -ForegroundColor Gray
        }
    }
}

Write-Host "`n✓ Summary: Total files to create: $totalCreated" -ForegroundColor Green
