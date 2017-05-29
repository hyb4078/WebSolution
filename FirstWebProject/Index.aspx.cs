using FirstWebProject.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FirstWebProject
{
    public partial class Temp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            #region version 2
            
            string currentDate = DateTime.Now.ToShortDateString();
            //测试日期
            currentDate = "2017-5-25";
            StringBuilder sql = new StringBuilder();
            sql.Append(" select p.PID,p.Provider,p.PartNumber,p.[Count],p.Received,p.[Date],ec.Name+el.Name+edn.Name+ed.Name ExceptionRecord");
            sql.Append(" from dbo.P_Product p");
            sql.Append(" left join dbo.ExceptionRecord er on p.PID=er.PID");
            sql.Append(" left join dbo.ExceptionCount ec on er.[Count]=ec.Id");
            sql.Append(" left join dbo.ExceptionLabel el on er.Label = el.Id");
            sql.Append(" left join dbo.ExceptionDeliveryNote edn on er.DeliveryNote = edn.Id");
            sql.Append(" left join dbo.ExceptionDamage ed on er.Damage = ed.Id");
            sql.Append(" where p.Date=@currentDate");
            //sql.Append(" select rs.ID,rs.Supplier,rs.PartNumber,rs.Quantity,rs.IsReceived,rtq.Name + rtl.Name+ rtn.Name + rtd.Name Exception from  Recv_Schedule rs");
            //sql.Append(" left join Recv_Excp_Collect rec on rs.ID=rec.Sched_ID");
            //sql.Append(" left join Recv_Type_Quantity rtq on rtq.ID=rec.Quantity_ID");
            //sql.Append(" left join Recv_Type_Label rtl on rtl.ID = rec.Label_ID");
            //sql.Append(" left join Recv_Type_Note rtn on rtn.ID = rec.Note_ID");
            //sql.Append(" left join Recv_Type_Damage rtd on rtd.ID = rec.Damage_ID");
            //sql.Append(" where rs.RecDate=@CurrentDate");
            SqlParameter[] parameters = new SqlParameter[] { new SqlParameter("@CurrentDate", currentDate) };
            DataSet ds = DbHelperSQL.Query(sql.ToString(), parameters);
            this.RptRecv_Schedule.DataSource = ds.Tables[0];
            this.RptRecv_Schedule.DataBind();
            this.currentDate.Text = currentDate;
            
            #endregion

            #region version 1
            /*
            string currentDate = DateTime.Now.ToShortDateString();
            currentDate = "2017-5-25";
            StringBuilder sql = new StringBuilder();
            sql.Append(" select p.PID,p.Provider,p.PartNumber,p.[Count],p.Received,p.[Date],ec.Name ExceptionCount,el.Name label, edn.Name DeliveryNote,ed.Name Damage");
            sql.Append(" from dbo.P_Product p");
            sql.Append(" left join dbo.ExceptionRecord er on p.PID=er.PID");
            sql.Append(" left join dbo.ExceptionCount ec on er.[Count]=ec.Id");
            sql.Append(" left join dbo.ExceptionLabel el on er.Label = el.Id");
            sql.Append(" left join dbo.ExceptionDeliveryNote edn on er.DeliveryNote = edn.Id");
            sql.Append(" left join dbo.ExceptionDamage ed on er.Damage = ed.Id");
            sql.Append(" where p.Date=@currentDate");
            SqlParameter[] parameters = new SqlParameter[] { new SqlParameter("@CurrentDate", currentDate) };
            DataSet ds = DbHelperSQL.Query(sql.ToString(), parameters);
            DataTable dt = ds.Tables[0];

            //重新构建一个DataTable内存表
            DataTable newTable = new DataTable("plan");
            DataColumn pid = new DataColumn("pid", Type.GetType("System.Int32"));
            DataColumn provider = new DataColumn("provider", Type.GetType("System.String"));
            DataColumn partNumber = new DataColumn("partNumber", Type.GetType("System.String"));
            DataColumn count = new DataColumn("count", Type.GetType("System.String"));
            DataColumn received = new DataColumn("received", Type.GetType("System.String"));
            DataColumn exceptionRecord = new DataColumn("exceptionRecord", Type.GetType("System.String"));
            newTable.Columns.Add(pid);
            newTable.Columns.Add(provider);
            newTable.Columns.Add(partNumber);
            newTable.Columns.Add(count);
            newTable.Columns.Add(received);
            newTable.Columns.Add(exceptionRecord);
            foreach (DataRow dr in dt.Rows)
            {
                DataRow newRow = newTable.NewRow();
                newRow["pid"] = dr["pid"];
                newRow["provider"] = dr["provider"];
                newRow["partNumber"] = dr["partNumber"];
                newRow["count"] = dr["count"];
                newRow["received"] = dr["received"];
                string exceptionCount = dr["ExceptionCount"].ToString();
                string label = dr["Label"].ToString();
                string deliveryNote = dr["DeliveryNote"].ToString();
                string damage = dr["Damage"].ToString();
                string tmp = "";
                if (exceptionCount == "正常" && label == "正常" && deliveryNote == "正常" && damage == "正常")
                {
                    tmp = "";
                }
                if (exceptionCount != "正常" && exceptionCount != "") { tmp = exceptionCount; }
                if (label != "正常" && "" != label) { tmp += label; }
                if (deliveryNote != "正常" && "" != label) { tmp += deliveryNote; }
                if (damage != "正常" && "" != damage) { tmp += damage; }
                newRow["exceptionRecord"] = tmp;
                newTable.Rows.Add(newRow);
            }
            this.RptRecv_Schedule.DataSource = newTable;
            this.RptRecv_Schedule.DataBind();
            this.currentDate.Text = currentDate;
            */
            #endregion
        }

    }
}