import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Assignment2 {
    static String LOCAL_HOST_URL = "jdbc:postgresql://localhost:5432/";

    // A connection to the database
    Connection connection;

    // Statement to run queries
    Statement sql;

    // Prepared Statement
    PreparedStatement ps;

    // Resultset for the query
    ResultSet rs;

    // CONSTRUCTOR
    Assignment2() {
    }

    // Using the input parameters, establish a connection to be used for this
    // session. Returns true if connection is sucessful
    public boolean connectDB(String URL, String username, String password) {
        try {
            Class.forName("org.postgresql.Driver");
            this.connection = DriverManager.getConnection(URL, username,
                    password);
        } catch (Exception e) {
            System.err.println(e);
            return false;
        }
        return true;
    }

    // Closes the connection. Returns true if closure was sucessful
    public boolean disconnectDB() {
        try {
            this.connection.close();
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        }
        return true;
    }

    public boolean insertCountry(int cid, String name, int height,
            int population) {

        return false;
    }

    public int getCountriesNextToOceanCount(int oid) {
        return -1;
    }

    public String getOceanInfo(int oid) {
        return "";
    }

    public boolean chgHDI(int cid, int year, float newHDI) {
        return false;
    }

    public boolean deleteNeighbour(int c1id, int c2id) {
        return false;
    }

    public String listCountryLanguages(int cid) {
        return "";
    }

    public boolean updateHeight(int cid, int decrH) {
        return false;
    }

    public boolean updateDB() {
        return false;
    }

    public static void main(String args[]) {
        if (args.length != 2) {
            System.out.println("Enter 2 arguments: (assuming no "
                    + "password is needed for accessing the database)");
            System.out.println("arg #1: DATABASE_NAME");
            System.out.println("arg #2: USER_NAME");
            return;
        }
        String db = args[0];
        String usr = args[1];
        Assignment2 a2 = new Assignment2();
        a2.connectDB(LOCAL_HOST_URL + db, usr, "");
        try {
            Statement stmt = a2.connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from country");
            while (rs.next()) {
                System.out.println(rs.getInt(1) + " (" + rs.getString(2) + ")");
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        a2.disconnectDB();
    }

}
