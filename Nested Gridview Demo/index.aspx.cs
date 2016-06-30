using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nested_Gridview_Demo
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection("Data Source=(LocalDB)\\v11.0;AttachDbFilename='c:\\users\\aarthna\\documents\\visual studio 2013\\Projects\\Nested Gridview Demo\\Nested Gridview Demo\\App_Data\\Database1.mdf';Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridView();
            }

           
        }
        //This method is used to bind the gridview
        protected void BindGridView()
        {
           
            try
            {
                sqlConnection.Open();
                SqlCommand sqlCommand = new SqlCommand("Select CountryID,CountryName from Country",sqlConnection);
                SqlDataAdapter dataAdapter=new SqlDataAdapter(sqlCommand);
                DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);
                sqlConnection.Close();
                GridView_Parent.DataSource = dataSet;
                GridView_Parent.DataBind();
            }
            catch(SqlException sqlException)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Exception", "alert("+sqlException+")", true);
            }

        }

        protected void GridView_Parent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow)
            {
                try
                {
                    sqlConnection.Open();
                    GridView gridView = (GridView)e.Row.FindControl("GridView_Child");
                    int CountryId = Convert.ToInt32(e.Row.Cells[1].Text);
                    SqlCommand sqlCommand = new SqlCommand("select * from states where CountryID=" + CountryId, sqlConnection);
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);
                    sqlConnection.Close();
                    gridView.DataSource = dataSet;
                    gridView.DataBind();
                }
                catch(SqlException sqlException)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Exception", "alert(" + sqlException + ")", true);
                }
            }
        }
    }
}