<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="verification.aspx.cs" Inherits="verification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cptitle" runat="Server">
    <h1>Student Verification</h1>
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlresult.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    <style>
        th {
            text-align: left;
        }

        p {
            font-family: 'Roboto', sans-serif;
            font-size: 20px;
            line-height: 24px;
            font-weight: bold;
            color: #777777;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="Server">

    <table style="width: 100%;">
        <tr>
            <td style="width: 250px">
                <asp:TextBox ID="txtname" required placeholder="Name" CssClass="form-control" runat="server"></asp:TextBox></td>

            <td style="width: 250px">
                <asp:TextBox ID="txtroll" required Style="text-transform: uppercase" CssClass="form-control" runat="server" placeholder="RollNo"></asp:TextBox>
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="btn btn-default">Search</asp:LinkButton>
                <asp:LinkButton ID="lnkclear" runat="server" OnClick="lnkclear_Click" CssClass="btn btn-danger">Clear</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-info" OnClientClick="return PrintPanel();">Print</asp:LinkButton>


            </td>
        </tr>

    </table>

    <asp:Panel ID="pnlresult" Visible="false" runat="server">
        <div style="width: 900px; padding: 10px; border: 1px solid #bbb3b3; margin-top:40px">
            <div style="margin: 0px auto; width: 872px; text-align: center">
                <h3 style="font-size: 82px; text-transform:uppercase; margin-bottom: 0px; font-family: fantasy; color: #415ba6;">Future Vision Institute</h3>
                <p>SCO-27, 1st Floor, Shaheed Bhagat Singh Market , Near Bittu Fax, MOGA-142001</p>
            </div>
            <div style="margin: 0px auto; width: 900px">

                <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_ItemDataBound">
                    <ItemTemplate>

                        <div style="margin: 0px auto; width: 842px; padding: 40px 0px">
                            <table style="width: 100%;" class="table table-bordered">
                                <tr>
                                    <td style="width: 64px; height: 20px;" colspan="6"><b>C.No</b></td>
                                    <td style="width: 82px; height: 20px;">
                                        <asp:Label ID="lblcno" runat="server" Text='<%#Eval("cno") %>'></asp:Label></td>
                                    <td style="width: 72px; height: 20px;"><b>RollNo :</b></td>
                                    <td style="width: 224px; height: 20px;">
                                        <asp:Label ID="lblroll" runat="server" Text='<%#Eval("rollno") %>'></asp:Label></td>
                                    <td style="width: 82px; height: 20px;"><b>Name : </b></td>
                                    <td style="width: 286px; height: 20px;">
                                        <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                        /
                                    <asp:Label ID="lblf" runat="server" Text='<%#Eval("fname") %>'></asp:Label>
                                    </td>
                                    <td style="width: 107px; height: 20px;"><b>Course :</b></td>
                                    <td style="height: 20px">
                                        <asp:Label ID="lblcourse" runat="server" Text='<%#Eval("courseid") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6"><b>Issue: </b></td>
                                    <td>
                                        <asp:Label ID="lbldate" runat="server" Text='<%#Eval("date") %>'></asp:Label>
                                    </td>
                                    <td><b>From/To</b></td>
                                    <td style="width: 224px">
                                        <asp:Label ID="lblyear" runat="server" Text='<%#Eval("timefrom") %>'></asp:Label>
                                        &nbsp;/
                                <asp:Label ID="lblto" runat="server" Text='<%#Eval("timeto") %>'></asp:Label></td>
                                    <td style="width: 82px"><b>Duration</b></td>
                                    <td style="width: 286px">
                                        <asp:Label ID="lblduration" runat="server" Text='<%#Eval("duration") %>'></asp:Label></td>
                                    <td><b>Place :</b></td>
                                    <td>
                                        <asp:Label ID="lblplace" runat="server" Text='<%#Eval("place") %>'></asp:Label>
                                    </td>
                                </tr>

                            </table>

                            <asp:GridView ID="gvresult" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-bordered" Width="100%" OnRowDataBound="gvresult_RowDataBound">
                                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                                <Columns>
                                    <asp:BoundField DataField="Subject" HeaderText="Subject"></asp:BoundField>
                                    <asp:TemplateField HeaderText="TotalMarks">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotal" runat="server" Text='<%#Eval("MarksObtained") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MaxMarks">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmax" runat="server" Text='<%#Eval("MaxMarks") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="MinMarks" HeaderText="MinMarks"></asp:BoundField>

                                </Columns>
                                <EditRowStyle BackColor="#2461BF"></EditRowStyle>

                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>

                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White"></PagerStyle>

                                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left"></RowStyle>

                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#F5F7FB"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#6D95E1"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#E9EBEF"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#4870BE"></SortedDescendingHeaderStyle>
                                <Columns>
                                </Columns>
                            </asp:GridView>

                            <table style="width: 90%;">
                                <tr>

                                    <td style="width: 124px"><b>Total : </b>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbltotal" runat="server" Text="" CssClass="label label-info"></asp:Label></td>
                                    <td style="width: 288px">&nbsp;</td>
                                    <td style="width: 124px"><b>Obtained : </b></td>
                                    <td>
                                        <asp:Label ID="lblobt" runat="server" Text="" CssClass="label label-success"></asp:Label></td>
                                    <td style="width: 288px">&nbsp;</td>
                                    <td style="width: 124px"><b>Percentage</b> </td>
                                    <td>
                                        <asp:Label ID="lblper" runat="server" Text="" CssClass="label label-primary"></asp:Label></td>
                                    <td style="width: 288px">&nbsp;</td>
                                    <td style="width: 124px"><b>Grade :</b></td>
                                    <td>
                                        <asp:Label ID="lblgrade" runat="server" Text="" CssClass="label label-danger"></asp:Label></td>
                                </tr>

                            </table>
                        </div>
                    </ItemTemplate>
                </asp:ListView>


            </div>
            <table style="width: 100%;">
                <tr>
                    <td style="width: 165px">&nbsp;</td>
                    <td class="text-center"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 165px">&nbsp;</td>
                    <td class="text-center"></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>

                    <td></td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>

