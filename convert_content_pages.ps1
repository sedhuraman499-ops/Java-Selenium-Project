$contentDir = ".\content"
$files = @(
    "_01_demo_page_.html",
    "_02_java.html",
    "_03_intro___.html",
    "_04_web_driver_commands___.html",
    "_05_auto_webdriver_manager___.html",
    "_06_chrome_options___.html",
    "_07_page_load_strategy___.html",
    "_08_locators___.html",
    "_10_navigation___.html",
    "_11_basic_html_controls___.html",
    "_12_advanced_html_controls___.html",
    "_13_dropdown___.html",
    "_14_waits_and_synchronization___.html",
    "_15_iframe_handling___.html",
    "_16_alerts_and_popups___.html",
    "_17_drag_drop___.html",
    "_18_keyboard_actions___.html",
    "_19_mouse_actions___.html",
    "_20_scrolling_page___.html",
    "_21_multi_select___.html",
    "_22_find_all_links___.html",
    "_23_window_handling___.html",
    "_24_file_upload_download___.html",
    "_25_screenshots___.html",
    "_26_common_selenium_exceptions___.html",
    "_27_page_object_model___.html",
    "_28_testng___.html",
    "_29_maven_and_project_structure___.html",
    "_30_reports___.html",
    "_31_extra___.html",
    "_32_connect_with_local_host.html"
)

$successCount = 0

foreach ($filename in $files) {
    $filepath = Join-Path $contentDir $filename
    
    if (!(Test-Path $filepath)) {
        Write-Host "File not found: $filepath"
        continue
    }
    
    try {
        $content = Get-Content $filepath -Raw -Encoding UTF8
        
        # Skip if already has DOCTYPE
        if ($content.StartsWith("<!DOCTYPE")) {
            Write-Host "Skipping $filename (already converted)"
            continue
        }
        
        # Extract title from filename
        $title = $filename.Replace(".html", "").Replace("_", " ")
        $title = "Content: $title"
        
        # Read the template from file or create inline
        $htmlStart = @'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{TITLE}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <!-- SIDEBAR -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h2><i class="fas fa-book-open"></i><br>SELENIUM<br>MASTER</h2>
            <p>Automation Training</p>
            <button id="home-btn" class="home-btn" onclick="goHome()">🏠 Home</button>
        </div>
        <ul id="topic-list">
        </ul>
    </nav>

    <!-- CONTENT AREA -->
    <main id="main-content">
        <div id="content-display">
'@

        $htmlEnd = @'
        </div>
    </main>

    <script src="../js/sidebar.js"></script>
</body>
</html>
'@
        
        # Replace title placeholder
        $htmlStart = $htmlStart.Replace("{TITLE}", $title)
        
        # Combine all parts
        $newContent = $htmlStart + "`n" + $content + "`n" + $htmlEnd
        
        # Write the new file
        Set-Content -Path $filepath -Value $newContent -Encoding UTF8
        Write-Host "Converted: $filename"
        $successCount++
    }
    catch {
        Write-Host "Error converting $filename : $_"
    }
}

Write-Host "Successfully converted $successCount/$($files.Count) files"
