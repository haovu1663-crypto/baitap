import java.util.Scanner;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //TIP Press <shortcut actionId="ShowIntentionActions"/> with your caret at the highlighted text
        // to see how IntelliJ IDEA suggests fixing it.
        Scanner sc = new Scanner(System.in);
        System.out.print("nhập chiều dài height = ");
        float height = sc.nextFloat();
        System.out.print("nhâp chiều rông  width = ");
        float width = sc.nextFloat();
        float area  = height * width;
        float perimeter = 2 * (height + width);
        System.out.printf("diện tích = %.2f và chu vu = %.2f",area, perimeter);
    }
}