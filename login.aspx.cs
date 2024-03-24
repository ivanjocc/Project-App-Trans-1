using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebCsFriendBookIvan
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\ivanj\\Desktop\\AAA\\teccart\\session-4\\at\\prjWebCsFriendBookIvan\\App_Data\\DBFriendBook.mdf;Integrated Security=True";

            using (SqlConnection myconn = new SqlConnection(connectionString))
            {
                try
                {
                    myconn.Open();
                    string query = "SELECT UserID, Username FROM Users WHERE Username = @username AND Password = @password";
                    SqlCommand cmd = new SqlCommand(query, myconn);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["UserID"] = reader.GetInt32(0);
                            Session["Username"] = reader.GetString(1);
                            Response.Redirect("dashboard.aspx");
                        }
                        else
                        {
                            lblError.Text = "The username or password is not correct. Please try again.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occurred during the login process. Please try again later.";
                }
            }
        }

    }
}
