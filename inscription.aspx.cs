using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjWebCsFriendBookIvan
{
    public partial class inscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreateGenders();
                CreateEthnicGroups();
                CreateSearchReasons();
            }
        }

        private void CreateGenders()
        {
            ListItem item = new ListItem();

            item.Text = "Select...";
            item.Value = "";

            ddlSex.Items.Add(item);

            ddlSex.Items.Add(new ListItem("Male", "M"));
            ddlSex.Items.Add(new ListItem("Woman", "W"));
        }

        private void CreateEthnicGroups()
        {
            ListItem item = new ListItem();

            item.Text = "Select...";
            item.Value = "";

            ddlEthnicGroup.Items.Add(item);

            ddlEthnicGroup.Items.Add(new ListItem("African American", "african"));
            ddlEthnicGroup.Items.Add(new ListItem("Asian", "asian"));
            ddlEthnicGroup.Items.Add(new ListItem("Hispanic or Latino", "latino"));
            ddlEthnicGroup.Items.Add(new ListItem("Native American", "american"));
            ddlEthnicGroup.Items.Add(new ListItem("Other", "other"));

        }

        private void CreateSearchReasons()
        {
            ListItem item = new ListItem();

            item.Text = "Select...";
            item.Value = "";

            ddlSearchReason.Items.Add(item);

            ddlSearchReason.Items.Add(new ListItem("Love", "love"));
            ddlSearchReason.Items.Add(new ListItem("Friendship", "friendship"));
            ddlSearchReason.Items.Add(new ListItem("Other Interests", "other"));
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection myconn = null;
            try
            {
                //Connexion DB
                myconn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\ivanj\\Desktop\\AAA\\teccart\\session-4\\at\\prjWebCsFriendBookIvan\\App_Data\\DBFriendBook.mdf;Integrated Security=True");

                //Open connexion
                myconn.Open();

                //Sql Query
                string sql = "INSERT INTO Users (Username, Password, Email, Sex, BirthDate, EthnicGroup, SearchReason, CreationDate, LastModification) VALUES ";
                sql += "(@Username, @Password, @Email, @Sex, @BirthDate, @EthnicGroup, @SearchReason, @CreationDate, @LastModification)";

                //Create command
                SqlCommand mycmd = new SqlCommand(sql, myconn);

                //Create parameters
                mycmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                mycmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                mycmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                mycmd.Parameters.AddWithValue("@Sex", ddlSex.SelectedValue);
                mycmd.Parameters.AddWithValue("@BirthDate", DateTime.Parse(txtBirthDate.Text));
                mycmd.Parameters.AddWithValue("@EthnicGroup", ddlEthnicGroup.Text);
                mycmd.Parameters.AddWithValue("@SearchReason", ddlSearchReason.Text);
                mycmd.Parameters.AddWithValue("@CreationDate", DateTime.Now);
                mycmd.Parameters.AddWithValue("@LastModification", DateTime.Now);

                //Execute Sql Query
                mycmd.ExecuteNonQuery();

                //Close connexion
                myconn.Close();

                Response.Write("todo bien");

                ClearFormFields();

                Response.Redirect("login.aspx");

            }
            catch (Exception ex)
            {
                lblError.Text = "Username or email already used";
            } 
            finally
            {
                if (myconn != null)
                {
                    myconn.Close();
                }
            }
        }

        protected void ClearFormFields()
        {
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtEmail.Text = string.Empty;
            ddlSex.ClearSelection();
            txtBirthDate.Text = string.Empty;
            ddlEthnicGroup.ClearSelection();
            ddlSearchReason.ClearSelection();
        }

    }
}