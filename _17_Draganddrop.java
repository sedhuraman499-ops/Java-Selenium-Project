package Selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;

public class _17_Draganddrop {

    public static void main(String[] args) throws InterruptedException {

        WebDriver driver = new ChromeDriver();
        driver.manage().window().maximize();

        driver.get("http://127.0.0.1:5502/Java_Selinium/worksheets/ws_drag_drop.html");

        Actions actions = new Actions(driver);
        Thread.sleep(2000);

        // ===============================
        // Task 01: Drag and Drop
        // ===============================
        WebElement taskA = driver.findElement(By.id("task1"));
        WebElement doneColumn = driver.findElement(By.id("col-done"));

        actions.dragAndDrop(taskA, doneColumn).perform();
        System.out.println("✔ Task 01: Task A moved to Done");
        Thread.sleep(3000);

        // ===============================
        // Task 02: Click, Hold, Move, Release
        // ===============================
        WebElement taskB = driver.findElement(By.xpath("//div[text()='Task B']"));

        actions.clickAndHold(taskB)
               .moveToElement(doneColumn)
               .release()
               .perform();

        System.out.println("✔ Task 02: Task B moved to Done");
        Thread.sleep(3000);

        driver.quit();
    }
}
