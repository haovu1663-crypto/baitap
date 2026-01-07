import java.util.Scanner;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //TIP Press <shortcut actionId="ShowIntentionActions"/> with your caret at the highlighted text
        // to see how IntelliJ IDEA suggests fixing it.
        Scanner sc = new Scanner(System.in);
        System.out.print("nhap chieu cao : ");
        float chieucao = sc.nextFloat();
        System.out.print("nhap can nang ");
        float canNang = sc.nextFloat();
        float BMI = canNang /(chieucao*chieucao);
        System.out.printf("BMI = %.2f", BMI);
    }
}