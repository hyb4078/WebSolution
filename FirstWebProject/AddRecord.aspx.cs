using FirstWebProject.Utility;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FirstWebProject
{
    public partial class Four : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListUtil.BindData("ExceptionCount", this.ddlQuantity);
            DropDownListUtil.BindData("ExceptionLabel", this.ddlLabel);
            DropDownListUtil.BindData("ExceptionDeliveryNote", this.ddlNote);
            DropDownListUtil.BindData("ExceptionDamage", this.ddlDamage);
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            string supplier = Request.Form["supplier"];
            string partNumber = Request.Form["partNumber"];
            string quantity = Request.Form["quantity"];
            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");//ident_current('table1')
            currentDate = "2017-5-25";
            string isReceived = Request.Form["isReceived"];
            string sql = "insert into [P_Product](Provider,PartNumber,Count,Date,Received,Flag) values(@Provider,@PartNumber,@Count,@Date,@Received,@Flag);select ident_current('P_Product')";
            SqlParameter[] parameters = new SqlParameter[]{
                new SqlParameter("@Provider",supplier),new SqlParameter("@PartNumber",partNumber),new SqlParameter("@Count",quantity),
                new SqlParameter("@Date",currentDate),new SqlParameter("@Received",isReceived),new SqlParameter("@Flag","1")
            };
            int pid = Convert.ToInt32(DbHelperSQL.GetSingle(sql, parameters));
            string quantity_ID = Request.Form["ddlQuantity"];
            string label_ID = Request.Form["ddlLabel"];
            string note_ID = Request.Form["ddlNote"];
            string damage_ID = Request.Form["ddlDamage"];
            sql = "insert into [ExceptionRecord] values(@PID,@Count,@Label,@DeliveryNote,@Damage)";
            SqlParameter[] pms = new SqlParameter[]{
                new SqlParameter("@PID",pid),new SqlParameter("@Count",quantity_ID),
                new SqlParameter("@Label",label_ID),new SqlParameter("@DeliveryNote",note_ID),
                new SqlParameter("@Damage",damage_ID)
            };
            int i = DbHelperSQL.ExecuteSql(sql, pms);
            if (i > 0)
            {
                Response.Write("<script type='text/javascript'>");
                Response.Write("parent.location.replace('Index.aspx');");
                Response.Write("</script>");
            }
        }
    }
}