import os
import re

# Template wrapper for content pages
template = '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
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
            <!-- Topics will be populated by script -->
        </ul>
    </nav>

    <!-- CONTENT AREA -->
    <main id="main-content">
        <div id="content-display">
            {content}
        </div>
    </main>

    <script>
        // Sidebar topics
        const topics = [
            { id: '_01_demo_page_', title: '01. Demo Page', icon: 'fa-play-circle' },
            { id: '_02_java', title: '02. Java Prerequisites', icon: 'fa-coffee' },
            { id: '_03_intro___', title: '03. Introduction', icon: 'fa-info-circle' },
            { id: '_04_web_driver_commands___', title: '04. WebDriver Commands', icon: 'fa-terminal' },
            { id: '_05_auto_webdriver_manager___', title: '05. WebDriver Setup', icon: 'fa-magic' },
            { id: '_06_chrome_options___', title: '06. Chrome Options', icon: 'fa-sliders-h' },
            { id: '_07_page_load_strategy___', title: '07. Page Load', icon: 'fa-hourglass-start' },
            { id: '_08_locators___', title: '08. Locators', icon: 'fa-crosshairs' },
            { id: '_10_navigation___', title: '10. Navigation', icon: 'fa-compass' },
            { id: '_11_basic_html_controls___', title: '11. Basic Controls', icon: 'fa-edit' },
            { id: '_12_advanced_html_controls___', title: '12. Advanced Controls', icon: 'fa-layer-group' },
            { id: '_13_dropdown___', title: '13. Dropdowns', icon: 'fa-list' },
            { id: '_14_waits_and_synchronization___', title: '14. Waits & Sync', icon: 'fa-clock' },
            { id: '_15_iframe_handling___', title: '15. Iframes', icon: 'fa-cube' },
            { id: '_16_alerts_and_popups___', title: '16. Alerts', icon: 'fa-exclamation-triangle' },
            { id: '_17_drag_drop___', title: '17. Drag & Drop', icon: 'fa-mouse-pointer' },
            { id: '_18_keyboard_actions___', title: '18. Keyboard', icon: 'fa-keyboard' },
            { id: '_19_mouse_actions___', title: '19. Mouse', icon: 'fa-mouse' },
            { id: '_20_scrolling_page___', title: '20. Scrolling', icon: 'fa-scroll' },
            { id: '_21_multi_select___', title: '21. Multi-Select', icon: 'fa-check-double' },
            { id: '_22_find_all_links___', title: '22. Find All Links', icon: 'fa-link' },
            { id: '_23_window_handling___', title: '23. Windows', icon: 'fa-window-restore' },
            { id: '_24_file_upload_download___', title: '24. File Up/Down', icon: 'fa-upload' },
            { id: '_25_screenshots___', title: '25. Screenshots', icon: 'fa-camera' },
            { id: '_26_common_selenium_exceptions___', title: '26. Exceptions', icon: 'fa-bug' },
            { id: '_27_page_object_model___', title: '27. POM Pattern', icon: 'fa-sitemap' },
            { id: '_28_testng___', title: '28. TestNG', icon: 'fa-vial' },
            { id: '_29_maven_and_project_structure___', title: '29. Maven', icon: 'fa-box' },
            { id: '_30_reports___', title: '30. Reports', icon: 'fa-chart-line' },
            { id: '_31_extra___', title: '31. Resources', icon: 'fa-star' },
            { id: '_32_connect_with_local_host', title: '32. Local Testing', icon: 'fa-server' }
        ];

        function populateSidebar() {{
            const topicList = document.getElementById('topic-list');
            
            const sections = [
                {{ label: '📌 Getting Started', topics: [0, 1, 2] }},
                {{ label: '⚙️ Setup & Commands', topics: [3, 4, 5, 6] }},
                {{ label: '🔍 Locators & Selection', topics: [7, 8] }},
                {{ label: '📝 HTML Controls', topics: [9, 10, 11] }},
                {{ label: '⚡ Advanced Interactions', topics: [12, 13, 14, 15, 16, 17, 18, 19, 20] }},
                {{ label: '🛠️ Utilities & Tools', topics: [21, 22, 23, 24, 25] }},
                {{ label: '🧪 Framework & Design', topics: [26, 27, 28, 29] }},
                {{ label: '🏁 Resources', topics: [30, 31] }}
            ];

            sections.forEach(section => {{
                const sectionDiv = document.createElement('div');
                sectionDiv.className = 'sidebar-section';
                
                const label = document.createElement('div');
                label.className = 'sidebar-section-label';
                label.textContent = section.label;
                sectionDiv.appendChild(label);
                
                const ul = document.createElement('ul');
                section.topics.forEach(index => {{
                    const topic = topics[index];
                    const li = document.createElement('li');
                    const a = document.createElement('a');
                    a.href = `../${{topic.id}}.html`;
                    a.className = 'topic-link' + (window.location.pathname.includes(topic.id) ? ' active' : '');
                    a.innerHTML = `<i class="fas ${{topic.icon}}"></i> ${{topic.title}}`;
                    li.appendChild(a);
                    ul.appendChild(li);
                }});
                sectionDiv.appendChild(ul);
                topicList.appendChild(sectionDiv);
            }});
        }}

        function goHome() {{
            window.location.href = '../index.html';
        }}

        // Initialize sidebar
        document.addEventListener('DOMContentLoaded', populateSidebar);
    </script>
</body>
</html>'''

# Content directory
content_dir = 'content'

# List of files to convert (exclude template and already converted files)
files_to_convert = [
    '_01_demo_page_.html',
    '_02_java.html',
    '_03_intro___.html',
    '_04_web_driver_commands___.html',
    '_05_auto_webdriver_manager___.html',
    '_06_chrome_options___.html',
    '_07_page_load_strategy___.html',
    '_08_locators___.html',
    '_10_navigation___.html',
    '_11_basic_html_controls___.html',
    '_12_advanced_html_controls___.html',
    '_13_dropdown___.html',
    '_14_waits_and_synchronization___.html',
    '_15_iframe_handling___.html',
    '_16_alerts_and_popups___.html',
    '_17_drag_drop___.html',
    '_18_keyboard_actions___.html',
    '_19_mouse_actions___.html',
    '_20_scrolling_page___.html',
    '_21_multi_select___.html',
    '_22_find_all_links___.html',
    '_23_window_handling___.html',
    '_24_file_upload_download___.html',
    '_25_screenshots___.html',
    '_26_common_selenium_exceptions___.html',
    '_27_page_object_model___.html',
    '_28_testng___.html',
    '_29_maven_and_project_structure___.html',
    '_30_reports___.html',
    '_31_extra___.html',
    '_32_connect_with_local_host.html'
]

def get_title_from_filename(filename):
    """Extract title from filename"""
    name = filename.replace('.html', '').replace('_', ' ')
    return f"Content: {name}"

def convert_file(filename):
    """Convert a single file"""
    filepath = os.path.join(content_dir, filename)
    
    if not os.path.exists(filepath):
        print(f"File not found: {filepath}")
        return False
    
    try:
        # Read current content
        with open(filepath, 'r', encoding='utf-8') as f:
            current_content = f.read()
        
        # Skip if already has DOCTYPE (already converted)
        if current_content.strip().startswith('<!DOCTYPE'):
            print(f"Skipping {filename} (already converted)")
            return True
        
        # Get title
        title = get_title_from_filename(filename)
        
        # Create new content
        new_content = template.format(
            title=title,
            content=current_content
        )
        
        # Write back
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        print(f"✓ Converted: {filename}")
        return True
    
    except Exception as e:
        print(f"✗ Error converting {filename}: {str(e)}")
        return False

# Main execution
if __name__ == "__main__":
    print("Starting content page conversion...")
    print(f"Converting {len(files_to_convert)} files...\n")
    
    success_count = 0
    for filename in files_to_convert:
        if convert_file(filename):
            success_count += 1
    
    print(f"\n✓ Successfully converted {success_count}/{len(files_to_convert)} files")
