using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FirstWebProject.Utility
{
    public class DropDownListUtil
    {
        /// <summary>
        /// 绑定数据
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="dropDownList"></param>
        public static void BindData(string tableName, DropDownList dropDownList)
        {
            string sql = "select * from "+tableName+" where id>1";
            DataSet ds = DbHelperSQL.Query(sql);
            dropDownList.DataSource = ds.Tables[0];
            dropDownList.DataBind();
        }
    }
}