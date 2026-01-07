import java.util.Scanner;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.print("nhap so 1 ");
        int fistnumber = sc.nextInt();
        System.out.print("nhap so 2");
        int secondnumber = sc.nextInt();
        int tong =fistnumber+secondnumber;
        int hieu= fistnumber-secondnumber;
        int tich = fistnumber*secondnumber;
        int thuong = fistnumber/secondnumber;
        int du = fistnumber%secondnumber;
        System.out.printf("Tong = %d \n",tong);

        System.out.printf("hieu = %d \n",hieu);
        System.out.printf("tich = %d \n",tich);
        System.out.printf("Thuong = %d \n",thuong);
        System.out.printf("du = %d",du);

    }
}