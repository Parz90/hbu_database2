 Listing 1: Implementing a Disconnected Data Management Strategy

using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

class DisconnectedDataform : Form
{
	private SqlConnection  conn;
	private SqlDataAdapter daCustomers;

	private DataSet  dsCustomers;
	private DataGrid dgCustomers;

	private const string tableName = "Customers";

	// initialize form with DataGrid and Button
	public DisconnectedDataform()
	{
		// fill dataset
		Initdata();

		// set up datagrid
		dgCustomers = new DataGrid();
		dgCustomers.Location = new Point(5, 5);
		dgCustomers.Size = new Size(		
            this.ClientRectangle.Size.Width - 10,		
            this.ClientRectangle.Height - 50);
		dgCustomers.DataSource = dsCustomers;
		dgCustomers.DataMember = tableName;

		// create update button
		Button btnUpdate = new Button();
		btnUpdate.Text = "Update";
		btnUpdate.Location = new Point(
			this.ClientRectangle.Width/2 - btnUpdate.Width/2,
			this.ClientRectangle.Height - (btnUpdate.Height + 10));
		btnUpdate.Click += new EventHandler(btnUpdateClicked);

		// make sure controls appear on form
		Controls.AddRange(new Control[] { dgCustomers, btnUpdate });
	}

	// set up ADO.NET objects
	public void Initdata()
	{
		// instantiate the connection
		conn = new SqlConnection(
			"Server=(local);DataBase=Northwind;Integrated Security=SSPI");
		
		// 1. instantiate a new DataSet
		dsCustomers = new DataSet();

		// 2. init SqlDataAdapter with select command and connection
		daCustomers = new SqlDataAdapter(
			"select CustomerID, CompanyName from Customers", conn);

		// 3. fill in insert, update, and delete commands
		SqlCommandBuilder cmdBldr = new SqlCommandBuilder(daCustomers);
		
		// 4. fill the dataset
		daCustomers.Fill(dsCustomers, tableName);
	}

	// Update button was clicked
	public void btnUpdateClicked(object sender, EventArgs e)
	{
		// write changes back to DataBase
		daCustomers.Update(dsCustomers, tableName);
	}

	// start the Windows form
	static void Main()
	{
		Application.Run(new DisconnectedDataForm());
	}
 }