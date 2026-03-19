package lab3;

import java.util.function.BiFunction;
import java.util.function.DoubleUnaryOperator;
import java.util.function.Function;

public class Main {

    static double sum(DoubleUnaryOperator term, double a, DoubleUnaryOperator next, double b) {

        if (a > b) {
            return 0.0;
        }

        return term.applyAsDouble(a) + sum(term, next.applyAsDouble(a), next, b);
    }

    static double piSum(double a, double b) {

        return sum(x -> 1.0 / (x * (x + 2.0)),
                a,
                x -> x + 4.0,
                b);
    }

    public static void main(String[] args) {
        double result = 8.0 * piSum(1.0, 2000);
        System.out.println(result);

        BiFunction<Double, Double, Double> asd = (x, y) -> x * y;

    }
}