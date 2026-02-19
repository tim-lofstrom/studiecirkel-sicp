
public class Main {

    public static void main(String[] args) {
        int a = 5;
        int b = 7;
        var result = Main.add(a, b);
        System.out.println(String.format("Result of %s + %s = %s", a, b, result));

    }

    static int dec(int x) {
        return x - 1;
    }

    static int inc(int x) {
        return x + 1;
    }

    static int add(int a, int b) {

        if (a == 0) {
            return b;
        }

        return inc(add(dec(a), b));
    }

}
