using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;

namespace DemoAuthorization.Models
{
    public class PostModel : BaseDataAccess
    {
        public int PostID { get; set; }
        public string PostName { get; set; }
        public string Content { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int CreatedBy { get; set; }

        public PostModel()
        {
        }

        public PostModel(int postId, string postName, string content, DateTime createdAt, DateTime updatedAt, int createdBy)
        {
            PostID = postId;
            PostName = postName;
            Content = content;
            CreatedAt = createdAt;
            UpdatedAt = updatedAt;
            CreatedBy = createdBy;
        }

        public PostModel(string postName, string content, int createdBy)
        {
            PostName = postName;
            Content = content;
            CreatedBy = createdBy;
        }

        public List<PostModel> GetAll()
        {
            string query = "SELECT * FROM posts";
            DataTable dataTable = base.GetDataBySql(query);
            if (dataTable.Rows.Count <= 0)
            {
                return null;
            }
            else
            {
                List<PostModel> listOfPosts = new List<PostModel>();
                foreach (DataRow row in dataTable.Rows)
                {
                    listOfPosts.Add(new PostModel(
                        row.Field<int>("post_id"),
                        row.Field<string>("post_name"),
                        row.Field<string>("content"),
                        row.Field<DateTime>("updated_at"),
                        row.Field<DateTime>("created_at"),
                        row.Field<int>("created_by")));
                }

                return listOfPosts;
            }
        }

        public void Add(PostModel post)
        {
            SqlParameter[] sqlParameters =
            {
                new SqlParameter("@post_name", post.PostName),
                new SqlParameter("@content", post.Content),
                new SqlParameter("@created_by", post.CreatedBy)
            };

            base.GetDataByStoredProcedure("sp_add_post", sqlParameters);
        }

        public void Add()
        {
            SqlParameter[] sqlParameters =
            {
                new SqlParameter("@pPostName", PostName),
                new SqlParameter("@pContent", Content),
                new SqlParameter("@pCreatedBy", CreatedBy)
            };

            base.ExecuteSqlWithParameters(
                "exec sp_add_post @post_name = @pPostName, @content = @pContent, @created_by = @pCreatedBy",
                sqlParameters);
        }
    }
}