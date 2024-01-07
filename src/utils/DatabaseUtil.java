package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
  private static DatabaseUtil instance;
  private Connection connection;

  public static synchronized DatabaseUtil getInstance() {
    if (instance == null) {
      instance = new DatabaseUtil();
    }
    return instance;
  }

  public Connection getConnection() {
    if (connection == null) {
      try {
        Class.forName("org.postgresql.Driver");

        String url = "jdbc:postgresql://chapa.dittyaa.my.id:5432/laperah_restaurant";
        String username = "kuitkatnekat";
        String password = "kuitkatnekat";

        connection = DriverManager.getConnection(url, username, password);
      } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
      }
    }
    return connection;
  }

  public void closeConnection() {
    if (connection != null) {
      try {
        connection.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
}
