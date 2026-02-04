$WORKSHEET_DIR = "c:\Users\sedhu\Downloads\Java_Selinium\worksheets"

$CSS_INJECTION = @"
    <style>
        .practice-input {
            width: 100%;
            height: 200px;
            padding: 15px;
            font-family: 'Consolas', monospace;
            font-size: 14px;
            background-color: #f4f4f4;
            border: 1px solid #ddd;
            border-radius: 5px;
            resize: vertical;
            margin-top: 10px;
        }
        .btn-show-answer {
            background-color: #2c3e50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-show-answer:hover {
            background-color: #34495e;
        }
    </style>
"@

$HTML_INJECTION = @"
        <hr style="margin: 40px 0; border: 0; border-top: 1px solid #eee;">
        
        <div id="practice-section">
            <h2>Practice Area</h2>
            <p>Use this space to write your code attempts or notes:</p>
            <textarea id="practice-area" class="practice-input" placeholder="// Write your code practice here..."></textarea>
        </div>

        <div id="answer-section-container" style="margin-top: 30px; margin-bottom: 50px;">
            <button onclick="toggleAnswer()" class="btn-show-answer">Show Possible Answer</button>
            <div id="answer-content" style="display:none; margin-top: 20px; background: #f9f9f9; padding: 20px; border-left: 4px solid #00e676;">
                <h3>Possible Solution</h3>
                <pre class="code-snippet">
// This is a placeholder for the solution.
// In a real scenario, the specific answer code would be here.
// Refer to the main Code Examples in the topic for guidance.
WebDriver driver = new ChromeDriver();
// Perform actions...
                </pre>
            </div>
        </div>

        <script>
            function toggleAnswer() {
                var answerDiv = document.getElementById('answer-content');
                var btn = document.querySelector('.btn-show-answer');
                if (answerDiv.style.display === 'none') {
                    answerDiv.style.display = 'block';
                    btn.textContent = 'Hide Answer';
                } else {
                    answerDiv.style.display = 'none';
                    btn.textContent = 'Show Possible Answer';
                }
            }
        </script>
"@

$files = Get-ChildItem -Path $WORKSHEET_DIR -Filter "*.html"

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw

    if ($content -match 'id="practice-section"') {
        Write-Host "Skipping $($file.Name) (already updated)"
        continue
    }

    # Inject CSS
    if ($content -match '</head>') {
        $content = $content -replace '</head>', ($CSS_INJECTION + "`n</head>")
    }

    # Inject HTML
    # Insert before the back button
    if ($content -match 'class="btn-back"') {
        # Split logic to insert before the line containing btn-back
        $lines = $content -split "`r`n"
        $newContent = @()
        $injected = $false
        
        foreach ($line in $lines) {
            if ($line -match 'class="btn-back"' -and -not $injected) {
                $newContent += $HTML_INJECTION
                $injected = $true
            }
            $newContent += $line
        }
        $content = $newContent -join "`r`n"
    } elseif ($content -match '</body>') {
        $content = $content -replace '</body>', ($HTML_INJECTION + "`n</body>")
    }

    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    Write-Host "Updated $($file.Name)"
}
