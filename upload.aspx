<%@ Page Title="" Language="C#" MasterPageFile="~/Master_teacher.master" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<script runat="server">
    SqlConnection con = new SqlConnection("server=DESKTOP-H4F6IAP\\SQLEXPRESS;database=FILE_HOST;integrated security=sspi");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string sql = "select * from COURSES";
            SqlDataAdapter da = new SqlDataAdapter(sql,con);
            DataTable dt_course = new DataTable();
            da.Fill(dt_course);
            drop_courses.DataSource = dt_course;
            drop_courses.DataTextField = "COURSE_NAME";
            drop_courses.DataValueField = "COURSE_ID";
            drop_courses.DataBind();
        }
    }

    protected void btn_upload_Click(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (myfileupload.HasFiles)
        {
            string ext = System.IO.Path.GetExtension(myfileupload.FileName);
            string file_name = "";
            file_name = file_name + Session["user"].ToString() + "_";
            file_name = file_name + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString();
            file_name += DateTime.Now.Day.ToString();
            file_name += DateTime.Now.Hour.ToString();
            file_name += DateTime.Now.Minute.ToString();
            file_name += DateTime.Now.Second.ToString();
            myfileupload.SaveAs(Server.MapPath("files") + "\\" + file_name + ext);
            string path = "~\\files" + file_name + ext;
            string sql = "insert into FILES (TITLE,UPLOAD_DATE,PATH,DOWNLOADS,COURSE_ID,USER_ID)";
            sql = sql + "values(@title,@date,@path,@count,@course,@user)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@title", txt_title.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@path", path);
            cmd.Parameters.AddWithValue("@count", 0);
            cmd.Parameters.AddWithValue("@course", drop_courses.SelectedValue);
            cmd.Parameters.AddWithValue("@user", Session["user"].ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            lbl_message.Text = "تم رفع الملف بنجاح";

        }
        else
        {
            lbl_message.Text="يرجي اختيار الملف المراد رفعه "
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 153px;
        }
        .auto-style5 {
            width: 153px;
            height: 23px;
            text-align: left;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            width: 153px;
            text-align: left;
        }
        .auto-style8 {
            width: 153px;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style3">
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label1" runat="server" Text="وصف الملف"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_title" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label2" runat="server" Text="اسم المقرر"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:DropDownList ID="drop_courses" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label3" runat="server" Text="مكان الملف"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="myfileupload" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Label ID="lbl_message" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8"></td>
            <td class="auto-style6">
                <asp:Button ID="btn_upload" runat="server" Text="رفع الملف" OnClick="btn_upload_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

