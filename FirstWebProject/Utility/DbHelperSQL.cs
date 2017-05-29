using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FirstWebProject.Utility
{
    public class DbHelperSQL
    {
        //public static string connectionString = PubConstant.ConnectionString;
        public static string connectionString = ConfigurationManager.AppSettings["connectionString"];

        public DbHelperSQL() { }

        #region 执行不带参简单SQL语句

        /// <summary>
        /// 执行SQL语句，返回影响的记录
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static int ExecuteSql(string sql)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    int rows = cmd.ExecuteNonQuery(); //返回受影响的记录行数
                    return rows;
                }
            }
        }

        /// <summary>
        /// 查询数据,返回数据集
        /// </summary>
        /// <param name="sql">执行查询的sql语句</param>
        /// <returns>数据集DataSet</returns>
        public static DataSet Query(string sql)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(sql, connection))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        adapter.Fill(ds, "ds");
                        /*
                         *其执行的操作流程：
                         *如果connection没有Open(),则自动调用Open()，与数据库建立连接
                         *在DataSet对象中创建一个DataTable对象，其名为ds
                         *从数据库取得数据，填充到DataSet对象中名为ds的DataTable中
                         *自动关闭connection，断开与数据库的连接
                         *dg.DataSource = ds.Tables[0] / ds.Tables["ds"] / ds.Tables["ds"].DefaultView / ds
                         */
                    }
                    catch (SqlException e) { throw new Exception(e.Message); }
                    return ds;
                }
            }
        }

        /// <summary>
        /// 同时查询多张表，填充到同一个DataSet中
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="tableNames"></param>
        /// <returns></returns>
        public static DataSet QueryTables(string sql, params string[] tableNames)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(sql, connection))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        //DataSet中Tables的Table默认名改成一定名
                        for(int i = 0 ; i<tableNames.Length;i++){
                            string suffix = i==0 ? "" : i.ToString(); //后缀
                            adapter.TableMappings.Add("Table"+suffix,tableNames[i]);
                        }
                        adapter.Fill(ds);
                    }
                    catch (SqlException e) { throw new Exception(e.Message); }
                    return ds ;
                }
            }
        }
        #endregion

        #region 执行带参数的SQL语句

        /// <summary>
        /// 执行SQL(Create,Delete,Update)语句,返回影响记录
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static int ExecuteSql(string sql, params SqlParameter[] parameters)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, sql, parameters);
                        int rows = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();  //清空所有参数
                        return rows;
                    }
                    catch (SqlException e) { throw e; }
                }
            }
        }

        /// <summary>
        /// 执行带参数[条件]的查询语句，返回DataSet
        /// </summary>
        /// <param name="sql">查询的sql语句</param>
        /// <param name="parameters">不定长度的参数数组</param>
        /// <returns>DataSet</returns>
        public static DataSet Query(string sql, params SqlParameter[] parameters)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, connection, null, sql, parameters);
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        adapter.Fill(ds, "ds");
                        cmd.Parameters.Clear();  //清空SqlCommand中参数
                    }
                    catch (SqlException e) { throw new Exception(e.Message); }
                    return ds;
                }
            }
        }

        #endregion

        /// <summary>
        /// Command对象参数预处理
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="connection"></param>
        /// <param name="transaction"></param>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        private static void PrepareCommand(SqlCommand cmd, SqlConnection connection, SqlTransaction transaction, string sql, params SqlParameter[] parameters)
        {
            if (connection.State != ConnectionState.Open) { connection.Open(); }
            cmd.Connection = connection;
            cmd.CommandText = sql;
            if (transaction != null) { cmd.Transaction = transaction; }
            cmd.CommandType = CommandType.Text;  //CommandType ??
            if (parameters != null)
            {
                foreach (SqlParameter parameter in parameters)
                {
                    //这个判断什么意思
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                        (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parameter);
                }
            }
        }

        #region GetSingle

        /// <summary>
        /// 执行插入语句，同时返回插入后查询最新的id(cmd.ExecuteScalar()的用法)。
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static object GetSingle(string sql, params SqlParameter[] parameters)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, sql, parameters);
                        object obj = cmd.ExecuteScalar();
                        cmd.Parameters.Clear();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (SqlException e) { throw e; }
                }
            }
        }

        #endregion
    }
}