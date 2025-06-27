<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="ProyectoEcommerceNw.Catalogo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href='<%= ResolveUrl("~/estilos/estilos.css") %>' rel="stylesheet" type="text/css" />
    <div style="display: flex; flex-wrap: wrap; gap: 20px;">
        <asp:Repeater ID="rptCatalogo" runat="server" OnItemCommand="rptCatalogo_ItemCommand">
            <ItemTemplate>
                <div style="width: 250px; border: 1px solid #ddd; border-radius: 10px; padding: 16px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); font-family: Arial, sans-serif;">
                    <h3 style="font-size: 18px;"><%# Eval("NomPro") %></h3>
                    <p style="color: #888;"><%# Eval("DesPro") %></p>
                    <p style="font-size: 16px; color: #2e8b57; font-weight: bold;">L. <%# Eval("PrePro", "{0:N2}") %></p>

                    <div style="display: flex; align-items: center; gap: 5px; margin-bottom: 10px;">
                        <asp:Button ID="btnMenos" runat="server" Text="−" CommandName="Menos" CommandArgument='<%# Container.ItemIndex %>' style="width: 30px;" />
                        <asp:TextBox ID="txtCantidad" runat="server" Text="1" Width="40px" style="text-align: center;" />
                        <asp:Button ID="btnMas" runat="server" Text="+" CommandName="Mas" CommandArgument='<%# Container.ItemIndex %>' style="width: 30px;" />
                    </div>

                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar a la Carretilla"
                        CommandName="Agregar"
                        CommandArgument='<%# Eval("IdPro") + "|" + Container.ItemIndex %>'
                        style="background-color: #2e8b57; color: white; border: none; padding: 10px; border-radius: 5px;" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <hr />

</asp:Content>
