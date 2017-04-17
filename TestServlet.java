import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class TestServlet extends HttpServlet {
	
	private Connection connection;
	private Statement stmt;
	private ResultSet results;
	private String connectionUrl;
	
	public void init() throws ServletException {
		connectionUrl = "jdbc:sqlserver://localhost:1434;" +
				"integratedSecurity=true;databaseName=Retailer;user=webuser;password=CSE3241Retailer";
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		try{
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//connection = DriverManager.getConnection(connectionUrl);
			//connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1434;databaseName=Retailer;user=webuser;password=CSE3241Retailer");
			connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1434;databaseName=Retailer;", "webuser2", "CSE3241Retailer");

			stmt = connection.createStatement();
			
			out.println("<html>");
			out.println("<body>");
			out.println("<h1>Results</h1>");
			
			results = stmt.executeQuery("SELECT * FROM EMPLOYEE");
			
			while(results.next()){
				int Emp_ID = results.getInt(0);
				String LastName = results.getString(1);
				String FirstName = results.getString(2);
				int EmpManager_ID = results.getInt(3);
				int Department_ID = results.getInt(4);
				int Fac_Id = results.getInt(5);
				
				out.println(Emp_ID + ", " + LastName + ", " + FirstName);
			}
			
			out.println("</body>");
			out.println("</html>");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void destroy(){
		
	}
}
