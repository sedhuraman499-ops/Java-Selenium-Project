$baseDir = "c:\Users\sedhu\Downloads\Java_Selinium"
$contentDir = "$baseDir\content"
$wsDir = "$baseDir\worksheets"

$fileMap = @{
    "ws_demo_page.html" = "_00_demo_page_.html";
    "ws_java_prerequisites.html" = "_00_java.html";
    "ws_intro.html" = "_01_intro___.html";
    "ws_webdriver_commands.html" = "_02_web_driver_commands___.html";
    "ws_auto_webdriver.html" = "_03_auto_webdriver_manager___.html";
    "ws_chrome_options.html" = "_04_chrome_options___.html";
    "ws_page_load_strategy.html" = "_05_page_load_strategy___.html";
    "ws_locators.html" = "_06_locators___.html";
    "ws_navigation.html" = "_07_navigation___.html";
    "ws_basic_html.html" = "_08_basic_html_controls___.html";
    "ws_advanced_html.html" = "_09_advanced_html_controls___.html";
    "ws_dropdown.html" = "_10_dropdown___.html";
    "ws_waits.html" = "_11_waits_and_synchronization___.html";
    "ws_iframes.html" = "_12_iframe_handling___.html";
    "ws_alerts.html" = "_13_alerts_and_popups___.html";
    "ws_drag_drop.html" = "_14_drag_drop___.html";
    "ws_keyboard.html" = "_15_keyboard_actions___.html";
    "ws_mouse.html" = "_16_mouse_actions___.html";
    "ws_scrolling.html" = "_17_scrolling_page___.html";
    "ws_multi_select.html" = "_18_multi_select___.html";
    "ws_find_all_links.html" = "_19_find_all_links___.html";
    "ws_window_handling.html" = "_20_window_handling___.html";
    "ws_file_upload.html" = "_21_file_upload_download___.html";
    "ws_screenshots.html" = "_22_screenshots___.html";
    "ws_exceptions.html" = "_23_common_selenium_exceptions___.html";
    "ws_pom.html" = "_24_page_object_model___.html";
    "ws_testng.html" = "_25_testng___.html";
    "ws_maven.html" = "_26_maven_and_project_structure___.html";
    "ws_reports.html" = "_27_reports___.html";
    "ws_extras.html" = "_28_extra___.html";
    "ws_localhost.html" = "_99_connect_with_local_host.html";
}

foreach ($key in $fileMap.Keys) {
    $wsFile = "$wsDir\$key"
    $contentFile = "$contentDir\$($fileMap[$key])"

    if (Test-Path $contentFile) {
        $contentRaw = Get-Content -Path $contentFile -Raw
        
        # Extract code block
        if ($contentRaw -match '(?ms)<code class="language-java">(.*?)</code>') {
            $extractedCode = $matches[1].Trim()
            
            # --- Analysis ---
            $lines = $extractedCode -split "`r`n"
            $steps = @()
            $targetUrl = "Not specified (Use generic Demo URL)"
            
            foreach ($line in $lines) {
                $line = $line.Trim()
                # Extract URL
                if ($line -match 'driver\.get\("(.*?)"\)') {
                    $targetUrl = $matches[1]
                }
                # Extract Comments as Steps
                if ($line.StartsWith("//")) {
                    $step = $line.Substring(2).Trim()
                    if ($step -ne "") {
                        $steps += $step
                    }
                }
            }
            
            if ($steps.Count -eq 0) {
                # Fallback if no comments found
                $steps += "Replicate the code logic provided in the Example."
                $steps += "Verify the output."
            }

            # --- Build New HTML ---
            $stepsHtml = ""
            foreach ($s in $steps) {
                $stepsHtml += "<li>$s</li>`n"
            }

            $newScenarioHtml = @"
        <h2>Practice Scenario</h2>
        <div class="task-box">
            <p><strong>Target URL:</strong> <a href="$targetUrl" target="_blank">$targetUrl</a></p>
            <p><strong>Steps to Automate:</strong></p>
            <ol>
                $stepsHtml
            </ol>
        </div>
"@

            # --- Inject into Worksheet ---
            if (Test-Path $wsFile) {
                $wsRaw = Get-Content -Path $wsFile -Raw
                
                # We need to replace everything between 
                # <h2>Scenario 1...
                # and
                # <hr style... (The separator before practice area)
                
                # Regex to match the old generic scenarios block
                # Starts with <h2>Scenario 1
                # Ends before <hr style=...
                
                $pattern = '(?ms)<h2>Scenario 1:.*?<hr style="'
                
                # Check if file has "Scenario 1" (Standard template)
                if ($wsRaw -match "Scenario 1:") {
                    # Construct replacement: New Block + The HR tag that was consumed by regex lookahead/match
                    $replacement = "$newScenarioHtml`n        <hr style=`""
                    
                    $newWsContent = $wsRaw -replace $pattern, $replacement
                    
                    Set-Content -Path $wsFile -Value $newWsContent -Encoding UTF8
                    Write-Host "Refined Questions in $key"
                } else {
                    Write-Host "Could not find standard 'Scenario 1' block in $key (Maybe already updated?)"
                }
            }
        }
    }
}
