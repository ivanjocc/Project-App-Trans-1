using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebCsFriendBookIvan
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    lblUsername.Text = "Welcome " + "<strong>" + Session["Username"].ToString() + "</strong>";
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string sex = ddlSex.SelectedValue;
            string ageCategory = ddlAgeCategory.SelectedValue;
            string ethnicGroup = ddlEthnicGroup.SelectedValue;
            string searchReason = ddlSearchReason.SelectedValue;

            using (SqlConnection myconn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\ivanj\\Desktop\\AAA\\teccart\\session-4\\at\\prjWebCsFriendBookIvan\\App_Data\\DBFriendBook.mdf;Integrated Security=True"))
            {
                myconn.Open();

                string sql = "SELECT UserID, Username, Email, Sex, BirthDate, EthnicGroup, SearchReason, CreationDate, LastModification FROM Users WHERE 1=1";

                if (!string.IsNullOrEmpty(sex))
                {
                    sql += " AND Sex = @Sex";
                }
                if (!string.IsNullOrEmpty(ethnicGroup))
                {
                    sql += " AND EthnicGroup = @EthnicGroup";
                }
                if (!string.IsNullOrEmpty(searchReason))
                {
                    sql += " AND SearchReason = @SearchReason";
                }
                if (!string.IsNullOrEmpty(ageCategory))
                {
                    if (ageCategory == "Mayor")
                    {
                        sql += " AND DATEDIFF(year, BirthDate, GETDATE()) >= 18";
                    }
                    else if (ageCategory == "Menor")
                    {
                        sql += " AND DATEDIFF(year, BirthDate, GETDATE()) < 18";
                    }
                }

                SqlCommand cmd = new SqlCommand(sql, myconn);

                if (!string.IsNullOrEmpty(sex))
                {
                    cmd.Parameters.AddWithValue("@Sex", sex);
                }
                if (!string.IsNullOrEmpty(ethnicGroup))
                {
                    cmd.Parameters.AddWithValue("@EthnicGroup", ethnicGroup);
                }
                if (!string.IsNullOrEmpty(searchReason))
                {
                    cmd.Parameters.AddWithValue("@SearchReason", searchReason);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvMembers.DataSource = dt;
                gvMembers.DataBind();
            }
        }
    }
}