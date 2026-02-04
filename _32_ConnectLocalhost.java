package Selenium;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class _32_ConnectLocalhost {

    public static void main(String[] args) {

        WebDriver driver = new ChromeDriver();

        try {
            // Task 01: Open Local Port (ONLY works if server is running)
            driver.get("http://localhost:5502");
            Thread.sleep(2000);

            // Task 02: Open Local HTML file (UPDATE path correctly)
            driver.get("file:///C:/index.html");


            Thread.sleep(2000);

            System.out.println("✔ TASKS EXECUTED");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }
}
