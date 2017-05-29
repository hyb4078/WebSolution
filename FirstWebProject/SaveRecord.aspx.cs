using FirstWebProject.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FirstWebProject
{
    public partial class Three : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int pid = int.Parse(Request.QueryString["pid"]);
                StringBuilder sql = new StringBuilder();
                sql.Append(" select p.PID,p.Provider,p.PartNumber,p.Count,p.Received,er.[Count] Quantity_ID,er.Label Label_ID,er.DeliveryNote Note_ID,er.Damage Damage_ID from P_Product p");
                sql.Append(" left join ExceptionRecord er on p.PID=er.PID where p.PID = @PID");
                SqlParameter[] parameters = new SqlParameter[] { new SqlParameter("@PID", pid) };
                DataSet ds = DbHelperSQL.Query(sql.ToString(), parameters);
                lblID.Text = ds.Tables[0].Rows[0]["PID"].ToString();
                lblSupplier.Text = ds.Tables[0].Rows[0]["Provider"].ToString();
                lblPartNumber.Text = ds.Tables[0].Rows[0]["PartNumber"].ToString();
                lblQuantity.Text = ds.Tables[0].Rows[0]["Count"].ToString();
                string flag = ds.Tables[0].Rows[0]["Received"].ToString();
                switch (flag)
                {
                    case "1":
                        radioYes.Checked = true;
                        break;
                    case "0":
                        radioNo.Checked = true;
                        break;
                    default: break;
                }
                DropDownListUtil.BindData("ExceptionCount",this.ddlQuantity);
                DropDownListUtil.BindData("ExceptionLabel",this.ddlLabel);
                DropDownListUtil.BindData("ExceptionDeliveryNote",this.ddlNote);
                DropDownListUtil.BindData("ExceptionDamage",this.ddlDamage);

                string quantity_ID = ds.Tables[0].Rows[0]["Quantity_ID"].ToString();
                string label_ID = ds.Tables[0].Rows[0]["Label_ID"].ToString();
                string note_ID = ds.Tables[0].Rows[0]["Note_ID"].ToString();
                string damage_ID = ds.Tables[0].Rows[0]["Damage_ID"].ToString();
                this.ddlQuantity.SelectedIndex = this.ddlQuantity.Items.IndexOf(this.ddlQuantity.Items.FindByValue(quantity_ID));
                this.ddlLabel.SelectedIndex = this.ddlLabel.Items.IndexOf(this.ddlLabel.Items.FindByValue(label_ID));
                this.ddlNote.SelectedIndex = this.ddlNote.Items.IndexOf(this.ddlNote.Items.FindByValue(note_ID));
                this.ddlDamage.SelectedIndex = this.ddlDamage.Items.IndexOf(this.ddlDamage.Items.FindByValue(damage_ID));

            }
            else
            {
                Response.Write("<script type='text/javascript'>");
                //Response.Write("top.document.location.href='Temp.aspx'");
                Response.Write("parent.location.reload();window.stop();");
                Response.Write("</script>");
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string pid = this.lblID.Text;
            string received = Request["isReceived"];
            string cmdText = "update P_Product set Received=@Received where PID=@PID;";
            SqlParameter[] pms = new SqlParameter[] { new SqlParameter("@Received", received), new SqlParameter("@PID", pid) };
            DbHelperSQL.ExecuteSql(cmdText, pms);
            string count = Request.Form["ddlQuantity"];
            string label = Request.Form["ddlLabel"];
            string deliveryNote = Request.Form["ddlNote"];
            string damage = Request.Form["ddlDamage"];
            StringBuilder sql = new StringBuilder();
            sql.Append(" if exists(select pid from ExceptionRecord where pid =@PID)");
            sql.Append(" update ExceptionRecord set [Count]=@Count,Label=@Label,DeliveryNote=@DeliveryNote,Damage=@Damage where PID=@PID");
            sql.Append(" else");
            sql.Append(" insert into ExceptionRecord(pid,[Count],[Label],[DeliveryNote],Damage) values(@PID,@Count,@Label,@DeliveryNote,@Damage)");
            SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("@PID",pid),
                new SqlParameter("@Count",count),
                new SqlParameter("@Label",label),
                new SqlParameter("@DeliveryNote",deliveryNote),
                new SqlParameter("@Damage",damage)
            };
            int i = DbHelperSQL.ExecuteSql(sql.ToString(), parameter);
            if (i > 0)
            {
                Response.Write("<script type='text/javascript'>");
                Response.Write("parent.location.replace('Index.aspx');window.stop();");
                Response.Write("</script>");
            }
        }
    }
}