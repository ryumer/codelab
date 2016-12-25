/*
You are in an infinite 2D grid where you can move in any of the 8 directions :

 (x,y) to 
    (x+1, y), 
    (x - 1, y), 
    (x, y+1), 
    (x, y-1), 
    (x-1, y-1), 
    (x+1,y+1), 
    (x-1,y+1), 
    (x+1,y-1) 
You are given a sequence of points and the order in which you need to cover the points. Give the minimum number of steps in which you can achieve it. You start from the first point.

Example :

Input : [(0, 0), (1, 1), (1, 2)]
Output : 2
It takes 1 step to move from (0, 0) to (1, 1). It takes one more step to move from (1, 1) to (1, 2).

This question is intentionally left slightly vague. Clarify the question by trying out a few cases in the “See Expected Output” section.
*/

public class Solution {
    // X and Y co-ordinates of the points in order.
    // Each point is represented by (X.get(i), Y.get(i))
    public int coverPoints(ArrayList<Integer> X, ArrayList<Integer> Y) {
        int c = 0;
        int lx = X.get(0);
        int ly = Y.get(0);
        for (int i=1; i<X.size(); i++) {
            int x = X.get(i);
            int y = Y.get(i);
            
            c += steps(x, y, lx, ly);
            lx = x;
            ly = y;
        }
        return c;
    }
    
    private int steps(int x, int y, int lx, int ly) {
        int dx = x-lx;
        int dy = y-ly;
        
        if (dx<0) dx=-1*dx;
        if (dy<0) dy=-1*dy;
        
        int diagonalSteps = 0;
        int steps = 0;
        
        if (dx > dy) {
            return dx;
        } else {
            return dy;
        } 
    }
}
