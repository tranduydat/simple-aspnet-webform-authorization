using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace DemoAuthorization.Models
{
    public abstract class BaseDataAccess
    {
        public SqlConnection GetConnection()
        {
            string conStr = ConfigurationManager.ConnectionStrings["DemoAuthorizationDbContext"].ToString();
            return new SqlConnection(conStr);
        }

        public DataTable GetDataBySql(string sql)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds.Tables[0];
        }

        public DataTable GetDataBySqlWithParameters(string sql, params SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            command.Parameters.AddRange(parameters);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds.Tables[0];
        }

        public DataTable GetDataByStoredProcedure(string SpName, params SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(SpName, GetConnection());
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddRange(parameters);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds.Tables[0];
        }
        public int ExecuteSqlWithParameters(string sql, SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            command.Parameters.AddRange(parameters);
            command.Connection.Open();
            int count = command.ExecuteNonQuery();
            command.Connection.Close();
            return count;
        }

        //public List<Object> GetObjectsByStoredProcedure(string spName, params SqlParameter[] parameters)
        //{
        //    DataTable dataTable = GetDataByStoredProcedure(spName, parameters);
        //    if (dataTable.Rows.Count <= 0)
        //    {
        //        return null;
        //    }
        //    else
        //    {
        //        List<Object> listOfObjects = new List<object>();
        //        foreach (DataRow row in dataTable.Rows)
        //        {
        //            listOfObjects.Add(row);
        //        }
        //    }
        //}
    }
}