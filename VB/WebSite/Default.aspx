<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxHiddenField"
	TagPrefix="dxhf" %>
<%@ register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxGridView"
	TagPrefix="dxwgv" %>
<%@ register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors"
	TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title></title>
	  <script type="text/javascript">
		function ProcessValueChanged(key,animalName,colourID) 
		{

			var currentKey = "key" + key.toString();


			if (!clientHiddenField.Contains(currentKey)) 
			{

				clientHiddenField.Add(currentKey, animalName+";"+colourID);
			}


			else 
			{
				clientHiddenField.Set(currentKey, animalName + ";" + colourID);
			}
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	 <dxwgv:aspxgridview ID="ASPxGridView1" runat="server"  KeyFieldName="ID" AutoGenerateColumns="False"
		SettingsBehavior-AllowDragDrop="False"  ClientInstanceName="clientGridView">
				<Columns>

				  <dxwgv:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" Width="15px">
				  </dxwgv:GridViewDataTextColumn>

				  <dxwgv:GridViewDataTextColumn FieldName="Animal" VisibleIndex="1">

					<DataItemTemplate> 
					   <dxe:ASPxTextBox ID="tbWbsLevel" runat="server"  Text='<%#Bind("Animal")%>' Size="6" OnDataBound="tbWbsLevel_Load" >
					   </dxe:ASPxTextBox> 
				   </DataItemTemplate> 

				</dxwgv:GridViewDataTextColumn>

			   <dxwgv:GridViewDataTextColumn FieldName="ColourID" Caption="Colour" VisibleIndex="2" >
				   <dataitemtemplate>
					 <dxe:aspxcombobox ID="colourBox" runat="server" Value='<%#Bind("ColourID")%>' OnDataBound="colourBox_Load">
					   <items>
						 <dxe:listedititem Text="Red" Value="1" />
						 <dxe:listedititem Text="Gray" Value="2" />
						 <dxe:listedititem Text="Brown" Value="3" />
						 <dxe:listedititem Text="Black" Value="4" />
					   </items>
					 </dxe:aspxcombobox>
				   </dataitemtemplate>
			   </dxwgv:GridViewDataTextColumn>
</Columns>

		   <settingsbehavior AllowDragDrop="False" />
		   <settingspager PageSize="5">
		   </settingspager>

		  </dxwgv:aspxgridview>

	<dxhf:aspxhiddenfield runat="server" ID="hiddenField" 
			ClientInstanceName="clientHiddenField">
	</dxhf:aspxhiddenfield>
		<br />
		<dxe:aspxbutton ID="btnUpdate" runat="server" Text="Update" 
			OnClick="btnUpdate_Click">
		</dxe:aspxbutton>
	</form>
</body>
</html>