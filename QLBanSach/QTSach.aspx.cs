using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBanSach
{
    public partial class QTSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grvSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvSach.PageIndex = e.NewPageIndex;
            grvSach.DataBind();
            string keyword = ViewState["keyword"] != null ? ViewState["keyword"].ToString() : "";
            ApplyFilter(keyword);
        }
        protected void btTraCuu_Click(object sender, EventArgs e)
        {
            string keyword = txtTen.Text.Trim();
            ViewState["keyword"] = keyword;
            ApplyFilter(keyword);
        }
        private void ApplyFilter(string keyword)
        {
            if (!string.IsNullOrEmpty(keyword))
            {
                dsSach.SelectCommand = "SELECT * FROM [Sach] WHERE TenSach LIKE @keyword ORDER BY [NgayCapNhat]";
                dsSach.SelectParameters.Clear();
                dsSach.SelectParameters.Add("keyword", "%" + keyword + "%");
            }
            else
            {
                dsSach.SelectCommand = "SELECT * FROM [Sach] ORDER BY [NgayCapNhat]";
                dsSach.SelectParameters.Clear();
            }
            grvSach.PageIndex = 0;
            grvSach.DataBind();
        }

        protected void grvSach_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "delSuccess",
      "Swal.fire({ icon:'success', title:'Đã xoá', text:'Xoá nhân viên thành công!', confirmButtonText:'Đóng' });",
      true);
        }
    }
}