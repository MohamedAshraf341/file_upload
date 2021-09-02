<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<!DOCTYPE html>

<script runat="server">
    SqlConnection con = new SqlConnection("server=DESKTOP-H4F6IAP\\SQLEXPRESS;database=FILE_HOST;integrated security=sspi");

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql = "select * from USERS where EMAIL=@email and PASS=@pass";
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.Parameters.AddWithValue("@email",txt_email.Text);
        cmd.Parameters.AddWithValue("@pass", txt_password.Text);
        //SqlDataReader r;
        //con.OpenAsync();
        //r = cmd.ExecuteReader();
        //if (r.HasRows)
        //{
        //    string user_type = "";
        //    while (r.Read())
        //    {
        //        Session["USERS"] = r["USER_ID"].ToString();
        //        user_type = r["USER_TYPE"].ToString();
        //    }
        //    con.Close();
        //    if (user_type == "2")
        //    {
        //        Response.Redirect("upload.aspx");
        //    }
        //}
        //else
        //{
        //    lbl_error.Text = "خطأ في الدخول";
        //}
        //con.Close();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);  
        DataTable dt = new DataTable();  
        sda.Fill(dt);  
        con.Open();  
        int i = cmd.ExecuteNonQuery();  
        con.Close();  
  
        if (dt.Rows.Count > 0) {  
            Response.Redirect("upload.aspx");  
        } else {  
            lbl_error.Text = "Your username and word is incorrect";  
            lbl_error.ForeColor = System.Drawing.Color.Red;  
  
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 500px;
        }
        .auto-style4 {
            width: 292px;
            text-align: right;
        }
    </style>
</head>
<body style="margin-top:0px;margin-right:0px;margin-left:0px">
    <form id="form1" runat="server">
    <div style="width:100%;height:120px;background:#d9d2d2">
    
    </div>
        <table align="center" class="auto-style2">
            <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="txt_email" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="البريد الالكتروني"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="txt_password" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="كلمة المرور"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" Text="دخول" OnClick="Button1_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
