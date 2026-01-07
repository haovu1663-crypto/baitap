import java.util.Scanner;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
   System.out.println("_________tinh toán _______");
        Scanner sc = new Scanner(System.in);
        System.out.print("nhâp a : ");
        int a = sc.nextInt();
        System.out.print("nhập b : ");
        int b = sc.nextInt();
        System.out.print("nhâp c : ");
        int c = sc.nextInt();
        System.out.print("nhập d : ");
        int d = sc.nextInt();
        int tu = a*d + b*c;
        int mau = b*d;
        System.out.printf("tong =%d/%d",tu,mau);




    }
}