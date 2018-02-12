import java.util.ArrayList;

public class Torres {

    public static void main(String [] args){
        //here the code for translate in asm.
        hanoi(3,1,2,3);
    }

    public static void hanoi(int n, int origin, int aux ,int destination){
        if(n==1){
            move(n,origin,destination);
            return;
        }
        else {
            hanoi(n - 1, origin, destination, aux);
            move(n,origin,destination);
            hanoi(n - 1, aux, origin, destination);
        }
    }
    public static void move(int n,int origin, int destination){
        System.out.println("move disc "+n+" from " +origin+" to "+ destination);

        return;
    }
}
