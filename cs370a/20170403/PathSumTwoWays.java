/*
Given matrix of ints, find path with smallest sum
Only allowed to move right and down
*/

//for three way - add a loop somewhere and think about candies

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.lang.Math;

public class PathSumTwoWays {
    private int[][] values;

    public PathSumTwoWays(String filename) throws FileNotFoundException,
            IOException,
            NumberFormatException {
        BufferedReader reader = new BufferedReader(new FileReader(filename));
        List<String> valueList = new ArrayList<String>();
        String line;
        while ((line = reader.readLine()) != null) {
            valueList.add(line);
        }
        reader.close();
        values = new int[valueList.size()][];
        for (int row = 0; row < values.length; row++) {
            line = valueList.get(row);
            String[] parts = line.split(",");
            values[row] = new int[parts.length];
            for (int col = 0; col < parts.length; col++) {
                try {
                    values[row][col] = Integer.parseInt(parts[col]);
                } catch (NumberFormatException nfe) {
                    throw new NumberFormatException("Bad value " + parts[col]
                            + " on line " + (row + 1) + ".");
                }
            }
        }
    }
    public void printArr(){
        for(int r=0; r<values.length; r++){
            for(int c=0; c<values[r].length; c++){
                System.out.print(values[r][c]);
                System.out.print(" ");
            }
            System.out.println();
        }
        return;
    }
    public int MinPathSum(){
        int[][] dpTable = new int[values.length][values.length];
        dpTable[0][0] = values[0][0];
        for(int j=1; j<values.length; j++){
            dpTable[0][j] = dpTable[0][j-1] + values[0][j];
        }
        for(int i=1; i<values.length; i++){
            dpTable[i][0] = dpTable[i-1][0] + values[i][0];
        }
        for(int i=1; i<values.length; i++){
            for(int j=1; j<values.length; j++){
                dpTable[i][j] = Math.min(dpTable[i-1][j], dpTable[i][j-1]) + values[i][j];
            }
            System.out.println();
        }
        return dpTable[values.length][values.length];
    }

    public static void main(String[] args) {
        String filename = "matrix.txt";
        PathSumTwoWays pathSum = null;
        try {
            pathSum = new PathSumTwoWays(filename);
            pathSum.printArr();
            System.out.println(pathSum.MinPathSum());
        } catch (FileNotFoundException fnfe) {
            System.err.println("Error: File '" + filename + "' not found.");
            System.exit(1);
        } catch (IOException ioe) {
            System.err.println("Error: Cannot read '" + filename + "'.");
            System.exit(1);
        } catch (NumberFormatException nfe) {
            System.err.println("Error: " + nfe.getMessage());
            System.exit(1);
        }
        System.exit(0);
    }
}
