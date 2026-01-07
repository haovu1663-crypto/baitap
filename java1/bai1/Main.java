import java.util.Scanner;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //TIP Press <shortcut actionId="ShowIntentionActions"/> with your caret at the highlighted text
        // to see how IntelliJ IDEA suggests fixing it.

        System.out.println("------------ tinh diện hinh cho ------------");
        Scanner sc = new Scanner(System.in);
        System.out.print("nhập ban kinh hinh tron  :");
        double r = sc.nextDouble();
        double dientich = Math.PI*r*r;
        System.out.printf("dien tich hinh tron : %.5f",dientich);





    }
}