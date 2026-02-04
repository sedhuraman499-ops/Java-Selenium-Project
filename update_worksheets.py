import os
import glob

WORKSHEET_DIR = r"c:\Users\sedhu\Downloads\Java_Selinium\worksheets"

CSS_INJECTION = """
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
"""

HTML_INJECTION = """
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
"""

def update_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Check if already updated
    if 'id="practice-section"' in content:
        print(f"Skipping {os.path.basename(filepath)} (already updated)")
        return

    # Inject CSS before </head>
    if '</head>' in content:
        content = content.replace('</head>', CSS_INJECTION + '\n</head>')

    # Inject HTML before <a href="#" ... btn-back (the close button) of before </body>
    # Looking at template, the close button is: <a href="#" onclick="window.close();" class="btn-back">&larr; Close Worksheet</a>
    # Let's insert BEFORE the close button to keep it at the bottom
    
    if 'class="btn-back"' in content:
         # Find the line with btn-back
        lines = content.splitlines()
        new_lines = []
        injected = False
        for line in lines:
            if 'class="btn-back"' in line and not injected:
                new_lines.append(HTML_INJECTION)
                injected = True
            new_lines.append(line)
        content = '\n'.join(new_lines)
    elif '</body>' in content:
        content = content.replace('</body>', HTML_INJECTION + '\n</body>')
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Updated {os.path.basename(filepath)}")

def main():
    files = glob.glob(os.path.join(WORKSHEET_DIR, "*.html"))
    print(f"Found {len(files)} files.")
    for file in files:
        update_file(file)

if __name__ == "__main__":
    main()
