<%@ Page Title="" Language="C#" MasterPageFile="~/Master_admin.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    SqlConnection con = new SqlConnection("server=DESKTOP-H4F6IAP\\SQLEXPRESS;database=FILE_HOST;integrated security=sspi");

    protected void btn_save_Click(object sender, EventArgs e)
    {
        Random rnd = new Random();
        txt_pass.Text = rnd.Next(1000, 1000000).ToString();
        string sql = "insert into USERS (USER_NAME,EMAIL,PASS,USER_TYPE) values(@name,@email,@pass,@type)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@name", txt_name.Text);
        cmd.Parameters.AddWithValue("@email", txt_email.Text);
        cmd.Parameters.AddWithValue("@pass", txt_pass.Text);
        cmd.Parameters.AddWithValue("@type", drop_users.SelectedValue);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        lbl_message.Text = "تمت اضافة المستخدم بنجاح";

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style3 {
        width: 100%;
    }
    .auto-style4 {
        width: 162px;
    }
    .auto-style5 {
        font-size: medium;
    }
    .auto-style6 {
        width: 162px;
        text-align: left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
    <tr>
        <td class="auto-style6">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style5" Text="اسم المستخدم"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_name" runat="server" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">
            <asp:Label ID="Label2" runat="server" CssClass="auto-style5" Text="البريد الالكتروني"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_email" runat="server" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">
            <asp:Label ID="Label3" runat="server" CssClass="auto-style5" Text="كلمة المرور"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_pass" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">
            <asp:Label ID="Label4" runat="server" CssClass="auto-style5" Text="نوع المستخدم"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="drop_users" runat="server" Width="127px">
                <asp:ListItem Value="1">طالب</asp:ListItem>
                <asp:ListItem Value="2">معلم</asp:ListItem>
                <asp:ListItem Value="3">مشرف موقع</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">&nbsp;</td>
        <td>
            <asp:Label ID="lbl_message" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td>
            <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" Text="حفظ المستخدم" />
        </td>
    </tr>
</table>
</asp:Content>

