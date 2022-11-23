<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Sistema_Ventas.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <h1>SISTEMA DE VENTAS</h1>
            <label>Ingrese el codigo del Cajero:&nbsp;&nbsp; </label> 
            <asp:DropDownList ID="DDL_CODCAJERO" runat="server" DataSourceID="SqlDataSource1" DataTextField="Codigo_Cajero" DataValueField="Codigo_Cajero">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema_VentasConnectionString %>" SelectCommand="SELECT [Codigo_Cajero] FROM [Mae_Cajeros]"></asp:SqlDataSource>
            <label>
            <br />
            <br />
            Ingrese el codigo del Producto:&nbsp;&nbsp; </label>
            <asp:DropDownList ID="DDL_CODPRODUCTO" runat="server" DataSourceID="SqlDataSource2" DataTextField="Codigo_Producto" DataValueField="Codigo_Producto">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema_VentasConnectionString %>" SelectCommand="SELECT [Codigo_Producto] FROM [Mae_Productos]"></asp:SqlDataSource>
            <label>
            <br />
            <br />
            Ingrese el codigo de la Maquina Registradora:&nbsp;&nbsp; </label><asp:DropDownList ID="DDL_CODMR" runat="server" DataSourceID="SqlDataSource3" DataTextField="Codigo_MaqRegis" DataValueField="Codigo_MaqRegis"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Sistema_VentasConnectionString %>" SelectCommand="SELECT [Codigo_MaqRegis] FROM [Mae_Maquinas_Registradoras]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="BIngresar" runat="server" Height="41px" Text="Agregar Venta" Width="161px" OnClick="BIngresar_Click" />
            <br />
            <br />

            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
