using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebCsFriendBookIvan
{
    public partial class createMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ToUserID"] != null)
                {
                    int toUserID;
                    if (int.TryParse(Request.QueryString["ToUserID"], out toUserID))
                    {
                        lblToUserID.Text = "Recipient ID: " + toUserID.ToString();

                        txtToUserID.Text = toUserID.ToString();
                        txtToUserID.Visible = false;
                    }
                    else
                    {
                        lblToUserID.Text = "Recipient ID: Invalid";
                    }
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            int toUserID = int.Parse(txtToUserID.Text);
            string content = txtContent.Text;

            int fromUserID = Convert.ToInt32(Session["UserID"]);

            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\ivanj\\Desktop\\AAA\\teccart\\session-4\\at\\prjWebCsFriendBookIvan\\App_Data\\DBFriendBook.mdf;Integrated Security=True";

            using (SqlConnection myconn = new SqlConnection(connectionString))
            {
                try
                {
                    myconn.Open();
                    string query = "INSERT INTO Messages (FromUserID, ToUserID, Content, SendDate, [Read]) VALUES (@FromUserID, @ToUserID, @Content, @SendDate, @Read)";

                    using (SqlCommand cmd = new SqlCommand(query, myconn))
                    {
                        cmd.Parameters.AddWithValue("@FromUserID", fromUserID);
                        cmd.Parameters.AddWithValue("@ToUserID", toUserID);
                        cmd.Parameters.AddWithValue("@Content", content);
                        cmd.Parameters.AddWithValue("@SendDate", DateTime.Now);
                        cmd.Parameters.AddWithValue("@Read", 0);

                        cmd.ExecuteNonQuery();

                        txtContent.Text = "";

                        lblMessage.Text = "Message sent succesfully.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred while sending the message";
                }
            }
        }

    }
}