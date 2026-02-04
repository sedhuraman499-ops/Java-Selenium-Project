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
        
        # Regex to find code block in content
        # Looking for <code class="language-java"> ... </code>
        if ($contentRaw -match '(?ms)<code class="language-java">(.*?)</code>') {
            $extractedCode = $matches[1].Trim()
             # Escape special chars for substitution if needed, but simple string replacement is safer
            
            Write-Host "Found code for $key"

            if (Test-Path $wsFile) {
                $wsRaw = Get-Content -Path $wsFile -Raw

                # The placeholder to look for
                $placeholder = "// This is a placeholder for the solution."
                
                # Check if placeholder exists to avoid double replacement or errors
                if ($wsRaw -match "Placeholder for the solution") {
                   
                    # We want to replace the whole content inside <pre class="code-snippet">...</pre> ideally,
                    # or just the placeholder text.
                    # The previous injection was:
                    # <pre class="code-snippet">
                    # // This is a placeholder...
                    # ...
                    # </pre>
                    
                    # Let's match the inner part of pre
                    $pattern = '(?ms)<pre class="code-snippet">\s*// This is a placeholder.*?</pre>'
                    $replacement = "<pre class=`"code-snippet`">`n$extractedCode`n</pre>"
                    
                    $newWsContent = $wsRaw -replace $pattern, $replacement
                    
                    Set-Content -Path $wsFile -Value $newWsContent -Encoding UTF8
                    Write-Host "Updated $key with code."
                } else {
                    Write-Host "Placeholder not found in $key (Matched 'Placeholder for the solution' string)"
                }
            } else {
                Write-Host "Worksheet $wsFile not found."
            }
        } else {
            Write-Host "No Java code found in $($fileMap[$key])"
        }
    } else {
        Write-Host "Content file $contentFile not found."
    }
}
