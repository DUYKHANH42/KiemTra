<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="QLBanSach.ThemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h2>THÊM SÁCH MỚI</h2>
    <hr />
    <div class="w-100">

        <div class="form-group">
            <label class="font-weight-bold">Tên sách</label>
            <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Đơn giá</label>
            <asp:TextBox ID="txtDonGia" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Chủ đề</label>
            <asp:DropDownList ID="ddlChuDe" DataTextField="tencd" DataValueField="macd" DataSourceID="dsChuDe" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Ảnh bìa sách</label>
            <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control-file" />
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Khuyến mãi</label>
            <asp:CheckBox ID="chkKhuyenMai" runat="server" Checked="true" CssClass="form-check" />
        </div>
        <asp:Button ID="btXuLy" OnClick="btXuLy_Click" runat="server" Text="Lưu" CssClass="btn btn-success" />
    </div>
    <br />
    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachDBConnectionString %>"
        SelectCommand="SELECT * FROM [Sach] ORDER BY [NgayCapNhat]" DeleteCommand="DELETE FROM [Sach] WHERE [MaSach] = @MaSach"
        InsertCommand="INSERT INTO [Sach] ([TenSach], [Dongia], [MaCD], [Hinh], [KhuyenMai], [NgayCapNhat]) VALUES (@TenSach, @Dongia, @MaCD, @Hinh, @KhuyenMai, @NgayCapNhat)"
        UpdateCommand="UPDATE [Sach] SET [TenSach] = @TenSach, [Dongia] = @Dongia,  [KhuyenMai] = @KhuyenMai WHERE [MaSach] = @MaSach">
        <DeleteParameters>
            <asp:Parameter Name="MaSach" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenSach" Type="String" />
            <asp:Parameter Name="Dongia" Type="Int32" />
            <asp:Parameter Name="MaCD" Type="Int32" />
            <asp:Parameter Name="Hinh" Type="String" />
            <asp:Parameter Name="KhuyenMai" Type="Boolean" />
            <asp:Parameter Name="NgayCapNhat" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenSach" Type="String" />
            <asp:Parameter Name="Dongia" Type="Int32" />
            <asp:Parameter Name="KhuyenMai" Type="Boolean" />
            <asp:Parameter Name="MaSach" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsChuDe" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachDBConnectionString %>" SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
