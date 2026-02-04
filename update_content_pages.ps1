$baseDir = "c:\Users\sedhu\Downloads\Java_Selinium"
$contentDir = "$baseDir\content"

$files = Get-ChildItem -Path $contentDir -Filter "*.html"

foreach ($file in $files) {
    if ($file.Name -match "demo") { continue } # Skip demo page

    $contentRaw = Get-Content -Path $file.FullName -Raw

    # Look for the code block: <pre><code class="language-java">...</code></pre>
    # Note: Regex needs to be careful about matching the closing pre
    if ($contentRaw -match '(?ms)(<pre><code class="language-java">.*?</code></pre>)') {
        $fullCodeBlock = $matches[1]
        
        # Extract just the code inside for parsing
        if ($fullCodeBlock -match '(?ms)<code class="language-java">(.*?)</code>') {
            $extractedCode = $matches[1].Trim()
            
            # --- Parse Steps ---
            $lines = $extractedCode -split "`r`n"
            $steps = @()
            $targetUrl = ""
            
            foreach ($line in $lines) {
                $line = $line.Trim()
                 if ($line -match 'driver\.get\("(.*?)"\)') {
                    $targetUrl = $matches[1]
                }
                if ($line.StartsWith("//")) {
                    $step = $line.Substring(2).Trim()
                    if ($step -ne "") {
                        $steps += $step
                    }
                }
            }
            
            if ($steps.Count -eq 0) {
                 # If no comments, maybe it's too simple or different format
                 # We'll skip replacing to be safe, OR just say "Implement the logic"
                 $steps += "Implement the automation logic provided in the reference."
            }

            $stepsHtml = ""
            foreach ($s in $steps) {
                $stepsHtml += "<li>$s</li>`n"
            }
            
            $urlHtml = ""
            if ($targetUrl -ne "") {
                $urlHtml = "<p><strong>Target URL:</strong> <a href=`"$targetUrl`" target=`"_blank`" style=`"color:#00e676`">$targetUrl</a></p>"
            }

            # --- New HTML Block ---
            $newHtml = @"
<div class="scenario-box">
    <h3>Practice Scenario</h3>
    $urlHtml
    <p><strong>Goal:</strong> Write a script to achieve the following:</p>
    <ol>
        $stepsHtml
    </ol>
</div>
"@
            
            # --- Replace ---
            # We replace the entire <pre>...</pre> block with the new div
            # Use dot NET Replace for reliability with special chars
            $newContent = $contentRaw.Replace($fullCodeBlock, $newHtml)
            
            Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
            Write-Host "Replaced Code with Scenario in $($file.Name)"
        }
    } else {
        Write-Host "No Java code block found in $($file.Name)"
    }
}
