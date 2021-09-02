<%@ Page Title="" Language="C#" MasterPageFile="~/Master_teacher.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<script runat="server">
    SqlConnection con = new SqlConnection("server=DESKTOP-H4F6IAP\\SQLEXPRESS;database=FILE_HOST;integrated security=sspi");


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_add_Click(object sender, EventArgs e)
    {
        string sql = "insert into COURSES (COURSE_ID,COURSE_NAME) values (@id,@name)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@id", txt_id.Text);
        cmd.Parameters.AddWithValue("@name", txt_name.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        lbl_message.Text = "تمت اضافة المقرر بنجاح";

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 186px;
        }
        .auto-style5 {
            width: 186px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label1" runat="server" Font-Names="Tahoma" Text="رقم المقرر"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label2" runat="server" Font-Names="Tahoma" Text="اسم المقرر"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_name" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Label ID="lbl_message" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Button ID="btn_add" runat="server" OnClick="btn_add_Click" Text="اضافة المقرر" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

