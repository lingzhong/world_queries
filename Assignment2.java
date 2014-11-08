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
        try {
            this.sql = this.connection.createStatement();
            this.sql.executeUpdate("INSERT INTO country VALUES(" + cid + ",\'"
                    + name + "\'," + height + "," + population + ")");
            this.sql.close();
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        }
        return true;
    }

    public int getCountriesNextToOceanCount(int oid) {
        int count;
        try {
            this.sql = this.connection.createStatement();
            this.rs = this.sql.executeQuery("SELECT COUNT(*) FROM "
                    + "oceanAccess WHERE oid = " + oid);
            this.rs.next();
            count = this.rs.getInt(1);
            this.rs.close();
            this.sql.close();
        } catch (SQLException e) {
            System.err.println(e);
            return -1;
        }
        return count;
    }

    public String getOceanInfo(int oid) {
        String res = "";
        try {
            this.sql = this.connection.createStatement();
            this.rs = this.sql.executeQuery("SELECT * FROM "
                    + "ocean WHERE oid = " + oid);
            while (this.rs.next()) {
                res = this.rs.getInt(1) + ":" + this.rs.getString(2) + ":"
                        + this.rs.getInt(3);
            }
            this.rs.close();
            this.sql.close();
        } catch (SQLException e) {
            System.err.println(e);
            return "";
        }
        return res;
    }

    public boolean chgHDI(int cid, int year, float newHDI) {
        try {
            this.sql = this.connection.createStatement();
            this.sql.executeUpdate("UPDATE hdi SET hdi_score = " + newHDI
                    + " WHERE cid = " + cid + " AND year = " + year);
            this.sql.close();
        } catch (SQLException e) {
            System.err.println(e);
            return false;
        }
        return true;
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
            a2.connection.createStatement().executeUpdate(
                    "DELETE FROM country WHERE cid = 5");
            a2.insertCountry(5, "Korea", 10, 900);
            a2.sql = a2.connection.createStatement();
            a2.rs = a2.sql.executeQuery("select * from country");
            while (a2.rs.next()) {
                System.out.println(a2.rs.getInt(1) + " (" + a2.rs.getString(2)
                        + ")");
            }
            a2.rs.close();
            a2.sql.close();
            System.out.println("Number of country near ocean \'2\' is "
                    + a2.getCountriesNextToOceanCount(2));
            System.out.println(a2.getOceanInfo(7));
            System.out.println(a2.getOceanInfo(1));
            System.out.println(a2.chgHDI(1, 2009, 1));
        } catch (Exception e) {
            System.err.println(e);
        }
        a2.disconnectDB();
    }

}
