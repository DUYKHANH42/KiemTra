using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            try
            {
                string tensach = txtTen.Text;
                string dongia = txtDonGia.Text;
                string machude = ddlChuDe.SelectedValue;
                string khuyenmai = chkKhuyenMai.Checked.ToString();
                string hinh = "";
                DateTime ngay = DateTime.Now;
                string ngaycapnhat = ngay.ToString();
                if (FHinh.HasFile)
                {
                    string folder = Server.MapPath("~/Bia_sach/");
                    string fileName = Guid.NewGuid().ToString() + ".jpg";
                    string path = Path.Combine(folder, fileName);
                    FHinh.SaveAs(path);
                    hinh = fileName;
                }
                dsSach.InsertParameters["tensach"].DefaultValue = tensach;
                dsSach.InsertParameters["dongia"].DefaultValue = dongia;
                dsSach.InsertParameters["macd"].DefaultValue = machude;
                dsSach.InsertParameters["khuyenmai"].DefaultValue = khuyenmai;
                dsSach.InsertParameters["hinh"].DefaultValue = hinh;
                dsSach.InsertParameters["ngaycapnhat"].DefaultValue = ngaycapnhat;
                dsSach.Insert();
                ScriptManager.RegisterStartupScript(this, GetType(), "success",
             "Swal.fire({ " +
             "icon: 'success', " +
             "title: 'Thành công', " +
             "text: 'Thêm hoa mới thành công!', " +
             "confirmButtonText: 'Đóng', " +
             "showCloseButton: true " +
             "});",
             true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
              "Swal.fire({ " +
              "icon: 'error', " +
              "title: 'Lỗi', " +
              "text: 'Thêm hoa thất bại!', " +
              "confirmButtonText: 'Đóng', " +
              "showCloseButton: true " +
              "});",
              true);

            }

        }
    }
}