<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QTSach.aspx.cs" Inherits="QLBanSach.QTSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h2>TRANG QUẢN TRỊ SÁCH</h2>
    <hr />
    <div class="row mb-2">
        <div class="col-md-6 mb-2">
            <div class="form-inline">
                Tựa sách
                <asp:TextBox ID="txtTen" runat="server" placeholder="Nhập tựa sách cần tìm" CssClass="form-control ml-2" Width="300"></asp:TextBox>
                <asp:Button ID="btTraCuu" OnClick="btTraCuu_Click" runat="server" Text="Tra cứu" CssClass="btn btn-info ml-2 m-2" />
            </div>
        </div>
        <div class="col-md-6 text-right">
            <a href="ThemSach.aspx" class="btn btn-success">Thêm sách mới</a>
        </div>
        <div class="col-12 mt-2 ">
            <asp:GridView ID="grvSach" CssClass=" text-center w-100" DataSourceID="dsSach"
                runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaSach" AllowPaging="true"
                PageSize="4" OnPageIndexChanging="grvSach_PageIndexChanging" OnRowDeleted="grvSach_RowDeleted">
                <Columns>
                    <asp:BoundField DataField="TenSach" HeaderText="Tựa Sách" SortExpression="TenSach" />
                    <asp:BoundField DataField="MaCD" HeaderText="Mã Chủ Đề" Visible="false"  SortExpression="TenSach" />
                    <asp:TemplateField HeaderText="Hình">
                        <ItemTemplate>
                            <asp:Image ID="imgHinh" runat="server" CssClass="img-fluid rounded mb-2" Style="height: 100px; object-fit: cover;"
                                ImageUrl='<%#ResolveUrl("~/Bia_sach/" + Eval("Hinh")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Dongia" HeaderText="Đơn Giá" SortExpression="Dongia" />
                    <asp:TemplateField HeaderText="Khuyến Mãi">
                        <ItemTemplate>
                            <asp:Label ID="lblKhuyenMai" CssClass="text-danger" runat="server" Text='<%# Eval("KhuyenMai").ToString() == "True" ? "X" :"" %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="cboKhuyenMai" Checked='<%# Bind("KhuyenMai") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Button ID="btnSua" CssClass="btn btn-primary" 
                                CommandName="Edit" runat="server" Text="Edit" CausesValidation="false" />
                            <asp:Button ID="BtnXoa" CssClass="btn btn-danger" 
                                CommandName="Delete" OnClientClick="return confirmDelete(this)" runat="server" Text="Delete" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" 
                                CssClass="btn btn-primary" CommandName="Update" runat="server" Text="Update" />
                            <asp:Button ID="btnhuy"  
                                CssClass="btn btn-danger" CommandName="Cancel" runat="server" CausesValidation="false" Text="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                <PagerSettings  />
                
            </asp:GridView>
        </div>
    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function confirmDelete(btn) {
            Swal.fire({
                title: 'Xác nhận xoá?',
                text: 'Bạn có chắc muốn xoá nhân viên này?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Xoá',
                cancelButtonText: 'Huỷ'
            }).then((result) => {
                if (result.isConfirmed) {
                    btn.onclick = null;
                    btn.click();
                }
            });

            return false;
        }

    </script>
</asp:Content>

